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

  Scenario: Creating Databases
    When I put /bar
    And I get /_all_dbs
    Then I should see json '["foo", "bar"]'

  Scenario: Creating Designs
    When I put /foo/_design/widget {}
