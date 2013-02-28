Feature: Artist changes password

  So that I can keep my account secure
  As the artist
  I want to change my password

  Scenario: Artist changes password correctly
    Given that I am on the main admin page (and thus logged in)
    When I click Change Password
    And  enter my current password 
    And  enter the password I want with confirmation
    And  click Submit
    Then I should be back on the Administration page
    And  I should be able to log in with my new password

  @password_sensitive
  Scenario: Artist enters current password incorrectly
    Given that I am on the main admin page (and thus logged in)
    When I click Change Password
    And  enter the wrong password 
    And  enter the password I want with confirmation
    And  click Submit
    Then I should still be on the Change Password page
    And  I should be told that I entered my current password wrong
    And  I should not be able to log in with my new password

  @password_sensitive
  Scenario: Artist's new password and password confirmation don't match
    Given that I am on the main admin page (and thus logged in)
    When I click Change Password
    And  enter my current password 
    And  enter the password I want but mistype the confirmation
    And  click Submit
    Then I should still be on the Change Password page
    And  I should be told that my passwords don't match
    And  I should not be able to log in with my new password
