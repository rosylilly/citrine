require "../spec_helper"

describe Citrine::DSL do
  describe "#directory" do
    it "should be a Directory" do
      dir = directory do
        path "/tmp"
      end

      assert dir.is_a?(Citrine::Resource::Directory)
      assert dir.path == "/tmp"
    end

    it "should receive args" do
      dir = directory("/tmp")

      assert dir.is_a?(Citrine::Resource::Directory)
      assert dir.path == "/tmp"
    end
  end
end
