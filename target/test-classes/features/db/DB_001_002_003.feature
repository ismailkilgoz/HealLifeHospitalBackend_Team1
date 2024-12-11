Feature:
  Background: Database connectivity established
    * Database connection established

    # With the ambulance whose driver is Smith, the patient_id =1 in the ambulance_call table via the database? verify that the shipment has occurred many times.
  Scenario: US01 Verify that shipment has occurred many times with whose driver Smith and the patient_id=1
    * SQL Query01 is prepared and is run
    * SQL Query01 results wil be tested
    * Database closed


  Scenario: data control into the patients table
    * Query prepared into the ambulance call table
    * Verify result is returned US02
    * Database closed

  Scenario: US03 Verify that shipment has occurred many times with whose driver Smith and the patient_id=1
    * SQL Query03 is prepared and is run
    * SQL Query03 results wil be tested
    * Database closed