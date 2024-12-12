Feature: Verifying that a set of data is selected from related tables and the returned data is complete and correct.

  Background: Database connection:

    * Database connection established


  Scenario: US_026: Verifying that the "known_allergies" of the oldest patient in the "patients" table in the database is "Fast food".

    * Prepare a query into the patients table.
    * Verify that a result is turned.
    * Close the connection to Database

  @umitDB
  Scenario: US_027: List the account_title data of the employees with qualification=MS,
  specialisation= Neurology in the staff table by sorting them according to the letter order.

    * Prepare a query into the staff table.
    * Verify that a result set is turned.
    * Close the connection to Database


  Scenario: US_028: Verify that the oldest vehicle in the vehicles table has "driver_name"= "bayram erguven" and "driver_licence"= "b".

    * Prepare a query into the vehicles table.
    * Verify that a resultset is turned.
    * Close the connection to Database