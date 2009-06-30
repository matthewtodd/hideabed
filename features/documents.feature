Feature: Documents
  In order to store actual information in the system
  As a developer
  I want to CRUD Documents

  Background:
    Given these databases
      | name |
      | foo  |
    And these documents
      | database | name | revision | data                 |
      | foo      | bar  | 12345    | { "Key" => "Value" } |

  Scenario: Showing a Document
    When I get /foo/bar
    Then I should see status 200 OK
    And  I should see json '{"_id":"bar", "_rev":"12345", "Key":"Value"}'

  Scenario: Creating a named Document
    When I put /foo/fred { "Name":"Flintstone" }
    Then I should see status 201 Created
    And  I should see json like '{"ok":true, "id":"fred", "rev":"xxxxxxxxxxxxxxxx"}'

  Scenario: Creating a named Document with a json_class attribute
    When I put /foo/widget { "json_class":"Widget" }
    Then I should see status 201 Created
    And  I should see json like '{"ok":true, "id":"widget", "rev":"xxxxxxxxxxxxxxxx"}'

  Scenario: Creating a design Document
    When I put /foo/_design/barney { "views":{} }
    Then I should see status 201 Created
    And  I should see json like '{"ok":true, "id":"_design/barney", "rev":"xxxxxxxxxxxxxxxx"}'

  Scenario: Updating a Document
    When I put /foo/bar { "Key":"New Value", "_rev":"12345" }
    Then I should see status 201 Created
    And  I should see json like '{"ok":true, "id":"bar", "rev":"xxxxxxxxxxxxxxxx"}'

  Scenario: Updating a Document with an outdated Revision
    When I put /foo/bar { "Key":"New Value", "_rev":"1" }
    Then I should see status 409 Conflict
    And  I should see json '{"error":"conflict", "reason":"Document update conflict."}'

  Scenario: Deleting a Document
    When I delete /foo/bar?rev=12345
    Then I should see status 200 OK
    And  I should see json like '{"ok":true, "rev":"xxxxxxxxxxxxxxxx"}'

  Scenario: Deleting a Document with an outdated Revision
    When I delete /foo/bar?rev=1
    Then I should see status 409 Conflict
    And  I should see json '{"error":"conflict", "reason":"Document update conflict."}'
