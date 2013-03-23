Feature: Admin logs out 

  So that I can end my session and prevent unauthorized access 
  As the admin
  I want to log out from the site's admin area

  Scenario: Admin logs out
    Given I am logged in as "whistlebags" with the password "f1nnicK!"
    When  I log out 
    Then  I should see a gallery section 
    And   I should not be able to edit anything
    And   /login should give me a login prompt
