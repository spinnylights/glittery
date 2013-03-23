Feature: Artist bio

  So that I can understand and contact an artist
  As an appreciator
  I want to see their bio page

  Scenario: Appreciator clicks on bio link
    Given that an admin has an artist with info
    When I click on their bio link from the main page
    Then I should see the artist's info 
