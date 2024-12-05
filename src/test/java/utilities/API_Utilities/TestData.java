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

    public HashMap expenseHeadUpdateRequestBody(int id, String exp_category, String description, String is_active, String is_deleted) {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("id", id);
        requestBody.put("exp_category", exp_category);
        requestBody.put("description", description);
        requestBody.put("is_active", is_active);
        requestBody.put("is_deleted", is_deleted);

        return requestBody;
    }

    public HashMap findingCategory(String id, String category){
        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("id",id);
        requestBody.put("category",category);

        return requestBody;
    }




}
