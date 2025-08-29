package com.example.webhook;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Component
public class WebhookStartupRunner implements ApplicationRunner {
    @Override
    public void run(ApplicationArguments args) throws Exception {
        RestTemplate restTemplate = new RestTemplate();
        ObjectMapper objectMapper = new ObjectMapper();

        // Register the webhook
        String registerUrl = "https://bfhldevapigw.healthrx.co.in/hiring/generateWebhook/JAVA";
        Map<String, String> registerPayload = new HashMap<>();
        registerPayload.put("name", "John Doe");
        registerPayload.put("regNo", "REG12347");
        registerPayload.put("email", "john@example.com");

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<Map<String, String>> entity = new HttpEntity<>(registerPayload, headers);
        ResponseEntity<String> response = restTemplate.postForEntity(registerUrl, entity, String.class);

        JsonNode body = objectMapper.readTree(response.getBody());
        String webhookUrl = body.get("webhook").asText();
        String accessToken = body.get("accessToken").asText();

        // Prepare the solution SQL query
        String finalQuery =
                "SELECT p.AMOUNT AS SALARY, " +
                        "CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS NAME, " +
                        "TIMESTAMPDIFF(YEAR, e.DOB, CURDATE()) AS AGE, " +
                        "d.DEPARTMENT_NAME " +
                        "FROM PAYMENTS p " +
                        "JOIN EMPLOYEE e ON p.EMP_ID = e.EMP_ID " +
                        "JOIN DEPARTMENT d ON e.DEPARTMENT = d.DEPARTMENT_ID " +
                        "WHERE DAY(p.PAYMENT_TIME) <> 1 " +
                        "ORDER BY p.AMOUNT DESC LIMIT 1;";

        Map<String, String> solvePayload = new HashMap<>();
        solvePayload.put("finalQuery", finalQuery);

        HttpHeaders webhookHeaders = new HttpHeaders();
        webhookHeaders.setContentType(MediaType.APPLICATION_JSON);
        webhookHeaders.setBearerAuth(accessToken);

        HttpEntity<Map<String, String>> webhookEntity = new HttpEntity<>(solvePayload, webhookHeaders);
        restTemplate.exchange(webhookUrl, HttpMethod.POST, webhookEntity, String.class);
    }
}
