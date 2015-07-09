require_relative 'bag'
require 'singleton'

module System
class Inventory
  include Singleton

  @bag = Bag.new

  def initialize()
    @bag = Bag.new
  end

  def self.add(amount, item)
    @bag.add(amount, item)
  end

  def self.add_all(bag)
    @bag.add_all(bag)
  end

  def self.remove_all(bag)
    @bag.remove_all(bag)
  end

  def self.remove(amount, item)
    @bag.remove(amount, item)
  end

  def self.has?(amount, item)
    @bag.has?(amount, item)
  end

  def self.print
    @bag.print
  end
end
end
