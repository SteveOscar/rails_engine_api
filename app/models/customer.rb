class Customer < ActiveRecord::Base
  has_many :invoices

  def self.favorite_merchant(id)
    customer = Customer.find(id)
    Merchant.find(customer.invoices.group(:merchant_id).sum('merchant_id').sort_by{|k, v| -v}.first.first)
  end
end
