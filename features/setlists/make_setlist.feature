@javascript

Feature: Make setlist
  As a band
  I need to make a setlist
  So I can play the songs at a gig

  Background:
    Given a band is logged in
    And the band has the songs:
      | Song1       |
      | Song2       |
      | Song3       |

  Scenario: Make setlist
    When I create a new setlist
    And I set the name of the setlist to "Setlist1"
    And I add "Song1" to the setlist
    And I save the setlist
    Then I should see a setlist with the songs:
      | Song1 |