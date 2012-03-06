Feature: Edit member
  As a band
  I need to edit a member
  In case their email changes

Background:
    Given a band is logged in
    And the band has the members:
      | Member1 | member1@example.com |

  Scenario: Delete member
    When I edit the member "Member1"
    And I change the name of the member to "Member1x"
    And I change the email of the member to "member1x@example.com"
    And I save the member
    Then I should see the members:
      | Member1x | member1x@example.com |
