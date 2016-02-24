class Api::V1::InvoicesRandomController < Api::ApiController
  respond_to :json

  def show
    respond_with Invoice.limit(1).order("RANDOM()")
  end

end
