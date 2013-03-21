Feature: Admin logs out 

  So that I can end my session and prevent unauthorized access 
  As the admin
  I want to log out from the site's admin area

  @password_sensitive
  Scenario: Admin logs out
    Given that I am on the main admin page (and thus logged in)
    When  I click 'Log out' 
    Then  I should see a gallery section 
    And   I should not be able to edit anything
    And   /login should give me a login prompt
