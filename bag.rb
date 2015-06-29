require_relative 'exceptions'
require_relative 'outputformatter'


class Bag
  include Enumerable
  # Create the bag
  def initialize
    @bag = Hash.new
  end
  

  ## => Booleans
  #Do we have the item?
  def has?(amount, item)
    @bag.has_key?(item) and @bag[item] >= amount
  end
  
  ## => Insertions / Deletions
  def add(amount, item)
    unless amount > 0  
      raise Exceptions::NotEnoughError
      "Value must be greater than 0"
    end
    if @bag.has_key?(item) 
     @bag[item] += amount
    else
     @bag[item] = amount
    end
  end

  def add_all(other)
    other.each do |item, amount|
      self.add(amount, item)
    end
  end

  # Someone bought my things
  def remove(amount, item)
    @bag[item] -= amount unless amount >= @bag[item]
  end

  def remove_all(other)
    other.each do |item, amount|
      @bag.remove(amount, items)
    end
  end

  ## => Iterating
  def each(&block)
    @bag.each(&block)
  end

  ## => Formating
  # Let me know how many things are in my bag man.
  def print
    puts "Current Inventory"
    @bag.each {|item, amount| puts "  #{item}: #{amount}"}
  end
end
