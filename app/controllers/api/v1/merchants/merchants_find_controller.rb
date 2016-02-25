class Api::V1::Merchants::MerchantsFindController < Api::ApiController
  respond_to :json

  def show
    respond_with Merchant.find(params[:id]) if params[:id]
    respond_with Merchant.find_by(name: params[:name]) if params[:name]
    respond_with Merchant.find_by(created_at: DateTime.parse(params[:created_at])) if params[:created_at]
    respond_with Merchant.find_by(updated_at: DateTime.parse(params[:updated_at])) if params[:updated_at]
  end

  def index
    respond_with Merchant.where("lower(merchants.name) like '#{params[:name].downcase}'") if params[:name]
    respond_with Merchant.where(created_at: DateTime.parse(params[:created_at])) if params[:created_at]
    respond_with Merchant.where(updated_at: DateTime.parse(params[:updated_at])) if params[:updated_at]
    respond_with Merchant.where(id: params[:id]) if params[:id]
  end

end
