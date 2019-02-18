# public
require 'sinatra'
require 'Singleton'
# usr libs
require_relative 'Character'
require_relative 'Enemy'

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

warrior = Job.new atk: 8, def: 6
defined = [:index, :crafters, :heroes, :hero_form, :collect, :monsters]
heroes = []
# Monsters
qualiox = Enemy.new "Qualiox"
qualiox.text = "This tiny, snake-like, infernal monster lairs in city sewers.
It attacks with crushing blows, thrown weapons and scorching gas.
It can only be harmed by nonmagical weapons.
They lair in mobs of 3-10."

cockatrice = Enemy.new "Cockatrice"
cockatrice.text = "This massive, feathered creature lives in icy climes.
It ensares its prey, which includes medium-sized creatures,
monstrous humanoids, and large creatures.
It attacks with strangling grabs, a petrifying gaze and toxic bites."

zardbear = Enemy.new "Zardbear"
zardbear.text = "This bear-sized frog-like monster makes its home in mountains.
It attacks with spines, debilitating effects and elemental magic."
monsters = [qualiox, cockatrice, zardbear]

crafters = {
  blacksmith: {cost: 3, item: "iron", display: "Iron Shard", result: "Iron Sword"},
  leatherworker: {cost: 3, item: "fur", display: "Animal Fur", result: "Hide Armor"},
  tailor: {cost: 5, item:"silk", display: "Worm Silk", result: "Cloak"},
  alchemist: {cost: 4, item: "herb", display: "Herb", result: "Health Potion"},
}

post '/heroes' do
  heroes.push Character.new params['name'], warrior
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
  @monsters = monsters
  @crafters = crafters
  if defined.include? n.to_sym
    haml n.to_sym
  else
    "Hello #{n}!"
  end
end
