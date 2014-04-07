Given /^a user visits the signup page$/ do
  visit signup_path
end

When /^they submit invalid signup information$/ do
  click_button "GO"
end

Then /^they should see an error signup message$/ do
  expect(page).to have_selector('div.alert.alert-error')
end

Given /^the user has information for signup$/ do
  @user = User.create(name: "Joe", email: "Joe@example.com", birthday: "1984-12-12",
                      password: "foobar", password_confirmation: "foobar")
end

When /^the user submits valid signup information$/ do
  fill_in "Name",    with: @user.name
  fill_in "Password", with: @user.password
  fill_in "Confirmation", with:@user.password
  fill_in "Birthday", with: @user.birthday
  click_button "GO"
end

Then /^they should see their profile page after signup$/ do
  expect(page).to have_title("Schedule Share")
end