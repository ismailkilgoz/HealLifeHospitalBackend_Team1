package stepdefinitions.DB;

import HelperDB.CommonData;
import Manage.Manage;
import config_Requirements.ConfigLoader;
import io.cucumber.java.en.Given;
import org.junit.Assert;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import static HelperDB.CommonData.*;
import static HelperDB.JDBC_Structure_Methods.*;
import static org.junit.Assert.assertFalse;

public class DB_026_027_028 extends Manage {

    public static Connection connection;
    public static Statement statement;
    public static PreparedStatement preparedStatement;
    public static ResultSet resultSet;
    public static String query;
    public static ConfigLoader configLoader = new ConfigLoader();

    @Given("Prepare a query into the patients table.")
    public void prepare_a_query_into_the_table(String table) throws SQLException {

        query = getUS026();
        resultSet = getStatement().executeQuery(query);

    }

    @Given("Verify that a result is turned.")
    public void verify_that_a_result_is_turned() throws SQLException {

        patientsKnown_allergies = new HashMap<>();
        while (resultSet.next()) {

            ResultSetMetaData rsMetaData = resultSet.getMetaData();
            int columnCount = rsMetaData.getColumnCount();

            for (int i = 1; i <= columnCount; i++) {

                String columnName = rsMetaData.getColumnName(i);
                String columnValue = resultSet.getString(i);


                patientsKnown_allergies.put(columnName, columnValue);

                System.out.println(columnName + columnValue);

            }

            if (!patientsKnown_allergies.isEmpty()) {


                for (int i = 0; i < patientsKnown_allergies.size(); i++) {

                    expectedData.put("known_allergies", "Fast food");
                    expectedData.put("created_at", "2021-10-25 07:32:56");

                    Assert.assertEquals(expectedData, patientsKnown_allergies);

                    System.out.println("Expected Data: " + expectedData + "\n" + "Actual Data: " + patientsKnown_allergies);


                }
            } else {

                assertFalse("Resultset is EMPTY", resultSet.next());
            }


        }


    }

    @Given("Close the connection to Database")
    public void close_the_connection_to_database() {

        closeConnection();
    }


    @Given("Prepare a query into the staff table.")
    public void prepare_a_query_into_the_staff_table() throws SQLException {
        query = getUS027();
        resultSet = getStatement().executeQuery(query);
    }

    @Given("Verify that a result set is turned.")
    public void verify_that_a_result_set_is_turned() throws SQLException {
        account_title = new HashMap<>();
        while (resultSet.next()) {

            ResultSetMetaData rsMetaData = resultSet.getMetaData();
            int columnCount = rsMetaData.getColumnCount();

            for (int i = 1; i <= columnCount; i++) {

                String columnName = rsMetaData.getColumnName(i);
                String columnValue = resultSet.getString(i);


                account_title.put(columnName, columnValue);

                System.out.println(columnName + columnValue);

            }

            if (!account_title.isEmpty()) {


                for (int i = 0; i < account_title.size(); i++) {


                    System.out.println(resultSet);

                }
            } else {

                assertFalse("Resultset is EMPTY", resultSet.next());
            }

        }

    }

    @Given("Verify that a resultset is turned.")
    public void verify_that_a_resultset_is_turned() throws SQLException {
        vehicles = new HashMap<>();
        while (resultSet.next()) {

            ResultSetMetaData rsMetaData = resultSet.getMetaData();
            int columnCount = rsMetaData.getColumnCount();

            for (int i = 1; i <= columnCount; i++) {

                String columnName = rsMetaData.getColumnName(i);
                String columnValue = resultSet.getString(i);


                vehicles.put(columnName, columnValue);

                System.out.println(columnName + columnValue);

            }

            if (!vehicles.isEmpty()) {


                for (int i = 0; i < vehicles.size(); i++) {

                    vehiclesExpectedData.put("driver_name", "bayram erguven");
                    vehiclesExpectedData.put("driver_licence", "b");

                    Assert.assertEquals(vehiclesExpectedData, vehicles);

                    System.out.println("Expected Data: " + vehiclesExpectedData + "\n" + "Actual Data: " + vehicles);

                }
            } else {

                assertFalse("Resultset is EMPTY", resultSet.next());
            }

        }

    }

    @Given("Prepare a query into the vehicles table.")
    public void prepare_a_query_into_the_vehicles_table() throws SQLException {
        query = getUS028();
        resultSet = getStatement().executeQuery(query);

    }

}