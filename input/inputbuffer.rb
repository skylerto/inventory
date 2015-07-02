require 'singleton'


# Use a hash to store the command as the key
# and a list of arguments as the value.
# Store all that in an array so we know what's
# happened first.
class InputBuffer
  include Singleton
  @buffer = []
  def initialize()
    @buffer = []
  end

  def insert(command, *args)
    item = Hash.new
    item[command] = args
    @buffer << item
  end

  def string()
    return @buffer.join( " " )
  end

  def remove(item)
    val = @buffer.index(item)
    @buffer.delete(val)
    return val
  end
end
