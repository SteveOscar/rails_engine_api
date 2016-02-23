class Api::V1::MerchantsFindController < Api::ApiController
  respond_to :json

  def show
    respond_with Merchant.find(params[:id]) if params[:id]
    respond_with Merchant.find_by(name: params[:name]) if params[:name]
    respond_with Merchant.find_by(created_at: params[:created_at]) if params[:created_at]
    respond_with Merchant.find_by(updated_at: params[:updated_at]) if params[:updated_at]
  end

  def index
    respond_with Merchant.where("lower(merchants.name) like '#{params[:name].downcase}'") if params[:name]
    respond_with Merchant.where("lower(merchants.created_at) LIKE '#{params[:created_at].downcase}'") if params[:created_at]
    respond_with Merchant.where("lower(merchants.updated_at) LIKE '#{params[:updated_at].downcase}'") if params[:updated_at]
    respond_with Merchant.find(params[:id]) if params[:id]
  end

end
