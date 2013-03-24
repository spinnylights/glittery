Feature: Artist changes information

  In order to properly represent myself
  As the artist
  I want to modify my bio, name, email, and the title of my site

  Scenario: Artist changes information
    Given that I am logged in as an admin
    When I change my artist information
    Then I should see the site's title changed across the page
    And  I should see the artist's correct info
