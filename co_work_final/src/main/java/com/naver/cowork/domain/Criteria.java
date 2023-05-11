package com.naver.cowork.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Criteria {
	private int pageNum;  // 페이지 번호
	private int viewSize;  // 한 페이지 출력 data
	private int skip;  // 페이지 skip
	private String user_id;
	private String DOCUMENT_FORM_CODE;
	private String startDate;
	private String endDate;
	private String searchSelect;
	private String searchData;
	private String title;
	private String name;

	public Criteria(int pageNum, int viewSize) {
		this.pageNum = pageNum;
		this.viewSize = viewSize;
		this.skip = (pageNum - 1) * viewSize;
	}

	public Criteria() {
		this(1, 10);
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		this.skip = (this.pageNum - 1) * viewSize;
	}

	public String makeQueryString(int pageNum) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("pageNum", pageNum)
				.queryParam("viewSize", viewSize)
				.queryParam("user_id", user_id)
				.queryParam("DOCUMENT_FORM_CODE", DOCUMENT_FORM_CODE)
				.queryParam("startDate", startDate)
				.queryParam("endDate", endDate)
				.queryParam("searchSelect", searchSelect)
				.queryParam("searchData", searchData)

				.build()
				.encode();
		return uriComponents.toUriString();
	}

}