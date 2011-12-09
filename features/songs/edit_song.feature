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
    When I edit song "Song1"
    And I change the name of song to "Song1x"
    And I save the song
    Then I should see the songs:
      | Song1x      |
      | Song2       |
      | Song3       |