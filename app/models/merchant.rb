class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items

  def self.pending_invoice_customers(id)
    merchant = Merchant.find(id)
    merchant.invoices.pending.joins(:customer).uniq
  end

  def self.best_customer(id)
    merchant = Merchant.find(id)
    { id: merchant.invoices.group(:customer_id).order("count('customer_id') desc").limit(1).pluck(:customer_id)[0]}
  end

  def self.revenue_by_date_merchant(id, date)
    merchant = Merchant.find(id)
    {"revenue" => merchant.invoices.by_date(date).successful.joins(:invoice_items).sum("quantity * unit_price")}
  end

  def self.total_revenue_merchant(id)
    merchant = Merchant.find(id)
    {"revenue" => merchant.invoices.successful.joins(:invoice_items).sum("quantity * unit_price")}
  end

  def self.most_items(quantity)
    results = Merchant.includes(:invoices).map do |merchant|
      [merchant, merchant.invoices.successful.joins(:invoice_items).sum("quantity")]
    end
    sort_results(results, quantity)
  end

  def self.most_revenue_all_merchants(quantity)
    results = Merchant.includes(:invoices).map do |merchant|
      [merchant, merchant.invoices.successful.joins(:invoice_items).sum("quantity * unit_price")]
      # [merchant, InvoiceItem.joins(:invoice).where('invoices.merchant_id = ?', merchant.id).sum("quantity * unit_price")]
    end
    sort_results(results, quantity)
  end

  def self.total_revenue(date)
    results = Merchant.includes(:invoices).map do |merchant|
      [merchant, merchant.invoices.by_date(date).successful.joins(:invoice_items).sum("quantity * unit_price")]
    end
    sum_results(results)
  end

  def self.sum_results(results)
    {"total_revenue" => results.inject(0) { |result, element| result + element.last }.to_f.to_s}
  end

  def self.sort_results(results, quantity)
    results.sort_by { |data| data.last }.reverse.map(&:first)[0..(quantity-1)]
  end

end
