package utilities.API_Utilities;

import base.BaseTest;

import java.util.HashMap;

public class TestData extends BaseTest {

    public HashMap visitorsPurposeUpdateRequestBody(int id, String visitors_purpose, String description) {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("id", id);
        requestBody.put("visitors_purpose", visitors_purpose);
        requestBody.put("description", description);

        return requestBody;
    }


    public HashMap bloodGroupUpdateRequestBody(int id, String name, String is_blood_group) {

        HashMap<String, Object> bloodGrouprequestBody = new HashMap<>();

        requestBody.put("id", id);
        requestBody.put("name", name);
        requestBody.put("is_blood_group", is_blood_group);

        return bloodGrouprequestBody;
    }
}
