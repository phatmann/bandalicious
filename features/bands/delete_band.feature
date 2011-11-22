Feature: Delete band
  As an admin
  I need to delete a band
  So I can keep the site clean

  Background:
    Given an admin is logged in
    And the following bands exist:
      | name        |
      | Band1       |
      | Band2       |

  Scenario: Delete a band
    When I list the bands
    And I delete the first band
    Then I should see the bands:
      | Band2       |