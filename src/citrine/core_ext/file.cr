module Citrine::CoreExt::File
  def chmod(path, mode)
    if LibC.chmod(path, mode) == -1
      raise Errno.new("Unable to change directory permission '#{path}'")
    end
  end
end

class File
  extend Citrine::CoreExt::File
end

