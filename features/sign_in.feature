Feature: Sign in admin user

  Scenario: Admin user sign in
    Given I am admin user
    When I sign in
    Then I should see "Switch"

  Scenario: Regular user sign in
    Given I am regular user
    When I sign in
    Then I should see full name