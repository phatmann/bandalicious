Feature: List members
  As a band
  I need to list the members
  So I can see if anyone needs to be added

  Background:
    Given a band is logged in
    And the band has the members:
      | Member1 | member1@example.com |
      | Member2 | member2@example.com |

  Scenario: List members
    When I list the members
    Then I should see the members:
      | Member1 | member1@example.com |
      | Member2 | member2@example.com |
    
