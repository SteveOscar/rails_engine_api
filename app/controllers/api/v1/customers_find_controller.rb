class Api::V1::CustomersFindController < Api::ApiController
  respond_to :json

  def show
    respond_with Customer.find(params[:id]) if params[:id]
    (respond_with Customer.find_by(first_name: params[:first_name]) if params[:first_name]) unless params[:last_name]
    respond_with Customer.find_by(last_name: params[:last_name]) if params[:last_name]
    respond_with Customer.find_by(created_at: DateTime.parse(params[:created_at])) if params[:created_at]
    respond_with Customer.find_by(created_at: DateTime.parse(params[:updated_at])) if params[:updated_at]
  end

  def index
    respond_with Customer.where("lower(customers.first_name) LIKE '#{params[:first_name].downcase}'") if params[:first_name]
    respond_with Customer.where("lower(customers.last_name) LIKE '#{params[:last_name].downcase}'") if params[:last_name]
    respond_with Customer.where(created_at: DateTime.parse(params[:created_at])) if params[:created_at]
    respond_with Customer.where(created_at: DateTime.parse(params[:updated_at])) if params[:updated_at]
    respond_with Customer.where(id: params[:id]) if params[:id]
  end

end
