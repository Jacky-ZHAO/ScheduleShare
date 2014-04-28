FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
	
  factory :event do
    # time: Time.now, user_id: user.id, venue: "Gordon", description: "Project discussion.", people: "YHC, Jacky", title: "Meeting"
    description "Project discussion"
    people "YHC, Jacky"
    title "Meeting"
    venue "Gordon"
    time Time.now
    user
  end
end