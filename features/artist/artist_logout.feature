Feature: Artist logs out 

  So that I can end my session and prevent unauthorized access 
  As the artist
  I want to log out from the site's admin area

  Scenario: Artist logs out
    Given that I am on the main admin page
    When  I click "Log out" 
    Then  I should be on the main gallery page
    And   I should not be able to edit anything
    And   /login should give me a login prompt
