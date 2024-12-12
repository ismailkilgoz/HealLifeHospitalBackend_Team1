Feature:


Scenario: DB_US010 List and verify the names of babies who are siblings in the birth_report table.
* Database connection established
* User creates Query for "DB_US010"
* User prints the ‘DB_US010’ query response returned
* Database closed




Scenario:  DB_US11 Verify that the blood donor with id = 7 has donor_name = Maria, date_of_birth = '2001-03-02', gender = Female, father_name = Jhonson, address = England in the blood_donor table.
   Given Database connection established
    Given a blood_donor table with donor details
    When I query for the donor with id = 7
    Then the donor_name should be "Maria"
    And the date_of_birth should be "2001-03-02"
    And the gender should be "Female"
    And the father_name should be "Jhonson"
    And the address should be "England"
    Then Database closed

Scenario: List the id numbers of blood_donor_cycle entries where the institution is known, and verify that id = 17 is in the list.
* Database connection established
* Creates query with
* Creates query with
* Verifies that it CONTAINS datas : "id" values : "17" message : "false"
* Database closed

