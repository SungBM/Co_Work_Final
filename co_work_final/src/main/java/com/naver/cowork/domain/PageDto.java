package com.naver.cowork.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageDto {

	private int pageStart; // 페이지 시작 번호
	private int pageEnd; // 페이지 끝 번호
	private boolean next, prev;  // 다음, 이전 버튼 존재 유무
	private int total;  // 행 전체 개수
	private Criteria cri;  // 현재페이지 번호, 행 표시 수
	
	// 생성자(클래스 호출시 변수 값 초기화)
	public PageDto(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.pageEnd = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;  // 페이지 끝 번호
		this.pageStart = this.pageEnd - 9;  // 페이지 시작 번호
		int realEnd = (int)(Math.ceil(total * 1.0 / cri.getViewSize()));  // 전체 마지막 페이지 번호

		if(realEnd < pageEnd) {
			this.pageEnd = realEnd;
		}  // 페이지 끝 번호 유효성 확인
		
		this.prev = this.pageStart > 1;  // 이전버튼 값 초기화
		this.next = this.pageEnd < realEnd;  // 다음버튼 값 초기화

	}
	
}