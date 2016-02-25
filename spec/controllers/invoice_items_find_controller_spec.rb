require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::InvoiceItemsFindController do
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

  describe "#show" do
    it "finds by id" do
      FactoryGirl.create(:invoice_item)

      get :show, id: InvoiceItem.first.id, format: :json
      result = response.body.nil?

      expect(response).to be_success
      expect(result).not_to eq(true)
    end

    it "finds by invoice_id" do

      get :show, invoice_id: InvoiceItem.first.invoice_id, format: :json
      result = JSON.parse(response.body)

      expect(response).to be_success
      expect(result['invoice_id']).to eq(InvoiceItem.first.invoice_id)
    end
  end

  describe "#index" do
    it "finds all by unit_price" do

      get :index, unit_price: InvoiceItem.first.unit_price, format: :json

      result = JSON.parse(response.body).count

      expect(response).to be_success
      expect(result).to eq(1)
    end

    it "finds all by id" do

      get :index, id: InvoiceItem.first.id, format: :json

      result = JSON.parse(response.body).count

      expect(response).to be_success
      expect(result).to eq(1)
    end

    it "finds all by created_at" do

      get :index, created_at: "2012-03-27T14:54:05.000Z", format: :json

      result = JSON.parse(response.body).first['created_at']

      expect(response).to be_success
      expect(DateTime.parse(result)).to eq(InvoiceItem.first.created_at)
    end

    it "finds all by updated_at" do

      get :index, updated_at: "2012-03-27T14:54:05.000Z", format: :json
      result = JSON.parse(response.body).first['updated_at']

      expect(response).to be_success
      expect(DateTime.parse(result)).to eq(InvoiceItem.first.updated_at)
    end
  end
end
