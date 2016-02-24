class Api::V1::CustomersRandomController < Api::ApiController
  respond_to :json

  def show
    respond_with Customer.limit(1).order("RANDOM()")
  end

end
