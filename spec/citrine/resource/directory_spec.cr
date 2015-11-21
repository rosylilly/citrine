require "../../spec_helper"

describe Citrine::Resource::Directory do
  describe "#initialize" do
    it "should receive a directory path" do
      dir = Citrine::Resource::Directory.new("/tmp/test")

      assert dir.path == "/tmp/test"
    end

    it "should receive options block" do
      dir = Citrine::Resource::Directory.new.configure do
        path "/tmp/test"
      end

      assert dir.path == "/tmp/test"
    end
  end
end
