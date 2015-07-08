Feature: Inventory
  In order to manage inventory
  As a CLI
  I want to be as objective as possible

  Scenario: Adding item
    When I run `inventory add 5 cats`
    Then the output should contain "cats: 5"
