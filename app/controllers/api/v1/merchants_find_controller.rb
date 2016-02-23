class Api::V1::MerchantsFindController < Api::ApiController
  respond_to :json

  def show
    respond_with Merchant.find(params[:id]) if params[:id]
    respond_with Merchant.find_by(name: params[:name]) if params[:name]
  end

  def index
    respond_with Merchant.where("lower(merchants.name) LIKE '%#{params[:name].downcase}%'") if params[:name]
    respond_with Merchant.find(params[:id]) if params[:id]
  end

end
