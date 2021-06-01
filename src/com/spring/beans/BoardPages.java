package com.spring.beans;

public class BoardPages {
	private int pageSize;//�� ȭ�鿡 �������� �� ����
	private int currentPage;//���� ������ ��ȣ
	private int count;//��ü �� ����
	private int content_num;//ȭ�鿡 �������� ���� ��ȣ
	private int startRow;//���������� �������� �� �� ���� ù��° ��
	private int endRow;//���������� �������� �� �� ���� ������ ��
	private int pageCount;//��ü ���� ��/������ ������
	private int startPage;//���� ù��° ��������ȣ, 1,11,21,....
	private final int pageBlock=10; // �������� ������ ��
	private int endPage;//���� ������ ��������ȣ, 10,20,30,....
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
