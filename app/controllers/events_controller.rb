class EventsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy, :edit, :update]
  before_action :correct_user,   only: [:edit, :destroy, :update]
  
  def show
	@event = Event.find(params[:id])
  end
  
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @event.destroy
    redirect_to root_url
  end

  def edit
    # @event = User.events.find(params[:id])
  end
  
  def update
      if @user.events.update_attributes(event_params)
      flash[:success] = "Event updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
	
  private

    def event_params
      params.require(:event).permit(:title, :description)
    end
	
	def correct_user
      @event = current_user.events.find_by(id: params[:id])
      redirect_to root_url if @event.nil?
    end
end