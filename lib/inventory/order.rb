require_relative 'exceptions'
require_relative 'dbconnection'

class Order << ActiveRecord::Base
  include Enumerable
  # Create the bag
  def initialize(name)
     @bag = Hash.new

     create_table :"#{name}" do |t|
       t.string :item, null:false
       t.int :amount, null:false
      end
  end

  def size
    @bag.size
  end

  ## => Booleans
  #Do we have the item?
  def has?(amount, item)
    Thing.exists?(:name => item) and Thing.find_by(name: item).amount >= amount
    #@bag.has_key?(item) and @bag[item] >= amount
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
    if Thing.exists?(:name => item)
     # find it in the database
     the_item = Thing.find_by(name: item)
     the_item.amount += amount
     the_item.save
    else
     @bag[item] = amount
     Thing.create(:name => item, :amount => amount)
    end
  end

  # => Should follow
  def add_all(other)
    other.each do |item, amount|
      self.add(amount, item)
    end
  end

  # Someone bought my things
  def remove(amount, item)
    if !self.has?(amount, item) 
     puts "not enough"
    else
      # find it in the database
     the_item = Thing.find_by(name: item)
     the_item.amount -= amount
     the_item.save
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
    Thing.find_each do |a|
        buffer << " #{a.name}: #{a.amount}"
    end
    #buffer << " #{Thing.all}"
  
#    if @bag.empty?
 #     buffer << "Bag is empty"
  #  else
   #   buffer << "Current Inventory"
    #  @bag.each do |item, amount| 
     #   buffer << " #{Thing.find()}"
  
        #"  #{item}: #{amount}"
     # end
   # end
    buffer
  end
end
