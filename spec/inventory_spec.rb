require 'spec_helper'

describe Inventory do
  it 'has a version number' do
    expect(Inventory::VERSION).not_to be nil
  end

  it 'adds to the inventory' do
    System::Inventory.add(3, "Tests")
    expect(System::Inventory.has?(3, "Tests"))
  end

  it 'remove some from inventory' do
    System::Inventory.add(10,"Tests")
    System::Inventory.remove(5, "Tests")
    expect(System::Inventory.has?(5, "Tests"))
  end
end
