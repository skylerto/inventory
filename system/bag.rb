require_relative 'exceptions'

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

  #def <=>(other)
  #  bag.value <=> other.value
  #end
  
  ## => Insertions / Deletions
  def add(amount, item)
   
    unless amount > 0  
      raise Exceptions::NotEnoughError
      "Value must be greater than 0"
    end
    #if @bag.empty?
    # puts "bag is empty!" 
    #els
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
    puts "Current Inventory"
    @bag.each {|item, amount| puts "  #{item}: #{amount}"}
  end
end
