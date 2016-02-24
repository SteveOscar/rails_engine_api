class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items

  def self.most_revenue_merchants(quantity)
    byebug
    Item.joins(:invoice_items).where('invoice_items.invoice_id = ?', params[:id])

    InvoiceItem.joins(:invoice).where('invoices.merchant_id = ?', 1)
  end
end
