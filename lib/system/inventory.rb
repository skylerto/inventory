require_relative 'bag'
require 'singleton'

class Inventory
  include Singleton

  @bag = Bag.new  
  
  def initialize()
    @bag = Bag.new
  end

  def add(amount, item)
    @bag.add(amount, item)
  end

  def remove_all(bag)
    @bag.remove_all(bag)
  end

  def has?(amount, item)
    @bag.has?(amount, item)
  end

  def print
    @bag.print
  end

end
