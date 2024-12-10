package stepdefinitions.DB;

import HelperDB.CommonData;
import Manage.Manage;
import io.cucumber.java.en.Given;
import org.junit.Assert;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static HelperDB.JDBC_Structure_Methods.*;
import static HelperDB.JDBC_Structure_Methods.query;
import static org.junit.Assert.fail;

public class DB_007_008_009 extends Manage {

    @Given("I query the bed table for created_at = '2023-05-04 06:41:17'")
    public void query_prepared_into_the_patients_table() throws SQLException {
        query=getUS07();
        resultSet=getStatement().executeQuery(query);

    }

    @Given("Verify that is_active is yes in the return table")
    public void verify_that_is_active_is_yes_in_the_return_table() throws SQLException {

        if (resultSet.next()) {
            String isActive = resultSet.getString("is_active");
            Assert.assertEquals("yes", isActive);
        } else {
            fail("No data found for the given created_at");
        }
    }

    @Given("I query the bed table for bed group id 4 and is_active no")
    public void i_query_the_bed_table_for_bed_group_id_and_is_active_no() throws SQLException {
        query=getUS08();
        resultSet=getStatement().executeQuery(query);

    }

    @Given("The patient's name should be visible")
    public void the_patient_s_name_should_be_visible() throws SQLException {

        // Meta verilerle sütun adlarını almak
        ResultSetMetaData metaData = resultSet.getMetaData();
        int columnCount = metaData.getColumnCount();

        // "name" sütununun adını bul
        String targetColumnName = "name";
        int columnIndex = -1;

        // Sütun adlarını kontrol et
        for (int i = 1; i <= columnCount; i++) {
            if (metaData.getColumnName(i).equalsIgnoreCase(targetColumnName)) {
                columnIndex = i;
                break;
            }
        }

        // Eğer sütun bulunduysa, ilk satırdaki değeri al
        if (columnIndex != -1 && resultSet.next()) {
            String columnValue = resultSet.getString(columnIndex);
            System.out.println("İlk 'name' sütun değeri: " + columnValue);
        } else {
            System.out.println("Sütun 'name' bulunamadı veya veri yok.");
        }
    }

    @Given("I query the birth_report table for babies with weight >= 2.5 kg")
    public void i_query_the_birth_report_table_for_babies_with_weight_kg() throws SQLException {
        query=getUS09();
        resultSet=getStatement().executeQuery(query);



    }
    @Given("I should get the correct count of babies with weight >= 2.5 kg")
    public void i_should_get_the_correct_count_of_babies_with_weight_kg() throws SQLException {

        List<String> rows = new ArrayList<>();
        while (resultSet.next()) {
            // Örneğin, her satırdaki belirli bir kolonu listeye ekleyebilirsiniz.
            rows.add(resultSet.getString("child_name"));
        }

        Assert.assertEquals("3",rows.size());
        System.out.println("Total number of rows: " + rows.size());
    }

}
