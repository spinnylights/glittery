Feature: Artist edits artwork

  In order to maintain correct information about my artwork
  As the artist
  I want to use an edit page to edit the info for an artwork

  Scenario: Artist edits artwork properly
    Given that I am on the main admin page (and thus logged in)
    When I click Edit Gallery
    And  click edit under an artwork
    And  change the artwork's name
    And  change the artwork's description
    And  click Submit
    Then the artwork's name should be changed on the gallery and artwork pages
    And  the artwork's description should be changed on the artwork's page
