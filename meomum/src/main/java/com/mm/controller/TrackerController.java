package com.mm.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class TrackerController {

	private static final String API_KEY = "sjLmbhJEhPXnO5neAx7FNg"; 
	
    @GetMapping("/deliveryTracker/{trackingNumber}")
    public ResponseEntity<String> getSweetTrackerInfo(@PathVariable("trackingNumber") String trackingNumber) {
        RestTemplate restTemplate = new RestTemplate();

        String apiUrl = "http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key={apiKey}&t_code={trackingNumber}";
        
        SweetTrackerResponse response = 
        		restTemplate.getForObject(apiUrl, SweetTrackerResponse.class, API_KEY, trackingNumber);

        return ResponseEntity.ok(response.toString());
    }

    private static class SweetTrackerResponse {
        private String code;
        private String itemName;
        private List<TrackingDetail> trackingDetails;

        // Getters and Setters
        public String getCode() {
			return code;
		}

		public void setCode(String code) {
			this.code = code;
		}

		public String getItemName() {
			return itemName;
		}

		public void setItemName(String itemName) {
			this.itemName = itemName;
		}

		public List<TrackingDetail> getTrackingDetails() {
			return trackingDetails;
		}

		public void setTrackingDetails(List<TrackingDetail> trackingDetails) {
			this.trackingDetails = trackingDetails;
		}

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("운송장번호: ").append(code).append("\n");
            sb.append("상품명: ").append(itemName).append("\n");
            sb.append("배송상태: ").append(trackingDetails.get(0).getStatusLabel()).append("\n");
            sb.append("배송시간: ").append(trackingDetails.get(0).getDateTime()).append("\n");

            return sb.toString();
            
        }



		private static class TrackingDetail {
        	 private String statusLabel;
        	 private String dateTime;

        	 // Getters and Setters
        	    public String getStatusLabel() {
        	        return statusLabel;
        	    }

        	    public void setStatusLabel(String statusLabel) {
        	        this.statusLabel = statusLabel;
        	    }

        	    public String getDateTime() {
        	        return dateTime;
        	    }

        	    public void setDateTime(String dateTime) {
        	        this.dateTime = dateTime;
        	    }

            @Override
            public String toString() {
                return "TrackingDetail{" +
                        "statusLabel='" + statusLabel + '\'' +
                        ", dateTime='" + dateTime + '\'' +
                        '}';
            }
        }
    }
    
    
    
	
}
