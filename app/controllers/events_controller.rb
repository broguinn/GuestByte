class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
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
    params.require(:event).permit(:host, :date, :title)
  end

end