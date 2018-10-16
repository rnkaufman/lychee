require "dotenv"
require "httparty"

class IngredientFinder
  attr_reader :upc_number

  Dotenv.load(".env")
  USDA_API_KEY = ENV['USDA_API_KEY']

  def initialize(upc_number)
    @upc_number = upc_number
  end

  def list_ingredients
    ndb_item_number = fetch_ndb_item_number
    if ndb_item_number
      item_endpoint = "https://api.nal.usda.gov/ndb/reports/?ndbno=#{ndb_item_number}&type=b&format=json&api_key=#{USDA_API_KEY}"
      response = HTTParty.get(item_endpoint)
      begin
        response["report"]["food"]["ing"]["desc"]
      rescue
        raise "No ingredients found for upc_number '#{@upc_number}'"
      end
    end
  end

  private
  def fetch_ndb_item_number
    search_endpoint = "https://api.nal.usda.gov/ndb/search/?format=json&q=#{@upc_number}&sort=n&max=25&offset=0&api_key=#{USDA_API_KEY}"
    response = HTTParty.get(search_endpoint)

    begin    
      response["list"]["item"][0]["ndbno"]
    rescue
      raise "No items matching upc_number '#{@upc_number}' were found"
    end
  end
end
