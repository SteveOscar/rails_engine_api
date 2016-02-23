require 'rails_helper'

RSpec.describe Api::V1::MerchantsController do
  describe "GET all merchants" do
    it "returns all merchant ids" do
      FactoryGirl.create(:merchant)
      FactoryGirl.create(:merchant)

      get :index, format: :json
      expect(response).to be_success
    end

    it "renders the index template" do
      merchant = FactoryGirl.create(:merchant)

      get :show, id: merchant.id, format: :json
      byebug
      expect(response).to be_success
    end
  end
end
