package com.cts.training.pixo.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.persistence.JoinColumn;

@Entity
@Table
public class User {
	
	
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int userId;
	
	@Column(name="username")
	private String username;
	
	@Column(name="email")
	private String email;
	
	@Column(name="password")
	private String password;
	
	@Lob
	@Column(name="photo")
	private byte[] photo;
	
	@Column(length=300)
	private String photo_loc;
	
	@OneToMany(mappedBy="user", cascade=CascadeType.ALL, fetch=FetchType.LAZY, targetEntity=Media.class)
	private List<Media> media;

	@ManyToMany
	@JoinTable(name="follow",joinColumns=@JoinColumn(name="userId"),inverseJoinColumns=@JoinColumn(name="friendId")
	)
	private List<User> followof;


	

	public User() {
		// TODO Auto-generated constructor stub
	}
	

	public User(String username, String email, String password, byte[] photo, String photo_loc, List<Media> media,
			List<User> followof) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;
		this.photo = photo;
		this.photo_loc = photo_loc;
		this.media = media;
		this.followof = followof;
	}


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	
	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public List<Media> getMedia() {
		return media;
	}

	public void setMedia(List<Media> media) {
		this.media = media;
	}

	public List<User> getFollowof() {
		return followof;
	}

	public void setFollowof(List<User> followof) {
		this.followof = followof;
	}
	
	
}
