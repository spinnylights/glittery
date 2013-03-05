Feature: Uploading artwork

  In order to add a new artwork to my gallery
  As the artist
  I want to use an upload form for a new artwork

  Scenario: Artist correctly uploads artwork
    Given that I am on the main admin page (and thus logged in)
    When I click Edit Gallery
    And  click Add New Artwork
    And  add a name for the artwork
    And  add a description for the artwork
    And  select the artwork's image for uploading
    And  click Submit
    Then the artwork's name and image should appear in the gallery
    And  its name, image, and description should appear on its page

  Scenario: Artist forgets to add image for uploading
    Given that I am on the main admin page (and thus logged in)
    When I click Edit Gallery
    And  click Add New Artwork
    And  click Submit
    Then I should still be on the new artwork page
    And  I should be told that I need to pick an image to upload
