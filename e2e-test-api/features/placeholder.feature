Feature: Initial placeholder API

  Scenario: Placeholder API responds
    When I retrieve the placeholder object
    Then I get an OK response
    And the placeholder object message reads "This is the Placeholder API"
