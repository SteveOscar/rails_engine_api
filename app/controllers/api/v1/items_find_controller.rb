class Api::V1::ItemsFindController < Api::ApiController
  respond_to :json

  def show
    respond_with Item.find(params[:id]) if params[:id]
    respond_with Item.find_by(name: params[:name]) if params[:name]
    respond_with Item.find_by(description: params[:description]) if params[:description]
    respond_with Item.find_by(unit_price: params[:unit_price]) if params[:unit_price]
    respond_with Item.find_by(item_id: params[:item_id]) if params[:item_id]
    respond_with Item.find_by(created_at: DateTime.parse(params[:created_at])) if params[:created_at]
    respond_with Item.find_by(updated_at: DateTime.parse(params[:created_at])) if params[:updated_at]
  end

  def index
    respond_with Item.where("lower(items.name) LIKE '#{params[:name].downcase}'") if params[:name]
    respond_with Item.where("lower(items.description) LIKE '#{params[:description].downcase}'") if params[:description]
    respond_with Item.where("lower(items.unit_price) LIKE '#{params[:unit_price].downcase}'") if params[:unit_price]
    respond_with Item.where("items.merchant_id LIKE '#{params[:merchant_id]}'") if params[:merchant_id]
    respond_with Item.find_by(created_at: DateTime.parse(params[:created_at])) if params[:created_at]
    respond_with Item.find_by(created_at: DateTime.parse(params[:updated_at])) if params[:updated_at]
    respond_with Item.find(params[:id]) if params[:id]
  end

end
