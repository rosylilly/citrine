class Citrine::Resource::Directory < Citrine::Resource
  register_dsl :directory

  attribute :action, Symbol, default: :create
  attribute :path, String, default: ""
  attribute :mode, Int32, default: 0o777

  @exists = false
  getter? :exists

  def initialize
  end

  def initialize(@path : String)
  end
end
