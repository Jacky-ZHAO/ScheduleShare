require 'spec_helper'

describe Event do

  let(:user) { FactoryGirl.create(:user) }
	# t.integer :user_id
     # t.timestamp :time
     # t.string :venue
     # t.text :description
     # t.string :people
     # t.string :title
  before {@event = user.events.build(time: Time.now, user_id: user.id, venue: "Gordon", description: "Project discussion.", people: "YHC, Jacky", title: "Meeting")}
	
  subject { @event }

  it { should respond_to(:time) }
  it { should respond_to(:venue) }
  it { should respond_to(:description) }
  it { should respond_to(:people) }
  it { should respond_to(:title) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }
  
  it { should be_valid }

  describe "when user_id is not present" do
    before { @event.user_id = nil }
    it { should_not be_valid }
  end

describe "when blank title" do
    before { @event.user_id = " " }
    it { should_not be_valid }
  end
  
  describe "without a title" do
    before { @event.title = nil }
    it { should_not be_valid }
  end

  describe "with description that is more than 300 chars" do
    before { @event.description = "a" * 301 }
    it { should_not be_valid }
  end
end