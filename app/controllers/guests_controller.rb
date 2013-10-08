class GuestsController < ApplicationController
  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      flash[:success] = 'Thanks for signing in!'
      redirect_to "/events/#{params[:guest][:event_id]}/"
    else
      @event = Event.find(params[:guest][:event_id])
      # @prompt = Prompt.new
      render "/events/show.html.erb"
    end
  end

private
  def guest_params
    params.require(:guest).permit(:name, :affiliation, :email, :event_id)
  end
end
