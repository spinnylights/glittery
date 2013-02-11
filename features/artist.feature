Feature: Artist bio

  So that I can understand and contact the artist
  As an appreciator
  I want to see their bio page

  Scenario: Appreciator clicks on bio link
    When I click on the bio link from the main page
    Then I should see the artist's name
    And  I should see their photo
    And  I should see their bio
