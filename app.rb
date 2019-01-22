require 'sinatra'
require 'Singleton'

set :public_folder, File.dirname(__FILE__) + '/static'

class Bag
  include Singleton
  attr_accessor :inv
  def initialize
    @inv = {
      "iron" => 0,
      "fur" => 0,
      "silk" => 0,
      "herb" => 0,
    }
  end
end

defined = [:index, :crafters, :heroes, :form, :collect]
heroes = []
crafters = {
  blacksmith: {cost: 3, item: "iron", display: "Iron Shard", result: "Iron Sword"},
  leatherworker: {cost: 3, item: "fur", display: "Animal Fur", result: "Hide Armor"},
  tailor: {cost: 5, item:"silk", display: "Worm Silk", result: "Cloak"},
  alchemist: {cost: 4, item: "herb", display: "Herb", result: "Health Potion"},
}

post '/heroes' do
  heroes.push params['name']
  @heroes = heroes
  haml :heroes
end

post '/collect' do
  Bag.instance.inv[params['item']] += 1
  true
end

post '/crafters' do
  crafter = crafters[params['crafter'].to_sym]
  unless Bag.instance.inv[crafter[:item]] < crafter[:cost]
    Bag.instance.inv[crafter[:item]] -= crafter[:cost]
    return 'true'
  end
end

get '/:name' do |n|
  @bag = Bag.instance.inv
  @heroes = heroes
  @crafters = crafters
  if defined.include? n.to_sym
    haml n.to_sym
  else
    "Hello #{n}!"
  end
end
