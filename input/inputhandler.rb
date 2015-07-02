require_relative 'commands/addcommand'
require_relative 'commands/ordercommand'
require_relative 'commands/checkcommand'
require_relative 'commands/showcommand'
require_relative 'invokers'
require_relative 'bufferinvoker'
require_relative '../system/inventory'
require_relative '../system/bag'
require_relative '../output/outputbuffer'

module Parser

 def Parser.pp
    puts "pretty print"
  end
  # Begin the parseing of input
  def Parser.parse
    commands = ["add {item} {amount}", "order {item} {amount} ... ", "show", "check {item} {amount}"]
    OutputBuffer.instance.insert("Structure: {command} {arguments*}")
    OutputBuffer.instance.insert(commands)
    @invoker = BufferInvoker.new()
    puts OutputBuffer.instance.string
    begin
      print "% "
      #Parser::pp
      input = gets.chomp.split(' ')
      command = input[0]
      args = input[1..input.length]
  
      case command
      # Check if add/paste 
      when "add"
        exe = AddCommand.new(args[0], args[1].to_i)
        @invoker.do(exe)
      when "order"
        bag = Bag.new
        items = []
        amounts = []

        args.each { |thing|
          if /\A\d+\z/.match(thing)
            amounts << thing
          else
            items << thing
          end
        }

        for i in 0..items.length-1
          bag.add(amounts.at(i).to_i, items.at(i))
        end

        exe = OrderCommand.new(bag)
        @invoker.do(exe)
      when "show"
        exe  = ShowCommand.new()
        @invoker.do(exe)
      when "check"
        exe = CheckCommand.new(args[0], args[1].to_i)
        @invoker.do(exe)
      else
        puts "Command not valid"
      end
      
      OutputBuffer.instance.insert(Inventory.instance.print) unless command == "show"
      puts OutputBuffer.instance.string 
    end until command == "exit"
    OutputBuffer.instance.insert("Finishing up..")
    OutputBuffer.instance.insert("Done")
    puts OutputBuffer.instance.string
  end
end

Parser::parse
