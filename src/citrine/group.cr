require "./resource"

class Citrine::Group < Array(Citrine::Resource | Citrine::Group)
  @name = "default"
  getter :name

  def initialize(name, parent = nil)
    super()

    @name = name.to_s
    @parent = parent
  end

  def full_name
    if @parent
      @parent.full_name + "." + name
    else
      name
    end
  end

  def appliable?
    true
  end

  def apply!
    each do |resource|
      resource.apply! if resource.appliable?
    end
  end
end

module Citrine
  def self.root
    @@group ||= Citrine::Group.new("default")
  end

  def self.group_stack
    @@group_stack ||= [root] of Citrine::Group
  end
end

module Citrine::DSL
  def group(name, &block)
    new_group = Citrine::Group.new(name, Citrine.group_stack.last)

    Citrine.group_stack.last.push(new_group)
    Citrine.group_stack.push(new_group)
    with new_group yield
    Citrine.group_stack.pop
  end
end
