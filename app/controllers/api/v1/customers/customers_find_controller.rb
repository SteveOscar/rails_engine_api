class Api::V1::Customers::CustomersFindController < Api::ApiController
  respond_to :json

  def show
    respond_with Customer.show_finder(params)
  end

  def index
    respond_with Customer.index_finder(params)
  end

end
