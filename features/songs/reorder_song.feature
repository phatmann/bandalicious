Feature: Reorder song
  As a band
  I need to move songs around
  So we can have the most important ones on top

  Background:
    Given a band is logged in
    And the band has the songs:
      | Song1       |
      | Song2       |
      | Song3       |

  Scenario: Turn on editing
    When I turn on song editing
    Then I should see the songs:
      | Song1       |
      | Song2       |
      | Song3       |

  Scenario: Reorder song
    When I move the song "Song2" under "Song3"
    Then I should see the songs:
      | Song1       |
      | Song3       |
      | Song2       |