# Parse the input

#require_relative 'commands.rb'
#require_relative 'invokers.rb'

module Parser

  def Parser.pp
    puts "pretty print"
  end
  # Begin the parseing of input
  def Parser.parse
    
    puts "Structure: {command} {arguments*}"

    begin
      print "% "
      #Parser::pp
      input = gets.chomp.split(' ')
      command = input[0]
      args = input[1..input.length]
  
      # Check if add/paste 
      if command == "add" or command == "paste"
        puts "Command: #{command}"
        puts "Arguments: #{args}" 
      end
    end until command == "exit"
    puts "Finishing up.."
    puts "Done"
  end
end

Parser::parse
