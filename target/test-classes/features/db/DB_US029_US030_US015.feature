Feature:
  Background: Database connectivity established
    * Database connection established

#29

    Scenario: Verify vehicles with same index in both lists

      * I execute the query to get vehicle lists.
      * Verify that both lists have the same vehicles at the same index.
      * Database closed

    #30

  Scenario: Verify visitor's name for given related_to and purpose

    * The visitors_book table contains data
    * I fetch the visitor's name with related_to "Maria Fernandis (4) (OPDN24)" and purpose "visit".
    * The visitor's name should be "Jhon".
    * Database closed

    #US15

  @DBUS
  Scenario:
    #ipd_id, date, ins_date, instruction, cons_doctor, created_at
    * I insert the new data to the consultant_register table
   #* Verify that 1 added to the table
    * Database closed