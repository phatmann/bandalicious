@javascript

Feature: Add song or break to setlist
  As a band
  I need to add a song or a break to a setlist
  So I can play that song or take a break at a gig

  Background:
    Given a band is logged in
    And the band has the songs:
      | Song1       |
      | Song2       |
      | Song3       |
    And I create a new setlist

  Scenario Outline: Add song to setlist
    And I add "Song1" to the setlist by <action>
    Then I should see "Song1" in the selected songs list
    And I should not see "Song1" in the available songs list

    Examples:
      |action   |
      |clicking |
      |dragging |

  Scenario Outline: Add break to setlist
    And I add a break to the setlist by <action>
    Then I should see a break in the selected songs list
    And I should see a break above the available songs list

    Examples:
      |action|
      |clicking|
      |dragging|