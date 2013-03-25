Feature: Gallery display

  So that I can appreciate the artist's work
  As an appreciator
  I want to see an interactive display of artwork

  Scenario: Gallery displays on main page
    Given that I am an appreciator (and thus not logged in)
    And   there is artwork in the gallery
    When I visit the main page
    Then I should see artwork images
    And  I should not see Edit, Delete, or Add New Artwork links

  Scenario: Appreciator clicks on a piece
    Given that I am an appreciator (and thus not logged in)
    And   there is artwork in the gallery
    When I click on an artwork image
    Then I should see the artwork image
    And  I should see the name of the work
    And  I should see a description of the work
