require 'House.rb'
require 'Person.rb'
require 'Thief.rb'
require 'World.rb'
require 'Bank.rb'
require 'Events.rb'
require 'advanced_key.rb'
require 'Counterfeit.rb'

world = World.new

thieves = Array["Bob", "Tom", "Luke", "George", "Allison", "Nick",
                "Elena", "Penelope", "Shirly"]

thieves.each{
  |name|

  key = Key.new rand 100
  house = House.new name
  house.setKey key

  person = Thief.new name, house, key
  world.add_person person
  world.add_house house
}

counterfeits = Array["Sarah", "John", "David", "Michael",
                "Maddie", "Sam", "Alex", "Jeff"]

counterfeits.each{
  |name|

  key = Key.new rand 100
  house = House.new name
  house.setKey key

  person = Counterfeit.new name, house, key
  world.add_person person
  world.add_house house
}

Events.mute

attempts_to_run = 100
world.run attempts_to_run
puts "--------------------------------------------"
world.show_results

Events.print_stats