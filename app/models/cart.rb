class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product_id, number)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += number
      if current_item.quantity < 0
        current_item.quantity =0
      end
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def reduce_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity -= 1
      if current_item.quantity < 0
        current_item.quantity =0
      end
    end
    current_item
  end

  def total_price
    line_items.to_a.sum {|item| item.total_price}
  end
end
