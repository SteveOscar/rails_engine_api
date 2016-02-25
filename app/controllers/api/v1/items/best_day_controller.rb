class Api::V1::Items::BestDayController < Api::ApiController
  respond_to :json

  def show
    respond_with Item.best_day(params['id'])
  end

end
