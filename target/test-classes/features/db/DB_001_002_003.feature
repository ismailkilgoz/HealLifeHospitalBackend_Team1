Feature:
  Background: Database connectivity established
    * Database connection established

    # With the ambulance whose driver is Smith, the patient_id =1 in the ambulance_call table via the database? verify that the shipment has occurred many times.
  Scenario: Verify that shipment has occurred many times with whose driver Smith and the patient_id=1
    * I insert the new data to the ambulance_call
    * Verify that 1 added to the table .
    * Database closed
    #US25
  @US25
  Scenario: data control into the patients table
    * Query prepared into the patients table
    * Verify result is returned
    * Database closed