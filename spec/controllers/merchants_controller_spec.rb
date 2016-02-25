require 'rails_helper'

RSpec.describe Api::V1::Merchants::MerchantsController do
  describe "GET merchant endpoints" do
    it "returns all merchant ids" do
      FactoryGirl.create(:merchant)
      FactoryGirl.create(:merchant)

      get :index, format: :json
      expect(response).to be_success
    end

    it "returns single merchant data" do
      merchant = FactoryGirl.create(:merchant)

      get :show, id: merchant.id, format: :json

      result = JSON.parse(response.body)

      expect(response).to be_success
      expect(result['name']).to eq(merchant.name)
    end
  end
end
