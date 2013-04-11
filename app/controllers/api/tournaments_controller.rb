class Api::TournamentsController < Api::BaseController
  respond_to :json
  before_filter :authenticate_user!

  def index
    respond_with Tournament.participant(current_user)
  end

  def show
    respond_with Tournament.participant(current_user).find(params[:id])
  end
end
