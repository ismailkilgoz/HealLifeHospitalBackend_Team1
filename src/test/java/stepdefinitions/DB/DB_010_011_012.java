package stepdefinitions.DB;

import HelperDB.CommonData;
import Manage.Manage_010_011_012;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import utilities.DB_Utilities.JDBCMethods;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import static HelperDB.JDBC_Structure_Methods.*;
import static HelperDB.JDBC_Structure_Methods.resultSet;
import static org.junit.Assert.assertEquals;
import static utilities.DB_Utilities.JDBCMethods.executeQuery;

public class DB_010_011_012 extends Manage_010_011_012 {
    CommonData data = new CommonData();
    Statement statement;
    ResultSet resultSet;
    ResultSetMetaData metaData;
    JDBCMethods jdbcMethods = new JDBCMethods();



    @Then("The user verifies children who are siblings")
    public void the_user_verifies_children_who_are_siblings() throws SQLException {
        jdbcMethods.birthRecordAccess(resultSet);
    }
    @When("I execute query the database for {string}")
    public void i_execute_query_the_database_for(String queryId) throws SQLException {
        Statement statement = connection.createStatement();
        if (queryId.equals("DB_US10")) {
            String query = "SELECT child_name, case_reference_id FROM birth_report WHERE case_reference_id IN (SELECT case_reference_id FROM birth_report GROUP BY case_reference_id HAVING COUNT(*) > 1);";

            resultSet = statement.executeQuery(query);
        }}
        @When("Execute query the database for {string}.")
        public void execute_query_the_database_for(String queryId) throws SQLException {
            Statement statement = connection.createStatement();
            if (queryId.equals("DB_US11")) {
                String query = "SELECT id, donor_name, date_of_birth, gender, father_name, address FROM blood_donor WHERE id = 7;";
                resultSet = statement.executeQuery(query);
            }
    }
        @Then("The user validates donor data")
        public void the_user_validates_donor_data () throws SQLException {
            resultSet.next();
            assertEquals(resultSet.getInt("id"), 7);
            assertEquals(resultSet.getString("donor_name"), "Maria");
            assertEquals(resultSet.getString("date_of_birth"), "2001-03-02");
            assertEquals(resultSet.getString("gender"), "Female");
            assertEquals(resultSet.getString("father_name"), "Jhonson");
        }
        @When("I execute query the  database  foor {string}")
    public void i_execute_query_the_database_foor(String queryId) throws SQLException {
            Statement statement = connection.createStatement();
            if (queryId.equals("DB_US12")) {
                String query = "SELECT * FROM blood_donor_cycle WHERE institution IS NOT NULL AND id = 17;";
                resultSet = statement.executeQuery(query);
            }}
            @Then("The user finds id 17 in the listed blood_donor_cycle table information")
            public void the_user_finds_id_in_the_listed_blood_donor_cycle_table_information () throws SQLException {
                resultSet.next();
                assertEquals(resultSet.getInt("id"), 17);


            }

        }