class CommentsController < ApplicationController
  before_action :find_event

  def index
    @comments = Comment.all
  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def find_event
    @event = Event.find(:event_id)
  end

  def find_params
    @comment = @event.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
