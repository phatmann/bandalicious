Feature: Edit band
  As a band
  I need to edit my info
  In case my info changes

  Background:
    Given a band is logged in

  Scenario: Edit band info
    When I edit band info
    And I change the band name to "Bandx"
    And I save the band info
    Then my band should show as "Bandx"