Feature: Gallery display

  So that I can appreciate the artist's work
  As an appreciator
  I want to see an interactive display of artwork

  Scenario: Gallery displays on main page
    When I visit the main page
    Then I should see artwork images

  Scenario: Appreciator clicks on a piece
    When I click on an artwork image
    Then I should see the artwork image
    And  I should see the name of the work
    And  I should see a description of the work
