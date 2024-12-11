Feature:
  Background: Database connectivity established
    * Database connection established

    Scenario: US_07
      * I query the bed table for created_at = '2023-05-04 06:41:17'
      * Verify that is_active is yes in the return table
      * Database closed

      Scenario: US_08
        * I query the bed table for bed group id 4 and is_active no
        * The patient's name should be visible
        * Database closed

          Scenario: US_09
            * I query the birth_report table for babies with weight >= 2.5 kg
            * I should get the correct count of babies with weight >= 2.5 kg
            * Database closed