Feature: Add song
  As a band
  I need to add a song
  So I can add it to my setlists

  Background:
    Given a band is logged in
    And the band has the songs:
      | Song1       |

  Scenario: List songs
    When I add a song "Song2"
    Then I should see the songs:
      | Song1       |
      | Song2       |