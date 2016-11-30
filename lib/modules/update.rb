module Update
  def Update.checkIfSulfuras
    name == "Sulfuras, Hand of Ragnaros"? true : false
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
end
