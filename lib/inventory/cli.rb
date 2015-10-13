require 'thor'
require_relative 'inventory'
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

      desc "show", "Shows the current state of the inventory"
      def show
        puts System::Inventory.print
      end

      desc "invoice NAME args*", "Create an invoice"
      def invoice(name, *args)
        System::Inventory.invoice(name, args)
        puts System::Inventory.print
      end
    end
end
