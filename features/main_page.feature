Feature: Main page navigation

  So that I can navigate the app
  As an appreciator
  I want to see the major page areas 

  Scenario: Appreciator visits the main page
    When I visit the main page
    Then I should see a header
    And I should see a gallery section
    And I should see a a link to an artist bio
