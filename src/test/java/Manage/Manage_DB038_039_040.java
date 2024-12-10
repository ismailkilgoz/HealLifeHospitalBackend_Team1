package Manage;
import lombok.Getter;

@Getter
public class Manage_DB038_039_040 {

    String US038="SELECT * FROM blood_donor WHERE blood_bank_product_id = ?";
    String US039="SELECT donor_name FROM u201212290_heallifeqa.blood_donor WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) > 50;";
    String US040="SELECT id, reference_no, to_title, address, type FROM u201212290_heallifeqa.dispatch_receive WHERE address LIKE '%Sadar%' AND type = 'dispatch';";

}
