require 'vcr'
require 'ingredient_finder'

RSpec.describe IngredientFinder do
  subject { IngredientFinder.new("00555500") }
  describe "#list_ingredients" do
    context "with discovered item" do
      it "returns the ingredients" do
        VCR.use_cassette("returns_the_ingredients") do
          expect(subject.list_ingredients).to eq("HONEY, BLACK SUMMER TRUFFLE PIECES, NATURAL MUSHROOM FLAVOR.")
        end
      end
    end 
  end
end
