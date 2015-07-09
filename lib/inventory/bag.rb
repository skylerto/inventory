require_relative 'exceptions'

class Bag
  include Enumerable
  # Create the bag
  def initialize
    @bag = Hash.new
  end

  def size
    @bag.size
  end

  ## => Booleans
  #Do we have the item?
  def has?(amount, item)
    @bag.has_key?(item) and @bag[item] >= amount
  end

  def empty?
    @bag.size == 0
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
    if  @bag.empty?
      puts "empty bag"
      return
    elsif !self.has?(amount, item) 
     puts "not enough"
    else
      @bag[item] -= amount
    end
  end

  def remove_all(other)
    if  @bag.empty?
      puts "empty bag"
      return
    else
      other.each do |item, amount|
        self.remove(amount, item)
      end
    end
  end

  ## => Iterating
  def each(&block)
    @bag.each(&block)
  end

  ## => Formating
  # Let me know how many things are in my bag man.
  def print
    buffer = []
    if @bag.empty?
      buffer << "Bag is empty"
    else
      buffer << "Current Inventory"
      @bag.each do |item, amount| 
        buffer << "  #{item}: #{amount}"
      end
    end
    buffer
  end
end
