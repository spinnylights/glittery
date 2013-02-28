Feature: Artist deletes artwork

  So that I can remove an artwork I no longer want to display
  As the artist
  I want to delete an artwork from the database

  Scenario: Artist deletes an artwork 
    Given that I am on the main admin page (and thus logged in)
    When I click Edit Gallery
    And click delete under Bag of Bags
    Then the Bag of Bags artwork should no longer be in the gallery
