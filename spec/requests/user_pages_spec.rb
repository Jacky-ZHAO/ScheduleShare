require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:e1) { FactoryGirl.create(:event, user: user, description: "Project discussion 1", title: "First Meeting") }
    let!(:e2) { FactoryGirl.create(:event, user: user, description: "Project discussion 2", title: "Second Meeting") }
	
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
	
    describe "events" do
      it { should have_content(m1.event) }
      it { should have_content(m2.event) }
      it { should have_content(user.events.count) }
    end
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "GO" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    

    describe "after submission" do
       	before { click_button submit }

       	it { should have_title('Sign up') }
       	it { should have_content('error') }
    	end

	end

    describe "with valid information" do
    let(:user) { FactoryGirl.create(:user) }
      before {valid_infomation()}

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_success_message('Welcome') }
      end
    end
  end
end