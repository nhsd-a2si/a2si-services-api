Feature: Initial placeholder API UI

  Scenario: Placeholder API responds
    When I go to the placeholder API page
    Then the page title says "A2SI Services API (prototype) - E2E UI Tests"
    And the JSON response info contains "This is the Placeholder API"
