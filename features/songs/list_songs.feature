Feature: List songs
  As a band
  I need to see a list of songs
  So I can make setlists from them

  Background:
    Given a band is logged in
    And the band has the songs:
      | Song1       |
      | Song2       |
      | Song3       |

  Scenario: List songs
    When I list the songs
    Then I should see the songs:
      | Song1       |
      | Song2       |
      | Song3       |