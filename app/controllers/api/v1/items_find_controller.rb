class Api::V1::ItemsFindController < Api::ApiController
  respond_to :json

  def show
    respond_with Item.find(params[:id]) if params[:id]
    respond_with Item.find_by(name: params[:name]) if params[:name]
  end

  def index
    respond_with Item.where("lower(items.name) LIKE '%#{params[:name].downcase}%'") if params[:name]
    respond_with Item.where("lower(items.name) LIKE '%#{params[:description].downcase}%'") if params[:description]
    respond_with Item.where("lower(items.name) LIKE '%#{params[:unit_price].downcase}%'") if params[:unit_price]
    respond_with Item.where("lower(items.name) LIKE '%#{params[:item_id].downcase}%'") if params[:item_id]
    respond_with Item.find(params[:id]) if params[:id]
  end

end
