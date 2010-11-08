class Trash
  attr_reader :items

  def initialize
    @items = []
  end

  def add_product(product)
    @items << product
  end

  def count
    @items.count
  end
end