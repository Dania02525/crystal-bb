class ForumController < ApplicationController
  getter forum = Forum.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_forum }
  end

  def index
    forums = Forum.all
    render "index.slang"
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    forum = Forum.new forum_params.validate!
    if forum.save
      redirect_to action: :index, flash: {"success" => "Forum has been created."}
    else
      flash[:danger] = "Could not create Forum!"
      render "new.slang"
    end
  end

  def update
    forum.set_attributes forum_params.validate!
    if forum.save
      redirect_to action: :index, flash: {"success" => "Forum has been updated."}
    else
      flash[:danger] = "Could not update Forum!"
      render "edit.slang"
    end
  end

  def destroy
    forum.destroy
    redirect_to action: :index, flash: {"success" => "Forum has been deleted."}
  end

  private def forum_params
    params.validation do
      required :name
      required :description
    end
  end

  private def set_forum
    @forum = Forum.find! params[:id]
  end
end
