class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.best_day(id)
    item = Item.find(id)
    { "best_day" => item.invoices.successful.group('"invoices"."created_at"')
                                            .sum('quantity')
                                            .sort_by{|k, v| -v}
                                            .first[0] }
  end

  def self.most_items(quantity)
    results = Item.includes(:invoice_items).map do |item|
      [item, item.invoice_items.sum("quantity")]
    end
    sort_results(results, quantity)
  end

  def self.most_revenue(quantity)
    results = Item.includes(:invoice_items).map do |item|
      [item, item.invoice_items.sum("quantity * unit_price")]
    end
    sort_results(results, quantity)
  end

  def self.sort_results(results, quantity)
    results.sort_by { |data| data.last }.reverse.map(&:first)[0..(quantity-1)]
  end
end
