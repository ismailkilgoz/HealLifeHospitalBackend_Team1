package Manage;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
@Getter
@Setter
public class Manage_31_32_33 {

    String US31="SELECT * FROM u201212290_heallifeqa.consultant_register WHERE instruction AND cons_doctor";





    @Getter
    String Query31 = "SELECT * FROM u201212290_heallifeqa.consultant_register WHERE instruction AND cons_doctor";


    private final String Query32 = "SELECT * FROM u201212290_heallifeqa.consultant_register WHERE instruction AND cons_doctor";


    String Query33 = "SELECT s.name, s.surname, cr.instruction from staff s" +
            "join consultant_register cr on cr.cons_doctor = s.id" +
            "join ipd_details id on id.cons_doctor = s.id and cr.cons_doctor =id.cons_doctor";

    String Query033 =  "SELECT cr.instruction, ipd.ipd_registration_id, s.staff_name AS doctor_name " +
            "FROM consultant_register cr " +
            "JOIN ipd_details ipd ON cr.ipd_id = ipd.ipd_id " +
            "JOIN staff s ON cr.cons_doctor = s.staff_id";

}
