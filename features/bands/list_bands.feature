Feature: List bands
  As an admin
  I need to see a list of bands
  So I can manage them

  Background:
    Given an admin is logged in
    And the following bands exist:
      | name        |
      | Band1       |
      | Band2       |

  Scenario: List bands
    When I list the bands
    Then I should see the bands:
      | Band1       |
      | Band2       |