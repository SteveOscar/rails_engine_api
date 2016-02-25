require 'rails_helper'

RSpec.describe Api::V1::Items::ItemsController do
  describe "#index" do
    it "returns all item ids" do
      FactoryGirl.create(:item)
      FactoryGirl.create(:item)

      get :index, format: :json
      expect(response).to be_success
    end
  end

  describe "#show" do
    it "returns single item data" do
      item = FactoryGirl.create(:item)

      get :show, id: item.id, format: :json

      result = JSON.parse(response.body)

      expect(response).to be_success
      expect(result['name']).to eq(item.name)
    end
  end
end
