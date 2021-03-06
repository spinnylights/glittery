Feature: Admin changes password

  So that I can keep my account secure
  As the admin
  I want to change my password

  Background: Logged in
    Given that I am logged in as an admin
    #"whistlebags" with the password "f1nnicK!"

  Scenario: Admin changes password correctly
    When I properly change my password to "t4gR@tzo" 
    Then I should be on the Administration page
    And  I should be able to log in with my new password

  Scenario: Admin's new password and password confirmation don't match
    When I enter the wrong confirmation password in the form
    Then I should still be on the Change Password page
    And  I should be told that my passwords don't match
    And  I should not be able to log in with my new password

  Scenario: Admin enters an invalid password
    When I enter an invalid new password
    Then I should still be on the Change Password page
    And  I should be told that my password is invalid
