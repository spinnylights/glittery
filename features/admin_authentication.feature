Feature: Authentication 

  So that I can keep my account safe 
  As an admin
  I want to make sure my account can't be accessed improperly 

  Scenario: Admin attempts login with incorrect credentials
    Given that I have an admin account
    And   I am not logged in
    When  I enter the wrong credentials at the login prompt
    Then  I should still be on the /login page
    And   I should be told that my credentials are wrong
