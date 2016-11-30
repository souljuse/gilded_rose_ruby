class GildedRose

  def initialize(items)
    @items = items
  end

#   def update_quality()
#     @items.each do |item|
#       # item quality decreases
#       if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
#         if item.quality > 0
#           if item.name != "Sulfuras, Hand of Ragnaros"
#             item.quality = item.quality - 1
#           end
#         end
#       # items here do not decay
#       else
#         if item.quality < 50
#           item.quality = item.quality + 1
#           if item.name == "Backstage passes to a TAFKAL80ETC concert"
#             if item.sell_in < 11
#               if item.quality < 50
#                 item.quality = item.quality + 1
#               end
#             end
#             if item.sell_in < 6
#               if item.quality < 50
#                 item.quality = item.quality + 1
#               end
#             end
#           end
#         end
#       end
#       # a day has passed
#       if item.name != "Sulfuras, Hand of Ragnaros"
#         item.sell_in = item.sell_in - 1
#       end
#
#       #items which quality change after selling date
#       if item.sell_in < 0
#         if item.name != "Aged Brie"
#           if item.name != "Backstage passes to a TAFKAL80ETC concert"
#             if item.quality > 0
#               if item.name != "Sulfuras, Hand of Ragnaros"
#                 item.quality = item.quality - 1
#               end
#             end
#           else
#             item.quality = item.quality - item.quality
#           end
#         else
#           if item.quality < 50
#             item.quality = item.quality + 1
#           end
#         end
#       end
#     end
#   end
# end

  def update_quality()
    @items.each do |item|
      if checkIfSulfuras(item)
        item.quality = item.quality
        item.sell_in = item.sell_in
      elsif checkIfAgesWell(item)
        item.sell_in -= 1
        if item.quality < 50
          item.quality += 1
          if checkIfTicket(item)
            if item.sell_in < 11
              item.quality += 1
            end
            if item.sell_in < 11
              item.quality += 1
            end
            if item.sell_in < 0
              item.quality = item.quality - item.quality
            end
          elsif checkIfConjured(item)
            item.quality -= 1
          elsif checkIfBrie(item)
            if item.sell_in < 0
              item.quality += 1
            end
          end
        end
      else
        item.sell_in -= 1
        item.quality -= 1
        if checkIfConjured(item)
          item.quality -= 1
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
