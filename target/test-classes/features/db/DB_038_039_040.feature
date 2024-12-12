Feature:


  Scenario: US_038 List donors connected to a specific blood bank (for example, blood_bank_product_id = 1).(blood_donor table)
    * Database connection established
    When I query for donors with blood_bank_product_id = 1
   Then I should see the following donors:

   | id  | donor_name            | date_of_birth  | blood_bank_product_id | gender |
   | 3   | Devin Coinneach       | 1994-07-21     | 1                     | Male   |
   | 4   | Brian                 | 1999-06-23     | 1                     | Male   |
   | 16  | Bayram ERguven        | 2020-02-08     | 1                     | Male   |
   | 19  | Eleni Adams           | 2001-05-05     | 1                     | Female |
 * Database closed


  Scenario: US_039 in the Blood_Donor table, verify the names of donors over the age of 50 from the list.
    * Database connection established
    When I query the table for donors over the age of fifty
    Then I should see the following names:
      | Mehmet Uçankuş |
    * Database closed


  Scenario: US_040 List and verify the reference numbers for all dispatches sent to "Sadar" (dispatch_receive table).
    * Database connection established
    When I query the table for dispatches sent to Sadar
    Then I should see the following reference numbers:
      | 789879           |
    * Database closed