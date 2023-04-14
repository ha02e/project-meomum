package com.mm.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.mm.payment.model.PaymentDAO;

/*@RestController
public class PaymentController {
  @PostMapping("/cancel-payment")
  public ResponseEntity<String> cancelPayment(@RequestBody Map<String, Object> cancelRequest) {
    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(MediaType.APPLICATION_JSON);
    headers.set("Authorization", "2724123558676304");
    String url = "https://api.iamport.kr/payments/cancel";
    RestTemplate restTemplate = new RestTemplate();
    HttpEntity<Map<String, Object>> entity = new HttpEntity<>(cancelRequest, headers);
    ResponseEntity<String> responseEntity = restTemplate.postForEntity(url, entity, String.class);
    return responseEntity;
  }*/
  
  @Controller
  public class PaymentController{
	  
	  @Autowired
	  private PaymentDAO pdao;
	  
	  
	  
  
  
}
