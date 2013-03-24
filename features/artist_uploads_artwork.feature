Feature: Uploading artwork

  In order to add a new artwork to my gallery
  As the artist
  I want to use an upload form for a new artwork

  Scenario: Artist correctly uploads artwork
    Given that I am logged in as an admin 
    When I add a new artwork
    Then the artwork should appear in the gallery
    And  its info should appear on its page

  Scenario: Artist forgets to add image for uploading
    Given that I am logged in as an admin 
    When I try to add an artwork without an image
    Then I should still be on the new artwork page
    And  I should be told that I need to pick an image to upload
