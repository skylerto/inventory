require 'thor'
require 'inventory'
module Inventory
    class CLI < Thor

      desc "add AMOUNT ITEM", "Add an amount of an item"
      def add(amount, item)
        System::Inventory.add(amount.to_i, item)
        puts System::Inventory.print
      end

      desc "remove AMOUNT ITEM", "Remove an amount of an item"
      def remove(amount, item)
        System::Inventory.remove(amount.to_i, item)
        puts System::Inventory.print
      end
    end
end
