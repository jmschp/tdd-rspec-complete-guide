class Order
  attr_reader :product_name, :quantity, :mailer

  def initialize(product_name, quantity)
    @product_name = product_name
    @quantity = quantity
    @filled = false
  end

  def fill(warehouse)
    return mailer.send('Order not completed') unless warehouse.has_inventory?(product_name, quantity)

    warehouse.remove(product_name, quantity)
    @filled = true
  end

  def filled?
    @filled
  end

  def mailer_service(mailer)
    @mailer = mailer
  end
end
