package com.spring.beans;

public class BoardPages {
	private int pageSize;//한 화면에 보여지는 글 개수
	private int currentPage;//현재 페이지 번호
	private int count;//전체 글 개수
	private int content_num;//화면에 보여지는 글의 번호
	private int startRow;//페이지에서 보여지는 글 중 가장 첫번째 글
	private int endRow;//페이지에서 보여지는 글 중 가장 마지막 글
	private int pageCount;//전체 글의 수/페이지 사이즈
	private int startPage;//가장 첫번째 페이지번호, 1,11,21,....
	private final int pageBlock=10; // 보여지는 페이지 수
	private int endPage;//가장 마지막 페이지번호, 10,20,30,....
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getContent_num() {
		return content_num;
	}
	public void setContent_num(int content_num) {
		this.content_num = content_num;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getPageBlock() {
		return pageBlock;
	}

	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
}
