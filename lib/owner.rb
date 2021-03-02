require 'pry'
require './lib/cat.rb'
require './lib/dog.rb'

class Owner
  attr_accessor
  attr_writer
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @species = 'human'
    @name = name
    @@all << self
    @cats = []
    @dogs = []
  end

  def self.all
    @@all
  end

  def say_species
    "I am a #{@species}."
  end

  def self.count
    @@all.length
  end
  
  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select {|cat| self == cat.owner}
  end

  def dogs
    Dog.all.select {|dog| self == dog.owner}
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    dogs.each {|dog| dog.mood = 'happy'}
  end

  def feed_cats
    cats.each {|cat| cat.mood = 'happy'}
  end

  def sell_pets
    cats.each {|cat| cat.mood = 'nervous' 
      cat.owner = nil}
    dogs.each {|dog| dog.mood = 'nervous' 
      dog.owner = nil}
  end

  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end

end
