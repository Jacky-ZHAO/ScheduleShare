Feature: Signing up

  Scenario: Unsuccessful signup
    Given a user visits the signup page
    When they submit invalid signup information
    Then they should see an error signup message

  Scenario: Successful signup
    Given a user visits the signup page
      And the user has information for signup
    When the user submits valid signup information
    Then they should see their profile page after signup