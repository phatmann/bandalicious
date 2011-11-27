Feature: Delete song
  As a band
  I need to delete a song
  In case we stop playing it

  Background:
    Given a band is logged in
    And the band has the songs:
      | Song1       |
      | Song2       |
      | Song3       |

  Scenario: Edit song
    When I delete the song "Song2"
    Then I should see the songs:
      | Song1      |
      | Song3      |