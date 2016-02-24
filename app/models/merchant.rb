class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items

  # def self.most_revenue_merchants(quantity)
  #   byebug
  #   Item.joins(:invoice_items).where('invoice_items.invoice_id = ?', params[:id])
  #
  #   InvoiceItem.joins(:invoice).where('invoices.merchant_id = ?', 1)
  #
  #   Merchant.order(InvoiceItem.joins(:invoice).where('invoices.merchant_id = ?', 1).sum("quantity * unit_price"))
  # end


  def self.most_revenue_merchants(quantity)
    Merchant.all.map do |merchant|
      [merchant, InvoiceItem.joins(:invoice).where('invoices.merchant_id = ?', merchant.id).sum("quantity * unit_price")]
    end.sort_by { |data| data.last }.reverse.map(&:first)[0..(quantity-1)]
  end
end
