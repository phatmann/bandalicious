@javascript
Feature: Delete member
  As a band
  I need to delete a member
  In case they leave the band

  Background:
    Given a band is logged in
    And the band has the members:
      | Member1 | member1@example.com |
      | Member2 | member2@example.com |

  Scenario: Delete member
    When I delete the member "Member1"
    Then I should see the members:
      | Member2 | member2@example.com |
    
