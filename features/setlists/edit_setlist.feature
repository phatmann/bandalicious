Feature: Edit setlist
  As a band
  I need to edit a setlist
  So I can change its name and add/remove songs

  Background:
    Given a band is logged in
    And the band has the setlists:
      | Setlist1    |
    
  Scenario: Edit setlist
    When I edit setlist "Setlist1"
    And I change the name of the setlist to "Setlist1x"
    And I save the setlist
    Then the setlist name should show as "Setlist1x"