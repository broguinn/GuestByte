class ResponsesController < ApplicationController
  def create
    @response = Response.new(response_params)
    if @response.save
      flash[:success] = 'response successfully created!'
      #braden will tell you
      redirect_to "/events/#{@response.prompt.event_id}/"
    else
      @event = Event.find(@response.prompt.event_id)
      @prompt = Prompt.new
      render "/events/show.html.erb"
    end
  end

  def delete
  end

private

  def response_params
    params.require(:response).permit(:content, :prompt_id)
  end
end
