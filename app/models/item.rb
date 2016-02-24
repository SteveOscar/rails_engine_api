class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :ivoice_items

  def self.most_revenue(quantity)
    results = Item.all.map do |item|
      [item, item.invoice_items.sum("quantity * unit_price")]
    end
    sort_results(results, quantity)
  end

  def self.sort_results(results, quantity)
    results.sort_by { |data| data.last }.reverse.map(&:first)[0..(quantity-1)]
  end
end
