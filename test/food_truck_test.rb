require 'minitest/autorun'
require 'minitest/pride'
require './lib/food_truck'
require './lib/item'

class FoodTruckTest < Minitest::Test

  def test_it_exists
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    assert_instance_of FoodTruck, food_truck
  end

  def test_it_has_attributes
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    assert_equal "Rocky Mountain Pies", food_truck.name
    expected = {}
    assert_equal expected, food_truck.inventory
  end

  def test_can_check_stock
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    assert_equal 0, food_truck.check_stock(item1)
  end

  def test_can_stock_items
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    food_truck.stock(item1, 30)

    expected = {item1 => 30}
    assert_equal expected, food_truck.inventory
  end

  def test_can_check_inventory_after_stocking
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    food_truck.stock(item1, 30)

    assert_equal 30, food_truck.check_stock(item1)

    food_truck.stock(item1, 25)
    assert_equal 55, food_truck.check_stock(item1)

    food_truck.stock(item2, 12)

    expected = {item1=> 55,item2=> 12}
    assert_equal expected, food_truck.inventory
  end

end
