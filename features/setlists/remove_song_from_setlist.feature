@javascript

Feature: Remove a song or break from setlist
  As a band
  I need to remove a song or break from a setlist
  In case I decide not to play that song (or take that break) at a gig

  Background:
    Given a band is logged in
    And the band has the songs:
      | Song1       |
      | Song2       |
      | Song3       |
    And I create a new setlist

  Scenario Outline: Remove song from setlist
    When I add "Song1" to the setlist
    And I remove "Song1" by <action>
    Then I should not see "Song1" in the selected songs list
    And I should see "Song1" in the available songs list

    Examples:
      |action       |
      |clicking     |
      |dragging     |

  Scenario Outline: Remove break from setlist
    When I add a break to the setlist
    And I remove the break by <action>
    Then I should not see a break in the selected songs list

    Examples:
      |action       |
      |clicking     |
      |dragging     |