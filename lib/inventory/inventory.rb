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
    if amount > 2147483647
      puts "Value must be less that 2147483647"
    else
        @bag.add(amount, item)
      end
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

  def self.invoice(name, *args)
    puts name
    this_order = args.at(0)
    index = 0
    while index < this_order.size
        puts index
        item = this_order[index]
        puts item
        index += 1
        amount = this_order[index]
        puts amount
        index += 1
        # this order add stuff
        puts
    end
    #args.each do |i|
    #end
  end

  def self.print
    @bag.print
  end
end
end
