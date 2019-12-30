require "./spec_helper"

def topic_hash
  {"user_id" => "1", "forum_id" => "1", "title" => "Fake", "content" => "Fake"}
end

def topic_params
  params = [] of String
  params << "user_id=#{topic_hash["user_id"]}"
  params << "forum_id=#{topic_hash["forum_id"]}"
  params << "title=#{topic_hash["title"]}"
  params << "content=#{topic_hash["content"]}"
  params.join("&")
end

def create_topic
  model = Topic.new(topic_hash)
  model.save
  model
end

class TopicControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe TopicControllerTest do
  subject = TopicControllerTest.new

  it "renders topic index template" do
    Topic.clear
    response = subject.get "/topics"

    response.status_code.should eq(200)
    response.body.should contain("topics")
  end

  it "renders topic show template" do
    Topic.clear
    model = create_topic
    location = "/topics/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Topic")
  end

  it "renders topic new template" do
    Topic.clear
    location = "/topics/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Topic")
  end

  it "renders topic edit template" do
    Topic.clear
    model = create_topic
    location = "/topics/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Topic")
  end

  it "creates a topic" do
    Topic.clear
    response = subject.post "/topics", body: topic_params

    response.headers["Location"].should eq "/topics"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a topic" do
    Topic.clear
    model = create_topic
    response = subject.patch "/topics/#{model.id}", body: topic_params

    response.headers["Location"].should eq "/topics"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a topic" do
    Topic.clear
    model = create_topic
    response = subject.delete "/topics/#{model.id}"

    response.headers["Location"].should eq "/topics"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
