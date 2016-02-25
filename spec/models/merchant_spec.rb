require 'rails_helper'

RSpec.describe Merchant, type: :model do
  before(:all) do
    customer = FactoryGirl.create(:customer)
    merchant = FactoryGirl.create(:merchant)
    item = FactoryGirl.create(:item)
    invoice = FactoryGirl.create(:invoice, customer_id: customer.id,
                                           merchant_id: merchant.id,
                                           created_at: DateTime.parse("2012-03-27T14:54:05.000Z"),
                                           updated_at: DateTime.parse("2012-03-27T14:54:05.000Z"))
    merchant = FactoryGirl.create(:invoice_item)
  end

   describe "pending invoice customers" do
     Merchant.pending_invoice_customers(1).should == []
   end

   describe "revenue by date" do
     Transaction.create
     Transaction.first.update(invoice_id: 1, result: "success")

     answer = 878.86
     Merchant.revenue_by_date_merchant(1, "2012-03-27 14:54:05 UTC").values.first.to_f.should == answer
   end

   describe "best customer" do
     Merchant.best_customer(1).should == {:id=>12}
   end

   describe "total revenue merchant" do
     answer = 878.86
     Merchant.total_revenue_merchant(1).values.first.to_f == answer
   end

   describe "most items" do
     answer = 1
     Merchant.most_items(1).first.id == answer
   end

   describe "most revenue all merchants" do
     answer = 1
     Merchant.most_revenue_all_merchants(1).first.id == answer
   end

end
