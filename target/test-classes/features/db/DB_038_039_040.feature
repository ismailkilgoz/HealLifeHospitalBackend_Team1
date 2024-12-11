Feature:

  Scenario: US_038 List donors connected to a specific blood bank (for example, blood_bank_product_id = 1).(blood_donor table)
    * Database connection established
    When I query for donors with blood_bank_product_id = 1
    Then I should see the following donors:

      | ID  | Name            | DOB         | Blood Bank Product ID | Gender | Guardian Name   | Address                           | Phone      | Last Donation Date      |
      | 3   | Devin Coinneach | 1994-07-21  | 1                     | Male   | David           | 56 Main Street, Suite 3, Brooklyn, NY 11210-0000 | 7418529630 | 2021-10-26 11:59:02    |
      | 4   | Brian           | 1999-06-23  | 1                     | Male   |                 | 7 Main Street, Apt. Central Brooklyn | 8756756778 | 2021-10-26 12:19:34    |
      | 16  | Bayram ERguven  | 2020-02-08  | 1                     | Male   |                 |                                   |            | 2023-02-03 12:37:57    |
      | 19  | Eleni Adams     | 2001-05-05  | 1                     | Female | Jonathan Adams  | New York                          | 15151515   | 2024-11-17 16:37:03    |
    * Database closed


  Scenario: US_039 in the Blood_Donor table, verify the names of donors over the age of 50 from the list.
    * Database connection established
    When I query the table for donors over the age of 50
    Then I should see the following names:
      | Name           |
      | Mehmet Uçankuş |
    * Database closed

  Scenario: US_040 List and verify the reference numbers for all dispatches sent to "Sadar" (dispatch_receive table).
    * Database connection established
    When I query the table for dispatches sent to "Sadar"
    Then I should see the following reference numbers:
      | Reference Number |
      | 789879           |
    * Database closed