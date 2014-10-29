class EventsController < ApplicationController
  before_action :find_params, :only => [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @events = Event.all
    @categories = Category.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(save_params)
    if @event.save
      redirect_to :action => :index
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(save_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private
  def find_params
    @event = Event.find(params[:id])
  end
  def save_params
    params.require(:event).permit(:name, :description, :time, :category_id)
  end
end
