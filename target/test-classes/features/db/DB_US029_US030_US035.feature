Feature:
  Background: Database connectivity established
    * Database connection established

    #email_config tablosuna sha2 yöntemiyle passwordu korunan 1 veri ekleyiniz.
# 35
 # Scenario:
  #  * Insert a record with SHA2 encrypted password into the email_config table.
  #  * Verify that the SHA2 encrypted password should be stored in the database.
   # * Database closed

#29
  @DBUS
    Scenario: Verify vehicles with same index in both lists

      * I execute the query to get vehicle lists.
      * Verify that both lists have the same vehicles at the same index.
      * Database closed