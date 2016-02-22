require 'rails_helper'

RSpec.describe Api::V1::MerchantsController do
  describe "GET all merchants" do
    it "returns all merchant ids" do
      get :index, format: :json
      byebug
      expect(assigns(:teams)).to eq([team])
    end

    # it "renders the index template" do
    #   get :index
    #   expect(response).to render_template("index")
    # end
  end
end
