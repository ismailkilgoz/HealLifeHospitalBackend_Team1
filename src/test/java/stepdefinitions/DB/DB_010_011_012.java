package stepdefinitions.DB;

import HelperDB.CommonData;
import Manage.Manage_010_011_012;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import static HelperDB.JDBC_Structure_Methods.*;
import static HelperDB.JDBC_Structure_Methods.resultSet;

public class DB_010_011_012 extends Manage_010_011_012 {
    CommonData data = new CommonData();
    Statement statement;
    ResultSet resultSet;
    ResultSetMetaData metaData;

    @Given("User creates Query for {string}")
public void user_creates_query_for(String us) throws SQLException {
        query=getDB_US010();
        resultSet=getStatement().executeQuery(query);
        try {
            switch (us) {
                case "DB_US010":
                    query = getDB_US010();
                    statement = getStatement();
                    resultSet = statement.executeQuery(query);
                    break;

            }
        } catch (Exception e) {
            System.out.println("You entered the US name incorrectly or not at all");
        }
    }

    public String getDB_US010() {
        return "";
    }


    @Given("User prints the ‘DB_US010’ query response returned")
        public void user_prints_the_db_us010_query_response_returned () throws SQLException {
        try {
            while (resultSet.next()) {
                System.out.println(resultSet.getString("child_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        }}

