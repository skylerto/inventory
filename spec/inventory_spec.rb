require 'spec_helper'

describe Inventory do
  # => Inventory
  it 'has a version number' do
    expect(Inventory::VERSION).not_to be nil
  end

  it 'adds to the inventory' do
    System::Inventory.add(3, "Tests")
    expect(System::Inventory.has?(3, "Tests"))
    System::Inventory.remove(3, "Tests")
  end

  it 'can has items' do
    expect(System::Inventory.has?(1, "" == false))
  end

 it 'can add all from another bag' do
    bag_other = Bag.new
    bag_other.add(2, "cats")
    bag_other.add(1, "dogs")

    System::Inventory.add_all(bag_other)
    expect(System::Inventory.has?(1, "dogs"))
    expect(System::Inventory.has?(2, "cats"))
    
    System::Inventory.remove(1, "dogs")
    System::Inventory.remove(2, "cats")
  
  end


  it 'remove some from inventory' do
    System::Inventory.add(10,"Tests")
    System::Inventory.remove(5, "Tests")
    expect(System::Inventory.has?(5, "Tests"))
    System::Inventory.remove(5, "Tests")
  end

  it 'can remove all from another bag' do
    System::Inventory.add(4, "cats")
    System::Inventory.add(2, "dogs")
    bag_other = Bag.new
    bag_other.add(2, "cats")
    bag_other.add(1, "dogs")

    System::Inventory.remove_all(bag_other)
    expect(System::Inventory.has?(1, "dogs"))
    expect(System::Inventory.has?(2, "cats"))

    System::Inventory.remove(2, "cats")
    System::Inventory.remove(1, "dogs")
   
  end

  it 'can print' do
    expect(System::Inventory.print === "Current Inventory")

    System::Inventory.add(2, "cats")
    expect(System::Inventory.print === "cats: 2")
    System::Inventory.remove(2, "cats")
   
  end


end

describe Bag do

  # => Bag
  it 'can be create' do
    bag = Bag.new
    expect(bag).not_to be nil
  end

  it 'is created empty' do
    bag = Bag.new
    expect(bag.empty?)
  end

  it 'can has items' do
    bag = Bag.new
    expect(bag.has?(1, "" == false))
  end

  it 'can be added to' do
    bag = Bag.new
    bag.add(5, "cats")
    expect(bag.has?(5,"cats"))
    bag.remove(5, "cats")
  end

  it 'can add all from another bag' do
    bag = Bag.new
    bag_other = Bag.new
    bag_other.add(2, "cats")
    bag_other.add(1, "dogs")

    bag.add_all(bag_other)
    expect(bag.has?(1, "dogs"))
    expect(bag.has?(2, "cats"))
    bag.remove(2, "cats")
    bag.remove(1, "dogs")
  end

  it 'can be removed from' do
    bag = Bag.new
    bag.add(5, "cats")
    bag.remove(5, "cats")
    expect(bag.has?(0,"cats"))
  end

  it 'can remove all from another bag' do
    bag = Bag.new
    bag.add(4, "cats")
    bag.add(2, "dogs")
    bag_other = Bag.new
    bag_other.add(2, "cats")
    bag_other.add(1, "dogs")

    bag.remove_all(bag_other)
    expect(bag.has?(6, "dogs"))
    expect(bag.has?(3, "cats"))
    bag.remove(6, "dogs")
    bag.remove(3, "cats")
  end

  it 'can print' do
    bag = Bag.new
    expect(bag.print === "Current Inventory")

    bag.add(2, "cats")
    expect(bag.print === "cats: 2")
    bag.remove(2, "cats")
  end

end
