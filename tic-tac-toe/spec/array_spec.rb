require_relative "../lib/array"

describe Array do
  it "returns true if all elements of the array is empty" do
    expect(["", "", ""].all_empty?).to be_truthy
  end
  it "returns false if some elements of the array are not empty" do
    expect(["", "X", ""].all_empty?).to be_falsey
  end
  it "returns true if the array is empty" do
    expect([].all_empty?).to be_truthy
  end
end