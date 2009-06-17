Feature: Databases
  In order to make some use of the system
  As a developer
  I want to CRUD Databases

  Background:
    Given these databases
      |name|
      |foo |

  Scenario: Listing Databases
    When I get /_all_dbs
    Then I should see json '["foo"]'

  Scenario: Creating a new Database
    When I put /bar
    Then I should see status 201 Created
    And  I should see json '{"ok": true}'

  Scenario: Creating a duplicate Database
    When I put /foo
    Then I should see status 412 Precondition Failed

  Scenario: Creating Designs
    When I put /foo/_design/widget {}
