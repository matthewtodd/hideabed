Feature: Server
  In order to gather meta-information about the server
  As a developer
  I want the server to provide it to me

  Scenario: Info
    When I get /
    Then I should see json '{"version":"0.9"}'
