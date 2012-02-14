@javascript

Feature: Reorder songs in setlist
  As a band
  I need to reorder songs in the setlist
  So I can play the songs in the right order at a gig

  Background:
    Given a band is logged in
    And the band has the songs:
      | Song1       |
      | Song2       |
      | Song3       |
    And I create a new setlist
    And I set the name of the setlist to "Setlist1"
    And I add "Song1" to the setlist
    And I add "Song2" to the setlist
    And I add "Song3" to the setlist

  Scenario: Reorder songs
    When I drag "Song1" down one song
    And I save the setlist
    Then I should see a setlist with the songs:
      | Song2       |
      | Song1       |
      | Song3       |
      