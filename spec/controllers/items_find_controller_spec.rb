require 'rails_helper'

RSpec.describe Api::V1::Items::ItemsFindController do
  describe "#show" do
    it "finds by id" do
      FactoryGirl.create(:item)
      FactoryGirl.create(:item)

      get :show, id: Item.first.id, format: :json
      result = response.body.nil?

      expect(response).to be_success
      expect(result).not_to eq(true)
    end

    it "finds by name" do
      item = FactoryGirl.create(:item)

      get :show, name: item.name, format: :json
      result = JSON.parse(response.body)

      expect(response).to be_success
      expect(result['name']).to eq(item.name)
    end
  end

  describe "#index" do
    it "finds all by name" do
      item = FactoryGirl.create(:item)
      FactoryGirl.create(:item, name: item.name)

      get :index, name: item.name, format: :json

      result = JSON.parse(response.body).count

      expect(response).to be_success
      expect(result).to eq(2)
    end

    it "finds all by id" do
      item = FactoryGirl.create(:item)
      FactoryGirl.create(:item, name: item.name)

      get :index, id: item.id, format: :json

      result = JSON.parse(response.body).count

      expect(response).to be_success
      expect(result).to eq(1)
    end

    it "finds all by created_at" do
      item = FactoryGirl.create(:item)
      FactoryGirl.create(:item, name: item.name)

      get :index, created_at: "2012-03-27T14:54:05.000Z", format: :json

      result = JSON.parse(response.body).first['name']

      expect(response).to be_success
      expect(result).to eq(Item.first.name)
    end

    it "finds all by updated_at" do
      item = FactoryGirl.create(:item)
      FactoryGirl.create(:item, name: item.name)

      get :index, updated_at: "2012-03-27T14:54:05.000Z", format: :json
      result = JSON.parse(response.body).last['name']

      expect(response).to be_success
    end
  end
end
