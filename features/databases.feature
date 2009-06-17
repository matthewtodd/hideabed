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

  Scenario: Deleting a Database
    When I delete /foo
    Then I should see status 200 OK
    And  I should see json '{"ok": true}'  

  # TODO make this scenario pass without opening a browser window
  # Scenario: Deleting a non-existent Database
  #   When I delete /non-existent
  #   Then I should see status 404 Not Found
  
  # TODO provide more information about the database, like this:
  # {"db_name": "dj", "doc_count":5, "doc_del_count":0, "update_seq":13, "compact_running":false, "disk_size":16845}
  Scenario: Showing a Database
    When I get /foo
    Then I should see json '{"db_name": "foo"}'
