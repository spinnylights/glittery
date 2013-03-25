Feature: Artist edits artwork

  In order to maintain correct information about my artwork
  As the artist
  I want to use an edit page to edit the info for an artwork

  Scenario: Artist edits artwork properly
    Given that I am logged in as an admin 
    And   there is artwork in the gallery
    When I edit an artwork
    Then the artwork's info should be changed
