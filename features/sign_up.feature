Feature: Sign up

  Background:
    Given I am not logged in

  Scenario: User signs up
    When I sign up
    Then I should see email confirmation message
