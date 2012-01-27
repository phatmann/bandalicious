Feature: List setlists
  As a band
  I need to see a list of setlists
  So I can edit, copy or delete them

  Background:
    Given a band is logged in
    And the band has the setlists:
      | Setlist1    |
      | Setlist2    |
      | Setlist3    |

  Scenario: List songs
    When I list the setlists
    Then I should see the setlists:
      | Setlist1    |
      | Setlist2    |
      | Setlist3    |