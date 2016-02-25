require 'rails_helper'

RSpec.describe Api::V1::Customers::CustomersFindController do
  describe "#show" do
    it "finds by id" do
      FactoryGirl.create(:customer)
      FactoryGirl.create(:customer)

      get :show, id: Customer.first.id, format: :json
      result = response.body.nil?

      expect(response).to be_success
      expect(result).not_to eq(true)
    end

    it "finds by first_name" do
      customer = FactoryGirl.create(:customer)

      get :show, first_name: customer.first_name, format: :json
      result = JSON.parse(response.body)

      expect(response).to be_success
      expect(result['first_name']).to eq(customer.first_name)
    end
  end

  describe "#index" do
    it "finds all by first_name" do
      customer = FactoryGirl.create(:customer)
      FactoryGirl.create(:customer, first_name: customer.first_name)

      get :index, first_name: customer.first_name, format: :json

      result = JSON.parse(response.body).count

      expect(response).to be_success
      expect(result).to eq(2)
    end

    it "finds all by id" do
      customer = FactoryGirl.create(:customer)
      FactoryGirl.create(:customer, first_name: customer.first_name)

      get :index, id: customer.id, format: :json

      result = JSON.parse(response.body).count

      expect(response).to be_success
      expect(result).to eq(1)
    end

    it "finds all by created_at" do
      customer = FactoryGirl.create(:customer)
      FactoryGirl.create(:customer, first_name: customer.first_name)

      get :index, created_at: "2012-03-27T14:54:05.000Z", format: :json

      result = JSON.parse(response.body).first['first_name']

      expect(response).to be_success
      expect(result).to eq(customer.first_name)
    end

    it "finds all by updated_at" do
      customer = FactoryGirl.create(:customer)
      FactoryGirl.create(:customer, first_name: customer.first_name)

      get :index, updated_at: "2012-03-27T14:54:05.000Z", format: :json
      result = JSON.parse(response.body).first['first_name']

      expect(response).to be_success
      expect(result).to eq(customer.first_name)
    end
  end
end
