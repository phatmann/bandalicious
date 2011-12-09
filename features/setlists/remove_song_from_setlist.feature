Feature: Remove a song or break from setlist
  As a band
  I need to remove a song or break from a setlist
  In case I decide not to play that song or take that break at a gig

  Background:
    Given a band is logged in
    And the band has the songs:
      | Song1       |
      | Song2       |
      | Song3       |
    And I create a new setlist

  Scenario Outline: Remove song from setlist
    When I click on "Song1" add button
    And I <action>
    Then I should see no songs in the selected songs list
    And I should see that song in the available songs list

    Examples:
      |action                                   |
      |click on "Song1" remove button           |
      |drag "Song1" to the available songs list |

  Scenario Outline: Remove break from setlist
    When I click break add button
    And I <action>
    Then I should see no songs in the selected songs list

    Examples:
      |action                                      |
      |click first break remove button             |
      |drag first break to the available songs list|