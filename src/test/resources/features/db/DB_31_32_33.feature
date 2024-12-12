Feature: Group consultant_register
Background:
* Database connection established
  Scenario:  As a user, I want to group the instructions count by doctor from the consultant_register table
    Given a database with a consultant_register table
    When I run the query to group instructions count by doctor
    Then I should get a result with the doctor names and their respective instruction counts
    Then Database closed



  Scenario: 2024 yılı Ocak ayında verilen talimatların listelenmesi
   #Given I have access to the consultant_register table
    Then  Retrieves the requested query in the given date range
    Then Database closed




  Scenario: List instructions with IPD registration and doctor names
    Given a database with consultant_register, ipd_details, and staff tables
    When I query for instructions, IPD registration, and doctor names
    Then I should get a list of instructions with corresponding IPD registration and doctor names
    Then Database closed