require 'spec_helper'

describe GildedRose do

  describe "#update_quality" do

    before do
      @foo = Item.new("foo", 1, 1)
      @brie = Item.new("Aged Brie", 1, 47)
      @sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 100, 49)
      @ticket = Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 40)
      @items = [@foo, @brie, @sulfuras, @ticket]
      GildedRose.new(@items).update_quality()
    end

    it "Normal item does not change the name and change quality and day" do
      expect(@items[0].name).to eq "foo"
      expect(@items[0].quality).to eq(0)
      expect(@items[0].sell_in).to eq(0)
    end

    it "brie item does not change the name and change quality and day" do
      expect(@items[1].name).to eq "Aged Brie"
      expect(@items[1].quality).to eq(48)
      GildedRose.new(@items).update_quality()
      expect(@items[1].quality).to eq(50)
      GildedRose.new(@items).update_quality()
      expect(@items[1].quality).to eq(50)
    end

    it "sulfuras item does not change quality or day" do
      expect(@items[2].name).to eq "Sulfuras, Hand of Ragnaros"
      expect(@items[2].quality).to eq(49)
      expect(@items[2].sell_in).to eq(100)
    end

    it "ticket item change quality or day" do
      expect(@items[3].quality).to eq(43)
      expect(@items[3].sell_in).to eq(0)
      GildedRose.new(@items).update_quality()
      expect(@items[3].quality).to eq(0)
    end

    it "doubles the quality decay time if item is conjured" do
      rotten_tomatoes = Item.new("Conjured Tomatoes", 4, 20)
      @items.push(rotten_tomatoes)
      GildedRose.new(@items).update_quality()
      expect(@items[4].quality).to eq(18)
    end
  end

end
