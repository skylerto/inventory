require_relative 'commands/addcommand'
require_relative 'commands/ordercommand'
require_relative 'commands/checkcommand'
require_relative 'commands/showcommand'
require_relative 'invokers'
require_relative 'bufferinvoker'
require_relative '../system/inventory'
require_relative '../system/bag'
module Parser

 def Parser.pp
    puts "pretty print"
  end
  # Begin the parseing of input
  def Parser.parse
    commands = ["add {item} {amount}", "order {item} {amount} ... ", "show", "check {item} {amount}"]
    puts "Structure: {command} {arguments*}"
    puts commands
    @invoker = BufferInvoker.new()

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
      Inventory.instance.print unless command.eql?("show")
    end until command == "exit"
    puts "Finishing up.."
    puts "Done"
  end
end

Parser::parse
