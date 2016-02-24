class Api::V1::Items::ItemsFindController < Api::ApiController
  respond_to :json

  def show
    respond_with Item.find(params[:id]) if params[:id]
    respond_with Item.find_by(name: params[:name]) if params[:name]
    respond_with Item.find_by(description: params[:description]) if params[:description]
    respond_with Item.find_by(unit_price: params[:unit_price]) if params[:unit_price]
    respond_with Item.find_by(merchant_id: params[:merchant_id]) if params[:merchant_id]
    respond_with Item.where(created_at: DateTime.parse(params[:created_at])).first if params[:created_at]
    respond_with Item.where(updated_at: DateTime.parse(params[:updated_at])).first if params[:updated_at]
  end

  def index
    respond_with Item.where("lower(items.name) LIKE '#{params[:name].downcase}'") if params[:name]
    respond_with Item.where("lower(items.description) LIKE '#{params[:description].downcase}'") if params[:description]
    respond_with Item.where(unit_price: params[:unit_price]) if params[:unit_price]
    respond_with Item.where(merchant_id: params[:merchant_id]) if params[:merchant_id]
    respond_with Item.where(created_at: DateTime.parse(params[:created_at])) if params[:created_at]
    respond_with Item.where(updated_at: DateTime.parse(params[:updated_at])) if params[:updated_at]
    respond_with Item.where(id: params[:id]) if params[:id]
  end

end
