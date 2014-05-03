require 'spec_helper'

describe "Event pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "event creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a event" do
        expect { click_button "Add" }.not_to change(Event, :count)
      end

      describe "error messages" do
        before { click_button "Add" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
	 
	 before { fill_in 'event_title', with: "Meeting 1" }
      before { fill_in 'event_description', with: "Lorem ipsum" }
      it "should create a event" do
        expect { click_button "Add" }.to change(Event, :count).by(1)
      end
    end
  end
  
  describe "event destruction" do
    before { FactoryGirl.create(:event, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a event" do
        expect { click_link "delete" }.to change(Event, :count).by(-1)
      end
    end
  end
end