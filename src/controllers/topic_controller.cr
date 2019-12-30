class TopicController < ApplicationController
  getter topic = Topic.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_topic }
  end

  def index
    topics = Topic.all
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
    topic = Topic.new topic_params.validate!
    if topic.save
      redirect_to action: :index, flash: {"success" => "Topic has been created."}
    else
      flash[:danger] = "Could not create Topic!"
      render "new.slang"
    end
  end

  def update
    topic.set_attributes topic_params.validate!
    if topic.save
      redirect_to action: :index, flash: {"success" => "Topic has been updated."}
    else
      flash[:danger] = "Could not update Topic!"
      render "edit.slang"
    end
  end

  def destroy
    topic.destroy
    redirect_to action: :index, flash: {"success" => "Topic has been deleted."}
  end

  private def topic_params
    params.validation do
      required :user_id
      required :forum_id
      required :title
      required :content
    end
  end

  private def set_topic
    @topic = Topic.find! params[:id]
  end
end
