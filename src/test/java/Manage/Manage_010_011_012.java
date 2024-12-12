package Manage;
import lombok.Getter;

import java.util.Map;

@Getter
public class Manage_010_011_012 {

    Map<String, String> queryMap = Map.of(

            "DB_US10","SELECT child_name, case_reference_id FROM birth_report WHERE case_reference_id IN (SELECT case_reference_id FROM birth_report GROUP BY case_reference_id HAVING COUNT(*) > 1);",
            "DB_US11","SELECT id, donor_name, date_of_birth, gender, father_name, address FROM blood_donor WHERE id = 7;",
            "DB_US12","SELECT * FROM blood_donor_cycle WHERE institution IS NOT NULL AND id = 17;"


    );




    // String DB_011=

        //  String US012= "SELECT * FROM u201212290_heallifeqa.blood_donor WHERE id = 7 AND donor_name = 'Maria' AND date_of_birth = '2001-03-02' AND gender = 'Female' AND father_name = 'Jhonson' AND address = 'England';";
    }
