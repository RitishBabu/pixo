package com.cts.training.pixo.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table
public class Media {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int id;
	
	@Column
	private String tags;
	
	@Column
	private String description;
	
	@Column
	private String title;
	
	@Lob
	@Column
	private byte[] photo;
	
	@Column
	private String photo_loc;
	
	@ManyToOne(fetch=FetchType.LAZY, targetEntity=User.class, cascade=CascadeType.ALL)
	@JoinColumn
	private User user;
	public Media() {
		// TODO Auto-generated constructor stub
	}

	public Media(int id, String tags, String description, String title, byte[] photo, String photo_loc) {
		super();
		this.id = id;
		this.tags = tags;
		this.description = description;
		this.title = title;
		this.photo = photo;
		this.photo_loc = photo_loc;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public String getPhoto_loc() {
		return photo_loc;
	}

	public void setPhoto_loc(String photo_loc) {
		this.photo_loc = photo_loc;
	}
	
}
