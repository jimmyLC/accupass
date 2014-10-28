class AttendeesController < ApplicationController

  def index
    @attendees = Event.Attendee.all
  end

  def show

  end

  def new
    @attendee = Event.Attendee.new
  end

  def create
    @attendee = Event.Attendee.new(save_params)
    if @attendee.save
      redirect_to :action => :index
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def find_params
    @attendee = Attendee.find(params[:id])
  end
  def save_params
    params.require(:attendee).permit(:name)
  end
end

