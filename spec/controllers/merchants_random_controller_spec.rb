require 'rails_helper'

RSpec.describe Api::V1::MerchantsRandomController do
  describe "GET merchant endpoints" do
    it "returns a random merchant" do
      merchant = FactoryGirl.create(:merchant)

      get :show, format: :json

      result = JSON.parse(response.body)

      expect(response).to be_success
      expect(result.first['name']).to eq(merchant.name)
    end
  end
end
