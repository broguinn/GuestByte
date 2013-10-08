class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @date = Date.new(params[:event]["date(1i)"].to_i,
                       params[:event]["date(2i)"].to_i,
                       params[:event]["date(3i)"].to_i)
    params['event']['date'] = @date
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = 'Event successfully created!'
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @prompt = Prompt.new(:event_id => @event.id)
  end

private

  def event_params
    params.require(:event).permit(:host, :date, :title, :location, :start_time, :end_time, :description)
  end

end
