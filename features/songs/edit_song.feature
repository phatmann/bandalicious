Feature: Edit song
  As a band
  I need to edit a song
  In case its name changes

  Background:
    Given a band is logged in
    And the band has the songs:
      | Song1       |
      | Song2       |
      | Song3       |

  Scenario: Edit song
    When I change the name of song "Song1" to "Song1x"
    Then I should see the songs:
      | Song1x      |
      | Song2       |
      | Song3       |