class PriceCalculator
  TAX_RATE = 0.21

  def initialize(items)
    @items = items
  end

  def subtotal
    @items.sum { |item| item.fetch(:price) * item.fetch(:qty) }
  end

  def total
    subtotal + tax_amount
  end

  def tax_amount
    subtotal * TAX_RATE
  end
end

items = [
  { name: "book", price: 10.0, qty: 2 },
  { name: "pen", price: 2.5, qty: 3 },
]

calculator = PriceCalculator.new(items)
puts calculator.total
