require 'rails_helper'

RSpec.describe Api::V1::Invoices::InvoicesFindController do
  before(:all) do
    customer = FactoryGirl.create(:customer)
    merchant = FactoryGirl.create(:merchant)
    invoice = FactoryGirl.create(:invoice, customer_id: customer.id,
                                           merchant_id: merchant.id,
                                           status: 'shipped',
                                           created_at: DateTime.parse("2012-03-27T14:54:05.000Z"),
                                           updated_at: DateTime.parse("2012-03-27T14:54:05.000Z"))
   end

  describe "#show" do
    it "finds by id" do
      FactoryGirl.create(:invoice)

      get :show, id: Invoice.first.id, format: :json
      result = response.body.nil?

      expect(response).to be_success
      expect(result).not_to eq(true)
    end

    it "finds by customer_id" do
      get :show, customer_id: Invoice.first.customer_id, format: :json
      result = JSON.parse(response.body)

      expect(response).to be_success
      expect(result['customer_id']).to eq(Invoice.first.customer_id)
    end

    it "finds by merchant_id" do
      get :show, merchant_id: Invoice.first.merchant_id, format: :json
      result = JSON.parse(response.body)

      expect(response).to be_success
      expect(result['merchant_id']).to eq(Invoice.first.merchant_id)
    end
  end

  describe "#index" do
    it "finds all by customer_id" do

      get :index, customer_id: Invoice.first.customer_id, format: :json

      result = JSON.parse(response.body).count

      expect(response).to be_success
      expect(result).to eq(1)
    end

    it "finds all by id" do

      get :index, id: Invoice.first.id, format: :json

      result = JSON.parse(response.body).count

      expect(response).to be_success
      expect(result).to eq(1)
    end

    it "finds all by created_at" do

      get :index, created_at: "2012-03-27T14:54:05.000Z", format: :json

      result = JSON.parse(response.body).first['created_at']

      expect(response).to be_success
      expect(DateTime.parse(result)).to eq(Invoice.first.created_at)
    end

    it "finds all by updated_at" do

      get :index, updated_at: "2012-03-27T14:54:05.000Z", format: :json
      result = JSON.parse(response.body).first['updated_at']

      expect(response).to be_success
      expect(DateTime.parse(result)).to eq(Invoice.first.updated_at)
    end
  end
end
