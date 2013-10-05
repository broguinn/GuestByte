class PromptsController < ApplicationController

  def create
    @prompt = Prompt.new(prompt_params)
    if @prompt.save
      flash[:success] = 'Prompt successfully created!'
      #braden will tell you
      redirect_to "/events/#{params[:prompt][:event_id]}/"
    else
      # render "/events/#{params[:prompt][:event_id]}/"
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