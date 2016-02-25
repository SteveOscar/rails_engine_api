class Customer < ActiveRecord::Base
  has_many :invoices

  def self.favorite_merchant(id)
    customer = Customer.find(id)
    Merchant.find(customer.invoices.group(:merchant_id).sum('merchant_id').sort_by{|k, v| -v}.first.first)
  end

  def self.show_finder(params)
    if params[:id]
      Customer.find(params[:id])
    elsif params[:last_name]
      Customer.find_by(last_name: params[:last_name])
    elsif params[:created_at]
      Customer.find_by(created_at: DateTime.parse(params[:created_at]))
    elsif params[:updated_at]
      Customer.find_by(updated_at: DateTime.parse(params[:updated_at]))
    elsif params[:first_name]
      Customer.find_by(first_name: params[:first_name])
    end
  end

  def self.index_finder(params)
    if params[:first_name]
      Customer.where("lower(customers.first_name) LIKE '#{params[:first_name].downcase}'")
    elsif params[:last_name]
      Customer.where("lower(customers.last_name) LIKE '#{params[:last_name].downcase}'")
    elsif params[:created_at]
      Customer.where(created_at: DateTime.parse(params[:created_at]))
    elsif params[:updated_at]
      Customer.where(updated_at: DateTime.parse(params[:updated_at]))
    elsif params[:id]
      Customer.where(id: params[:id])
    end
  end
end
