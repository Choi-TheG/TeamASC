package com.project.asc.vo;

public class Paging {
	private int page = 1;			// 현재 페이지 수(get)
	private int totalCount;			// row 전체의 수(get)
	private int beginPage;			// 출력 시작
	private int endPage;			// 출력 끝
	private int displayRow = 9;		// 한 페이지에 출력할 게시물 수
	private int displayPage = 5;	// 한 페이지에 출력할 페이지 수
	boolean prev;					// prev 버튼 보이기 여부
	boolean next;					// next 버튼 보이기 여부
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		paging();
	}
	public int getBeginPage() {
		return beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getDisplayRow() {
		return displayRow;
	}
	public void setDisplayRow(int displayRow) {
		this.displayRow = displayRow;
	}
	public int getDisplayPage() {
		return displayPage;
	}
	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}
	private void paging() {
//		prev, next, beginPage, endPage를 계산해서 만든다
		
//		1/9 0.1(올림)
		endPage =((int)Math.ceil(page/(double)displayPage))*displayPage;
		System.out.println("endPage : " + endPage);
		beginPage = endPage - (displayPage -1 );
		System.out.println("beginPage : " + beginPage);
		
		int totalPage = (int)Math.ceil(totalCount/(double)displayRow);
		
		if(totalPage<endPage) {
			endPage = totalPage;
			next = false;
		} else {
			next = true;
		}
		prev = (beginPage==1)?false:true; // page가 6 이상일 때만 나옴
		System.out.println("endPage : "+endPage);
		System.out.println("totalPage : "+totalPage);
	}
}
