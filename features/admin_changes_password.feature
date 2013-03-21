Feature: Admin changes password

  So that I can keep my account secure
  As the admin
  I want to change my password

  Background: Logged in
    Given I am logged in as "whistlebags"
    And   my password is "f1nnicK!"

  @password_sensitive
  Scenario: Admin changes password correctly
    When I click Change Password
    And  enter my current password 
    And  enter the new password "t4gR@tzo" with confirmation
    And  click Submit
    Then I should be back on the Administration page
    And  I should be able to log in with my new password

  @password_sensitive
  Scenario: Admin enters current password incorrectly
    When I click Change Password
    And  enter the wrong password 
    And  enter the password I want with confirmation
    And  click Submit
    Then I should still be on the Change Password page
    And  I should be told that I entered my current password wrong
    And  I should not be able to log in with my new password

  @password_sensitive
  Scenario: Admin's new password and password confirmation don't match
    When I click Change Password
    And  enter my current password 
    And  enter the password I want but mistype the confirmation
    And  click Submit
    Then I should still be on the Change Password page
    And  I should be told that my passwords don't match
    And  I should not be able to log in with my new password
