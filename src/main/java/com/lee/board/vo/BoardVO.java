
package com.lee.board.vo;

import java.util.Date;

public class BoardVO {
	private int bno;
	private String mbti_type;
	private String writer;
	private String title;
	private String content;
	private Date now_date;
	private int hit;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getMbti_type() {
		return mbti_type;
	}
	public void setMbti_type(String mbti_type) {
		this.mbti_type = mbti_type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getNow_date() {
		return now_date;
	}
	public void setNow_date(Date now_date) {
		this.now_date = now_date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
}