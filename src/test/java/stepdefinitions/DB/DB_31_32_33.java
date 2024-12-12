package stepdefinitions.DB;

import HelperDB.JDBC_Structure_Methods;
import Manage.Manage;
import HelperDB.CommonData;

import config_Requirements.ConfigLoader;
import io.cucumber.java.PendingException;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import static HelperDB.JDBC_Structure_Methods.*;
import static HelperDB.JDBC_Structure_Methods.query;
import static org.junit.Assert.assertTrue;


import java.net.URLConnection;
import java.sql.*;
import java.util.*;


import static io.netty.handler.codec.rtsp.RtspHeaders.Values.URL;
import static java.sql.DriverManager.getConnection;
import static org.junit.Assert.*;

public class DB_31_32_33 extends Manage {
    CommonData data = new CommonData();

    private Connection connection;
    private ResultSet resultSet;

    private List<Map<String, Object>> result;

    PreparedStatement preparedStatement1;
    String query;


    @Given("a database with a consultant_register table")
    public void a_database_with_a_consultant_register_table() throws SQLException {
        try {
            // Database bağlantısını açma
            connection = DriverManager.getConnection(configLoader.getDatabaseConfig("URL"),
                    configLoader.getDatabaseConfig("USERNAME"),
                    configLoader.getDatabaseConfig("PASSWORD"));
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    @When("I run the query to group instructions count by doctor")
    public void i_run_the_query_to_group_instructions_count_by_doctor() throws SQLException {
        String query = "SELECT cons_doctor, COUNT(instruction) AS instruction \n" +
                "FROM consultant_register \n" +
                "GROUP BY cons_doctor";

        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);

        result = new ArrayList<>();
        while (resultSet.next()) {
            Map<String, Object> row = new HashMap<>();
            row.put("cons_doctor", resultSet.getString("cons_doctor"));
            row.put("instruction", resultSet.getInt("instruction"));
            result.add(row);
        }
    }

    @Then("I should get a result with the doctor names and their respective instruction counts")
    public void ı_should_get_a_result_with_the_doctor_names_and_their_respective_instruction_counts() throws PendingException {


        if (result == null || result.isEmpty()) {
            fail("Result is empty. No data retrieved.");
        }

// Assert that each row has the required data
        for (Map<String, Object> row : result) {
            assertNotNull("Doctor name is null", row.get("cons_doctor"));
            assertNotNull("Instruction count is null", row.get("instruction"));

            // Additional logging for debugging
            System.out.println("Doctor: " + row.get("cons_doctor") + ", Instructions: " + row.get("instruction"));

            // Optional: Verify specific expected structure or values, if applicable
            assertTrue("Instruction count should be a non-negative number",
                    Integer.parseInt(row.get("instruction").toString()) >= 0);
        }
    }







    /*@Given("I have access to the consultant_register table")
    public void i_have_access_to_the_consultant_register_table() {
        try {
            // Database bağlantısını açma
            connection = DriverManager.getConnection(configLoader.getDatabaseConfig("URL"),
                    configLoader.getDatabaseConfig("USERNAME"),
                    configLoader.getDatabaseConfig("PASSWORD"));
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    @When("I query for instructions given between {string} and {string}")
    public void i_query_for_instructions_given_between_and(String startDate, String endDate) {
        try {
            // SQL sorgusunu yazma
            String query = "SELECT * FROM u201212290_heallifeqa.consultant_register WHERE created_at BETWEEN ? AND ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, startDate); // 2024-01-01
            preparedStatement.setString(2, endDate);   // 2024-01-31

            resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }*/


    @Then("Retrieves the requested query in the given date range")
    public void retrieves_the_requested_query_in_the_given_date_range() throws SQLException {
        query=getUS32();

        resultSet= getStatement().executeQuery(query);
        if (resultSet.next()) {
            int rowCount = resultSet.getInt("row_count");
            if (rowCount > 0) {
                System.out.println("Belirtilen tarih aralığında " + rowCount + " kayıt var.");
            } else {
                System.out.println("Belirtilen tarih aralığında kayıt bulunamadı.");
            }
        }
    }




    @Then("I should see a list of instructions given in January {int}")
    public void i_should_see_a_list_of_instructions_given_in_january(Integer int1) {
        try {
            boolean hasResults = resultSet.next();
            assertTrue("There should be instructions in January 2024", hasResults);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }












    @Given("a database with consultant_register, ipd_details, and staff tables")
    public void a_database_with_consultant_register_ipd_details_and_staff_tables() {
        try {
            // Database bağlantısını açma
            connection = DriverManager.getConnection(configLoader.getDatabaseConfig("URL"),
                    configLoader.getDatabaseConfig("USERNAME"),
                    configLoader.getDatabaseConfig("PASSWORD"));
        } catch (SQLException e) {
            e.printStackTrace();
 }


    }
    @When("I query for instructions, IPD registration, and doctor names")
    public void i_query_for_instructions_ipd_registration_and_doctor_names() throws SQLException {

        query=getUS33();
        resultSet=getStatement().executeQuery(query);



        result = new ArrayList<>();
        while (resultSet.next()) {
            Map<String, Object> row = new HashMap<>();
            row.put("instruction", resultSet.getString("instruction"));
            row.put("ipd_registration_id", resultSet.getString("ipd_registration_id"));
            row.put("doctor_name", resultSet.getString("doctor_name"));
            result.add(row);
        }
    }
    @Then("I should get a list of instructions with corresponding IPD registration and doctor names")
    public void i_should_get_a_list_of_instructions_with_corresponding_ipd_registration_and_doctor_names() {
        // Validate the results are not empty
        assertNotNull("Results should not be null.", result);
        assertFalse("Results should not be empty.", result.isEmpty());

        // Log the results for debugging
        for (Map<String, Object> row : result) {
            System.out.println("Instruction: " + row.get("instruction") +
                    ", IPD Registration: " + row.get("ipd_registration_id") +
                    ", Doctor: " + row.get("doctor_name"));

            // Ensure all fields have data
            assertNotNull("Instruction is null.", row.get("instruction"));
            assertNotNull("IPD Registration is null.", row.get("ipd_registration_id"));
            assertNotNull("Doctor name is null.", row.get("doctor_name"));
        }
    }
    }




