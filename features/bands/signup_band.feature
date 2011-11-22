Feature: Sign up band
  As a band
  I need to sign up
  So I can use the site

  Background:

  Scenario: Sign up band
    When I sign up with the following info:
      | name  | username | email             | password |
      | Band1 | band1    | band1@example.com | band1pw  |
    Then I should see the home page for "Band1"