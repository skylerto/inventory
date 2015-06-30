require "singleton"

class OutputFormatter
  include Singleton

  def initialize
    @output = []
  end

  attr_reader :output

  def error(message)
    output << formatted_message(message, "ERROR")
  end

  def info(message)
    output << message
  end
  
  def print
    output.each do |out|
      puts out
    end
  end

  # => Depricated
  def write(filename)
    File.open(filename, "a") { |f| f << output.join }
  end

  private
  def formatted_message(message, message_type)
     "#{Time.now} | #{message_type}: #{message}\n"
  end
end
