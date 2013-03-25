Feature: Artist deletes artwork

  So that I can remove an artwork I no longer want to display
  As the artist
  I want to delete an artwork from the database

  Scenario: Artist deletes an artwork 
    Given that I am logged in as an admin 
    And   there is artwork in the gallery
    When I delete an artwork
    Then the artwork should no longer be in the gallery
