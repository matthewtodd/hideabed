Feature: Databases
  In order to make some use of the system
  As a developer
  I want to CRUD Databases

  Background:
    Given these databases
      |name|
      |foo |

  Scenario: Listing Databases
    When I go to /_all_dbs
    Then I should see json '["foo"]'
