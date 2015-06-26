re 'singleton'
class Buffer
  include Singleton
  @buffer = []
  def initialize()
    @buffer = []
  end

  def insert(n, token)
    @buffer.insert( n, token )
  end

  def string()
    return @buffer.join( " " )
  end

  def remove(n)
    val = @buffer[n]
    @buffer.delete_at(n)
    return val
  end
end
