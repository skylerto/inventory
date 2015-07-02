require 'singleton'
class OutputBuffer
  include Singleton
  @buffer = []
  def initialize()
    @buffer = []
  end

  def insert(token)
    @buffer << token
  end

  def string()
    buff = @buffer.join( "\n" )
    @buffer = []
    return buff
  end

  def remove(n)
    val = @buffer[n]
    @buffer.delete_at(n)
    return val
  end
end
