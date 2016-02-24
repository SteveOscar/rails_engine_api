require 'rails_helper'

RSpec.describe Api::V1::ItemsRandomController do
  describe "#show" do
    it "returns a random item" do
      item = FactoryGirl.create(:item)

      get :show, format: :json

      result = JSON.parse(response.body)

      expect(response).to be_success
      expect(result.first['name']).to eq(item.name)
    end
  end
end