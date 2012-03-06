Feature: Add member
  As a band
  I need to add a member
  So I can share setlists with them

  Background:
    Given a band is logged in

  Scenario: Add member
    When I add a member "Member1" with email "member1@example.com"
    Then I should see the members:
      | Member1 | member1@example.com |
