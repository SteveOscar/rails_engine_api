# require 'rails_helper'
#
# RSpec.describe Item, type: :item do
#   before(:all) do
#     customer = FactoryGirl.create(:customer)
#     merchant = FactoryGirl.create(:merchant)
#     item = FactoryGirl.create(:item)
#     invoice = FactoryGirl.create(:invoice, customer_id: customer.id,
#                                            merchant_id: merchant.id,
#                                            created_at: DateTime.parse("2012-03-27T14:54:05.000Z"),
#                                            updated_at: DateTime.parse("2012-03-27T14:54:05.000Z"))
#     merchant = FactoryGirl.create(:invoice_item)
#   end
#
#    describe "best day" do
#      Transaction.create
#      Transaction.first.update(invoice_id: 1, result: "success")
#      answer = ["2012-03-27 14:54:05 UTC"]
#
#      Item.best_day(1).values.should == answer
#    end
#
#    describe "most items" do
#      answer = "Bucket1"
#
#      Item.most_items(1).first.name.should == answer
#    end
#
#    describe "revenue by date" do
#      answer = "Bucket1"
#
#      Item.most_revenue(1).first.name.should == answer
#    end
#
# end
