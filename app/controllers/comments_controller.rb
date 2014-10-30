class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_event
  before_action :find_params, :only => [:show, :edit, :update, :destroy]

  def index
    @comments = @event.comments
  end

  def create
    @comment = @event.comments.build(comment_params)
    if @comment.save
      redirect_to event_path(@event)
    end
  end

  def destroy
    @comment.destroy
    redirect_to event_path(@event)
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_params
    @comment = @event.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
