require_relative '../inputbuffer'

module Test
  @buffer = InputBuffer.instance
  def Test.add

    # => Add an item
    @buffer.insert("add", 10, "dogs")
    # => Add an order as a hashtable.
    items = Hash.new
    items["Fishes"] = 13
    items["Geckos"] = 12
    items["Snakes"] = 11
    items["Cats"] = 100
    @buffer.insert("order", items)

    items = Hash.new
    items["Parrot"] = 99
    items["Cats"] = 100
    @buffer.insert("receive", items)

   
  end

  def Test.string
    puts @buffer.string
  end

  def Test.remove
    true
  end

end

Test::add
Test::string
Test::remove
