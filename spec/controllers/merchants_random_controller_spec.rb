require 'rails_helper'

RSpec.describe Api::V1::Merchants::MerchantsRandomController do
  describe "GET merchant endpoints" do
    it "returns a random merchant" do
      merchant = FactoryGirl.create(:merchant)

      get :show, format: :json

      result = JSON.parse(response.body)

      expect(response).to be_success
    end
  end
end
