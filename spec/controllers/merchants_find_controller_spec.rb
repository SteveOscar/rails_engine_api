require 'rails_helper'

RSpec.describe Api::V1::MerchantsFindController do
  describe "GET show" do
    it "finds a merchant by id" do
      FactoryGirl.create(:merchant)
      FactoryGirl.create(:merchant)

      get :show, id: Merchant.first.id, format: :json
      result = response.body.nil?
      expect(result).not_to eq(true)
    end

    it "returns all matching objects" do
      merchant = FactoryGirl.create(:merchant)
      FactoryGirl.create(:merchant, name: merchant.name)

      get :index, name: merchant.name, format: :json

      result = JSON.parse(response.body).count

      expect(result).to eq(2)
    end
  end
end
