package Manage;

import lombok.Getter;

@Getter
public class Manage_001_002_003 {

    //email_type, smtp_server, smtp_port, smtp_username, smtp_password, ssl_tls, smtp_auth, is_active, created_at
    String US35="Insert Into u201212290_heallifeqa.email_config (email_type, smtp_server, smtp_port, smtp_username, smtp_password, ssl_tls, smtp_auth, is_active, created_at) \n" +
            "Values (?,?,?,?,SHA2(?,256),?,?,?,?)" ;
    String US25="Select gender,email From  u201212290_heallifeqa.patients Where patient_name LIKE '%Jain%';";

    String US001= "Insert Into u201212290_heallifeqa.ambulance_call(id, patient_id, case_reference_id, vehicle_id, contact_no, address, vehicle_model, driver,date ) \n" +
            "call_from, call_to, charge_category_id, charge_id, standard_charge, tax_percentage, amount,  net_amount, transaction_id, note, generated_by, created_at";

    /**
     * -- GETTER --
     * ************* GETTER
     */

    @Getter
    private final String Query01 = "SELECT * FROM u201212290_heallifeqa.ambulance_call\n" +
            "WHERE driver = 'Smith' AND patient_id = 1;;";
    private final String Query02 = "INSERT INTO u201212290_heallifeqa.appointment \n" +
            "    (id, patient_id, case_reference_id, visit_details_id, date, time, priority, specialist, doctor, amount, message, appointment_status, source, is_opd, is_ipd, global_shift_id, shift_id, is_queue, live_consult, created_at)\n" +
            "VALUES \n" +
            "    (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    private final String Query03 = "SELECT * FROM u201212290_heallifeqa.appointment \n" +
            "WHERE patient_id = 1\n" +
            "AND live_consult = 'yes';";
}
