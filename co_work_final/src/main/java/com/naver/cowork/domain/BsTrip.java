package com.naver.cowork.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BsTrip {
	String DOCUMENT_FORM_CODE;
	String USERID;
	String DocumentName;
	String bstripDate;
	String bstripDestination;
	String bstripStopOver;
	String bstripLocation;
	String bsContent;
	String bstripPerDiem;
	String bstripRoomCharge;
	String bstripTransportationCost;
	String bstripExtraCost;
	String bstripAllCost;
	String bstripName;
	List<String> nameValues;
	List<String> jobValues;
}
