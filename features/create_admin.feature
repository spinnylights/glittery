Feature: Admin login info YAML generator

  So that I can store the admin login info in an external config file
  As the person installing the app
  I want to run an interactive script that will generate it for me

  # These tests are hampered, and thus awkwardly constructed, by what 
  # appears to be a bug in Aruba that causes output-checking tests to 
  # fail when running interactive programs. See
  # https://github.com/zaaanderson/glittery/issues/1 for details.
  #
 
  Scenario: Installer uses script correctly
    When I run `config/create_admin` interactively
    And  I type "roseyrangoon"
    And  I type "s!xH4tsy"
    And  I close the stdin stream
    Then it should pass with:
      """
      Success!
      """
    And the exit status should be 0
    And the file "config/admin.yml" should contain: 
      """ 
      ---
      !ruby/sym username: roseyrangoon
      !ruby/sym password: s!xH4tsy
      """

  @wip
  Scenario: Installer tries to enter too short a username
    When I run `config/create_admin` interactively 
    And  I type "a"
    And  I close the stdin stream 
    Then it should fail with: 
      """
      >> Username must be at least 6 characters
      """

  Scenario: Installer tries to enter a username that is only whitespace
    When I run `config/create_admin` interactively
    And  I type "       "
    And  I close the stdin stream
    Then it should fail with:
      """
      >> Username must contain at least one non-whitespace character.
      """

  Scenario: Installer tries to enter too short a password
    When I run `config/create_admin` interactively
    And  I type "roseyrangoon"
    And  I type "a"
    And  I close the stdin stream 
    Then it should fail with: 
      """ 
      >> Password must be at least 8 characters
      """

  # Invalid password regexp is fully tested in 
  # spec/models/artist_spec.rb.

  Scenario: Installer tries to enter an invalid password
    When I run `config/create_admin` interactively
    And  I type "roseyrangoon"
    And  I type "g4tter!no"
    And  I close the stdin stream
    Then it should fail with:
      """
      >> Password must contain at least
      """

  Scenario: Outputting "Username: "
    When I run `config/create_admin` interactively
    And  I close the stdin stream
    Then it should fail with:
      """
      Username:
      """

  Scenario: Outputting "Password: "
    When I run `config/create_admin` interactively
    And  I type "roseyrangoon"
    And  I close the stdin stream
    Then it should fail with: 
      """ 
      Password: 
      """

  Scenario: Exiting prematurely
    When I run `config/create_admin` interactively
    And  I type "ExIt"
    Then the exit status should be 1
