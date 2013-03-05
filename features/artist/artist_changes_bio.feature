Feature: Artist changes bio, name, email, and site title

  In order to properly represent myself
  As the artist
  I want to modify my bio, name, email, and the title of my site

  Scenario: Artist changes bio, name, email, and site title
    Given that I am on the main admin page (and thus logged in) 
    When I click the Change Info link
    And  change my name
    And  change my email
    And  change the site's title
    And  change my bio
    And  press Submit
    Then I should see the site's title changed across the page
    And  I should see my bio, name, and email changed on the bio page
