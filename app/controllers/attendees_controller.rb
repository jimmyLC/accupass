class AttendeesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_event
  before_action :find_params, :only => [:show, :edit, :update, :destroy]

  def index
    @attendees = @event.attendees
  end

  def show

  end

  def new
    @attendee = @event.attendees.build
  end

  def create
    @attendee = @event.attendees.build(save_params)
    if @attendee.save
      redirect_to event_attendees_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @attendee.update(save_params)
      redirect_to event_attendees_path
    else
      render :edit
    end
  end

  def destroy
    @attendee.destroy
    redirect_to event_attendees_path
  end

  private
  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_params
    @attendee = @event.attendees.find(params[:id])
  end

  def save_params
    params.require(:attendee).permit(:name)
  end
end