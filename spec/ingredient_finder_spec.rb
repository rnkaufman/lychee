require 'vcr'
require 'ingredient_finder'

RSpec.describe IngredientFinder do
  subject { IngredientFinder.new("Trader Joe's Acacia Honey") }
  describe "#list_ingredients" do
    context "with discovered item", :vcr do
      it "returns the ingredients" do
        expect(subject.list_ingredients).to eq("HONEY, BLACK SUMMER TRUFFLE PIECES, NATURAL MUSHROOM FLAVOR.")
      end
    end 
  end
end
