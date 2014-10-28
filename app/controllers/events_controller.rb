class EventsController < ApplicationController
  before_action :find_params, :only => [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
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
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect events_path
  end

  private
  def find_params
    @event = Event.find(params[:id])
  end
  def save_params
    params.require(:event).permit(:name, :description, :time)
  end
end
