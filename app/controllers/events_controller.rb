class EventsController < ApplicationController
  before_action :find_params, :only => [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :event_params

  def index
    if params[:cid]
      @category = Category.find( params[:cid] )
      @events = @category.events
    else
      @events = Event.all
    end

    @categories = Category.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

    if @event.save
      redirect_to :action => :index
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
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

  def event_params
    params.require(:event).permit(:name, :description, :time, :category_ids => [])
  end

end
