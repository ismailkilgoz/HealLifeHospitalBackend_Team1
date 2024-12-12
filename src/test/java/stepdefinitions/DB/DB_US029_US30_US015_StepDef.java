package stepdefinitions.DB;

import HelperDB.CommonDataSeren;
import Manage.Manage_Seren_29_30_15;
import io.cucumber.java.en.Given;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static HelperDB.JDBC_Structure_Methods.*;
import static org.junit.Assert.*;

public class DB_US029_US30_US015_StepDef extends Manage_Seren_29_30_15 {

    CommonDataSeren commonData=new CommonDataSeren();




    @Given("Insert a record with SHA2 encrypted password into the email_config table.")
    public void insert_a_record_with_sha2_encrypted_password_into_the_email_config_table() {
            query=getUS35();
            preparedStatement=getPraperedStatement(query);


    }
    @Given("Verify that the SHA2 encrypted password should be stored in the database.")
    public void verify_that_the_sha2_encrypted_password_should_be_stored_in_the_database() {

    }



    // US29

    @Given("I execute the query to get vehicle lists.")
    public void i_execute_the_query_to_get_vehicle_lists()  {


            query=getUS29();
            resultSet = getResultset(query);



    }
    @Given("Verify that both lists have the same vehicles at the same index.")
    public void verify_that_both_lists_have_the_same_vehicles_at_the_same_index() {
        List<Integer> manufactureYearIds = new ArrayList<>();
        List<Integer> createdYearIds = new ArrayList<>();

        try {
            while (resultSet.next()) {
                manufactureYearIds.add(resultSet.getInt("manufacture_year_id"));
                createdYearIds.add(resultSet.getInt("created_year_id"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Listelerin boyutları aynı
        assertEquals("List sizes are different!", manufactureYearIds.size(), createdYearIds.size());

        // Listelerdeki her bir elemanın aynı
        for (int i = 0; i < manufactureYearIds.size(); i++) {
            assertEquals("Mismatch at index " + i, manufactureYearIds.get(i), createdYearIds.get(i));
        }


    }



                        //_-----------------------------//








}
