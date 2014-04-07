Feature: Signing in

  Scenario: Unsuccessful signin
    Given a user visits the signin page
    When they submit invalid signin information
    Then they should see an error message

  Scenario: Successful signin
    Given a user visits the signin page
      And the user has an account
    When the user submits valid signin information
<<<<<<< HEAD
    Then they should see their profile page
=======
    Then they should see their profile page
      And they should see a signout link
>>>>>>> fed2ed529a73f6c55a122220640bc13bba4ed931
