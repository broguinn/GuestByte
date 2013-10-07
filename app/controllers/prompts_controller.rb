class PromptsController < ApplicationController

  def create
    @prompt = Prompt.new(prompt_params)
    if @prompt.save
      redirect_to "/events/#{params[:prompt][:event_id]}/"
    else
      @event = Event.find(params[:prompt][:event_id])
      render "/events/show.html.erb"
    end
  end

  def destroy
  
  end

private
  
  def prompt_params
    params.require(:prompt).permit(:content, :event_id)
  end
end