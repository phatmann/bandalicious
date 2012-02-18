Feature: Email setlist
  As a band member
  I need to email a setlist
  So I can share it with the rest of the band

  Background:
    Given a band is logged in
    And the band has the members:
      | Me | member@example.com |
    And the band has a setlist "Setlist" with the songs:
      | Song1       |
      | Song2       |
      | Song3       |

  Scenario: List songs
    When I list the setlists
    And I email the setlist "Setlist"
    Then "member@example.com" will receive an email with the songs:
      | Song1       |
      | Song2       |
      | Song3       |