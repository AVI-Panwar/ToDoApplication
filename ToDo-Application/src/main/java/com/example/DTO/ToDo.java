package com.example.DTO;

import java.sql.Date;
/*import java.time.LocalDate;*/

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.annotation.Nonnull;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity 
@Table (name="tbl_todo")
public class ToDo {
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	@Nonnull
	private Long id;
    
	@Column 
	@Nonnull
	private String title;
    
	@Column 
	@Nonnull
	/* @DateTimeFormat (pattern="yyyy-MM-dd") */
	private String date;
    
	@Column 
	private String status;

	public ToDo() {

	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}



	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
