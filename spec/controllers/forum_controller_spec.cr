require "./spec_helper"

def forum_hash
  {"name" => "Fake", "description" => "Fake"}
end

def forum_params
  params = [] of String
  params << "name=#{forum_hash["name"]}"
  params << "description=#{forum_hash["description"]}"
  params.join("&")
end

def create_forum
  model = Forum.new(forum_hash)
  model.save
  model
end

class ForumControllerTest < GarnetSpec::Controller::Test
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

describe ForumControllerTest do
  subject = ForumControllerTest.new

  it "renders forum index template" do
    Forum.clear
    response = subject.get "/forums"

    response.status_code.should eq(200)
    response.body.should contain("forums")
  end

  it "renders forum show template" do
    Forum.clear
    model = create_forum
    location = "/forums/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Forum")
  end

  it "renders forum new template" do
    Forum.clear
    location = "/forums/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Forum")
  end

  it "renders forum edit template" do
    Forum.clear
    model = create_forum
    location = "/forums/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Forum")
  end

  it "creates a forum" do
    Forum.clear
    response = subject.post "/forums", body: forum_params

    response.headers["Location"].should eq "/forums"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a forum" do
    Forum.clear
    model = create_forum
    response = subject.patch "/forums/#{model.id}", body: forum_params

    response.headers["Location"].should eq "/forums"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a forum" do
    Forum.clear
    model = create_forum
    response = subject.delete "/forums/#{model.id}"

    response.headers["Location"].should eq "/forums"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
