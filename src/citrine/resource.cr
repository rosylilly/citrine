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

  macro attribute(name, type)
    {% name = name.var if name.is_a?(DeclareVar) %}

    def {{name.id}}
      @{{name.id}}
    end

    def {{name.id}}(@{{name.id}} : {{type.id}})
    end

    def {{name.id}}=(@{{name.id}} : {{type.id}})
    end
  end

  abstract def initialize(*args)
  abstract def initialize(&block : self ->)
  abstract def plan : String
  abstract def apply!

  def configure(&block)
    with self yield

    self
  end
end

require "./resource/*"
