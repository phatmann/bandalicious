Feature: Edit setlist
  As a band
  I need to edit a setlist
  So I can change its name and add/remove songs

  Background:
    Given a band is logged in
    And the band has the following setlists:
      | Setlist1    |
      | Setlist2    |
      | Setlist3    |
    
  Scenario: Edit setlist
    When I edit setlist "Setlist1"
    And I change the name of setlist "Setlist1" to "Setlist1x"
    And I save the setlist
    Then I should see the songs:
      | Setlist1x   |
      | Setlist2    |
      | Setlist3    |