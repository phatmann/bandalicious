Feature: Show setlist
  As a band
  I need to view a setlist
  So I can see what songs are in it

  Background:
    Given a band is logged in
    And the band has a setlist "Setlist" with the songs:
      | Song1       |
      | Song2       |
      | Song3       |

  Scenario: List songs
    When I list the setlists
    And I view the setlist "Setlist"
    Then I should see a setlist with the songs:
      | Song1 |
      | Song2 |
      | Song3 |