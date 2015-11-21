class Citrine::Resource::Directory < Citrine::Resource
  register_dsl :directory

  @action = :create
  attribute :action, Symbol

  @path = ""
  attribute :path, String

  @mode = 0o777
  attribute :mode, Int32

  @exists = false
  getter? :exists

  def initialize
  end

  def initialize(@path : String)
  end
end
