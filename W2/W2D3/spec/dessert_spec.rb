require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Charlie") }
  subject(:pie) { Dessert.new("pie", 10, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(pie.type).to eq("pie")
    end

    it "sets a quantity" do
      expect(pie.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(pie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("ice cream", "hella", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(pie.ingredients.push("flour")).to eq(["flour"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(pie.mix!).to eq([])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(pie.eat(5)).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { pie.eat(20) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Charlie the Great Baker")
      expect(pie.serve).to eq("Chef Charlie the Great Baker has made 10 pies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(pie)
      pie.make_more
    end
  end
end
