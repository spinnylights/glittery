Feature: Admin logs in

  So that I can edit my gallery and bio
  As the admin
  I want to log in to the site's admin area

  Scenario: Admin attempts login with incorrect credentials
    Given that I am on the /login page
    And   I am not logged in
    When  I enter the wrong credentials
    Then  I should still be on the /login page
    And   I should be told that my credentials are wrong
  
  @password_sensitive
  Scenario: Admin logs in with correct credentials 
    Given that I am on the /login page
    And   I am not logged in
    When  I enter the correct credentials
    Then  I should be on the main admin page
