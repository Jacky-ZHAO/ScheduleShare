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
  
  describe "edit" do
    let(:event){FactoryGirl.create(:event, user: user)}
    before do
      visit edit_event_path(event)
    end

    describe "page" do
      it { should have_content("Update") }
      it { should have_title("Edit event") }
    end

    describe "with valid information" do
      let(:new_title)  { "New Title" }
      let(:new_description) { "Test Description" }
	 let(:new_venue)  { "New Location" }
	 let(:new_time)  { rand(-10.years..10.years).seconds.ago }
      before do
        fill_in "Title",             with: new_title
        fill_in "Description",            with: new_description
        fill_in "Venue",         with: new_venue
        fill_in "Time", with: new_time
        click_button "Save changes"
      end

      it { should have_title(new_title) }
      it { should have_selector('div.alert.alert-success') }
      specify { expect(event.reload.title).to  eq new_title }
      specify { expect(event.reload.description).to eq new_description }
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