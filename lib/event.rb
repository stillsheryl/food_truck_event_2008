class Event
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def sorted_item_list
    items = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        items << item.name
      end
    end
    items.sort.uniq
  end

  def quantity_food_truck
    item_info = {quantity: 0, food_trucks: []}
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        item_info[:quantity] += quantity
        item_info[:food_trucks] << food_truck
      end
    end
    item_info
  end

  def total_inventory
    total_inventory = {}
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        total_inventory[item] = quantity_food_truck
      end
    end
    total_inventory
  end

end
