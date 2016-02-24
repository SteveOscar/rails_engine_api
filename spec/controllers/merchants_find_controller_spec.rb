require 'rails_helper'

RSpec.describe Api::V1::Merchants::MerchantsFindController do
  describe "#show" do
    it "finds by id" do
      FactoryGirl.create(:merchant)
      FactoryGirl.create(:merchant)

      get :show, id: Merchant.first.id, format: :json
      result = response.body.nil?

      expect(response).to be_success
      expect(result).not_to eq(true)
    end

    it "finds by name" do
      merchant = FactoryGirl.create(:merchant)

      get :show, name: merchant.name, format: :json
      result = JSON.parse(response.body)

      expect(response).to be_success
      expect(result['name']).to eq(merchant.name)
    end
  end

  describe "#index" do
    it "finds all by name" do
      merchant = FactoryGirl.create(:merchant)
      FactoryGirl.create(:merchant, name: merchant.name)

      get :index, name: merchant.name, format: :json

      result = JSON.parse(response.body).count

      expect(response).to be_success
      expect(result).to eq(2)
    end

    it "finds all by id" do
      merchant = FactoryGirl.create(:merchant)
      FactoryGirl.create(:merchant, name: merchant.name)

      get :index, id: merchant.id, format: :json

      result = JSON.parse(response.body).count

      expect(response).to be_success
      expect(result).to eq(1)
    end

    it "finds all by created_at" do
      merchant = FactoryGirl.create(:merchant)
      FactoryGirl.create(:merchant, name: merchant.name)

      get :index, created_at: "2012-03-27T14:54:05.000Z", format: :json

      result = JSON.parse(response.body).first['name']

      expect(response).to be_success
      expect(result).to eq(Merchant.first.name)
    end

    it "finds all by updated_at" do
      merchant = FactoryGirl.create(:merchant)
      FactoryGirl.create(:merchant, name: merchant.name)

      get :index, updated_at: "2012-03-27T14:54:05.000Z", format: :json
      result = JSON.parse(response.body).first['name']

      expect(response).to be_success
      expect(result).to eq(Merchant.first.name)
    end
  end
end
