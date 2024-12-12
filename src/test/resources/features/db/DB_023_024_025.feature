Feature:

  Background: Database connectivity established
    Given Database connection established


  Scenario: DB_023- Check that the other information in the medicine_supplier table
  in the database is correct for the data whose address is "Andheri, Mumbai".

    Then  User creates Query for DB_US23
    And   Verifies that the returned informations for the data are correct
    Then  Database closed


  Scenario: DB_024- It must be verified that multiple data entry can be made to the nurse_note table via the database.

    Then  User creates Query for multiple data 3 entry on the nurse_note table
    And   Verifies that the 3 datas added to the nurse_note table
    Then  Database closed


  Scenario: DB_025- Please verify the gender and email information of the patients whose
  patient_name contains "Jain" in the patients table via the database.

    Then  User creates Query for DB_US25
    And   Verifies that the returned information for the patient_name, gender and email are correct
    Then  Database closed




