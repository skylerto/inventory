require_relative 'bag'
module  Test
  def Test.setup
   puts "*Setup testing suite*"
    @bag = Bag.new
    
    puts "  -> Add 5 cows and 10 cats"
    @bag.add(5, "Cows")
    @bag.add(10, "Cats")
    @bag.print
 end

  def Test.add
    puts "***Testing additions***"
    puts "  -> Adding 3 frogs"
    @bag.add(3, "Frogs")
    @bag.print
    puts ""
   
    puts "  -> Add a negative number"
    @bag.add(-1, "Things")
    puts ""

    puts "  -> Create new bag and add items"
    other = Bag.new
    other.add(1, "Deer")
    other.add(2, "Moose")
    other.add(3, "Snakes")
    other.add(1, "Cats")
    @bag.add_all(other)
    @bag.print
  end

  def Test.remove
   @bag.remove(2, "Cows")
   @bag.print
   @bag.remove(15, "Cows")
   @bag.print
  end

  def Test.has
    puts @bag.has?(11, "Cats") ? "I do have 11 cats" : "I don't have 11 cats"
  end
end

Test::setup
Test::add
Test::remove
Test::has
