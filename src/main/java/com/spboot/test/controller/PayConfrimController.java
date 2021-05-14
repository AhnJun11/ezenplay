package com.spboot.test.controller;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class PayConfrimController {

	@PostMapping("/pay/confirm")
	public void confirm(@RequestBody Map<String,Object> param) {
		log.info("iamport callback param=>{}",param);
	}
	
	public static void main(String[] args) {
		IamportClient client = new IamportClient("3037516194226791", "oSuI7sXtwgb4oPfiiuvVhu4vG3kIXKylD34Lv1e2iq7GgmZyRut9YyEFBYnyJWUnZY9vZnyiOGY42XCU");
		try {
			IamportResponse<Payment> response= client.paymentByImpUid("imp_496383648913");
			Payment payment = response.getResponse();
			log.info("payment=>{}",payment.getAmount());
			if(!payment.getAmount().equals(new BigDecimal(1100))) { //long으로도 처리가안되는숫자,엄청큰숫자
				CancelData cd = new CancelData("imp_496383648913",true);
				IamportResponse<Payment> cPayment = client.cancelPaymentByImpUid(cd);
				log.info("cancel=>{}",cPayment.getResponse().getCancelAmount());
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (IamportResponseException e) {
			e.printStackTrace();
		}
	}
}
