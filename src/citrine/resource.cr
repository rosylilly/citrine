abstract class Citrine::Resource
  macro register_dsl(name)
    {% name = name.var if name.is_a?(DeclareVar) %}

    module ::Citrine::DSL
      def {{name.id}}(*args)
        {{@type.id}}.new(*args)
      end

      def {{name.id}}(*args, &block)
        resource = {{@type.id}}.new(*args)

        with resource yield

        resource
      end
    end
  end

  macro attribute(name, type, default = nil)
    {% name = name.var if name.is_a?(DeclareVar) %}

    @{{name.id}} = {{default}}

    def {{name.id}}
      @{{name.id}}
    end

    def {{name.id}}(@{{name.id}} : {{type.id}})
    end

    def {{name.id}}=(@{{name.id}} : {{type.id}})
    end
  end

  abstract def plan : String
  abstract def apply!

  attribute :deps, Array(Citrine::Resource), default: [] of Citrine::Resource

  @only_if = nil
  @not_if = nil

  def only_if(&block : -> Bool)
    @only_if = block
  end

  def not_if(&block : -> Bool)
    @not_if = block
  end

  def only_if(shell : String, args = nil)
    only_if do
      system(shell, args)
    end
  end

  def not_if(shell : String, args = nil)
    not_if do
      !system(shell, args)
    end
  end

  def configure(&block)
    with self yield

    self
  end
end

require "./resource/*"
