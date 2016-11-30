class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if checkIfSulfuras(item)
      elsif checkIfAgesWell(item)
        item.sell_in -= 1
        if item.quality < 50
          item.quality += 1
          if checkIfTicket(item)
            update_ticket(item)
          elsif checkIfBrie(item)
            update_brie(item)
          end
        end
      else
        item.sell_in -= 1
        item.quality -= 1
        if checkIfConjured(item)
          update_conjured(item)
        end
      end
    end
  end
end

def checkIfSulfuras(item)
  item.name == "Sulfuras, Hand of Ragnaros"? true : false
end

def checkIfTicket(item)
  item.name == "Backstage passes to a TAFKAL80ETC concert"? true : false
end

def checkIfBrie(item)
  item.name == "Aged Brie"? true : false
end

def checkIfAgesWell(item)
  checkIfBrie(item) || checkIfTicket(item)? true : false
end

def checkIfConjured(item)
  item.instance_of?(ConjuredItem) ? true : false
end

def update_brie(item)
  if item.sell_in < 0
    item.quality += 1
  end
end

def update_ticket(item)
  if item.sell_in < 11
    item.quality += 1
  end
  if item.sell_in < 11
    item.quality += 1
  end
  if item.sell_in < 0
    item.quality = item.quality - item.quality
  end
end

def update_conjured(item)
  item.quality -= 1
end


class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

class ConjuredItem < Item

end
