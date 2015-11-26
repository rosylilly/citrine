require "../spec_helper"

describe Citrine::Group do
  it "should expect resource" do
    group = Citrine::Group.new(:default)

    group.push(directory("/tmp"))

    assert group.size == 1
  end

  it "should push group" do
    parent = Citrine::Group.new(:parent)
    child = Citrine::Group.new(:child)

    parent.push(child)

    assert parent.size == 1
  end
end
