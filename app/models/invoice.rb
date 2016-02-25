class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  scope :successful, -> { joins(:transactions).where("result = 'success'") }

  scope :pending, -> { joins(:transactions).where("result = 'failed'") }

  scope :by_date, -> (date) { where(created_at: DateTime.parse(date)) }

  scope :by_customer, -> (id) { where(merchant_id: id) }

  def self.show_finder(params)
    if params[:id]
      Invoice.find(params[:id])
    elsif params[:customer_id]
      Invoice.find_by(customer_id: params[:customer_id])
    elsif params[:merchant_id]
      Invoice.find_by(merchant_id: params[:merchant_id])
    elsif params[:status]
      Invoice.find_by(status: params[:status])
    elsif params[:created_at]
      Invoice.find_by(created_at: DateTime.parse(params[:created_at]))
    elsif params[:updated_at]
      Invoice.find_by(updated_at: DateTime.parse(params[:updated_at]))
    end
  end

  def self.index_finder(params)
    if params[:customer_id]
      Invoice.where(customer_id: params[:customer_id])
    elsif params[:merchant_id]
      Invoice.where(merchant_id: params[:merchant_id])
    elsif params[:status]
      Invoice.where("lower(invoices.status) LIKE '#{params[:status].downcase}'")
    elsif params[:created_at]
      Invoice.where(created_at: DateTime.parse(params[:created_at]))
    elsif params[:updated_at]
      Invoice.where(updated_at: DateTime.parse(params[:updated_at]))
    elsif params[:id]
      Invoice.where(id: params[:id])
    end
  end

end
