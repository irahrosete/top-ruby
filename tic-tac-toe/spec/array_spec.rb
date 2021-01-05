require_relative "../lib/array"

describe Array do
  context "#all_empty?" do
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

  context "all_same?" do
    it "returns true if all elements are the same" do
      expect(["X", "X", "X"].all_same?).to be_truthy
    end
    it "returns false if all elements are not the same" do
      expect(["X", "O", "X"].all_same?).to be_falsey
    end
    it "returns true if the array is empty" do
      expect([].all_same?).to be_truthy
    end
  end

  context "any_empty?" do
    it "returns true if any element of the array is empty" do
      expect(["", "X", ""].any_empty?).to be_truthy
    end
    it "returns false if all element of the array is not empty" do
      expect(["X", "X", "O"].any_empty?).to be_falsey
    end
  end

    context "none_empty?" do
    it "returns false if any element of the array is empty" do
      expect(["", "X", ""].none_empty?).to be_falsey
    end
    it "returns true if all element of the array is not empty" do
      expect(["X", "X", "O"].none_empty?).to be_truthy
    end
  end
end