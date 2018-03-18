package org.gtech.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.annotation.Transient;

@Entity
@Table(name = "message" )
public class Message {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "mid")
	private int id;
	@Column(name = "subject")
	@NotEmpty(message = "*Please provide message subject")
	private String subject;
	@Column(name = "body")
	@NotEmpty(message = "*Please provide message body")
	private String body;
	@Column(name = "query")
	@NotEmpty(message = "*Please provide db query")
	private String query;
	@Column(name = "DB")
	@NotEmpty(message = "*Please provide database")
	private String DB;
	@Column(name = "databasename")
	@NotEmpty(message = "*Please provide databasename")
	private String databasename;
	@Column(name = "port")
	private Long port;
	@Column(name = "hostname")
	@NotEmpty(message = "*Please provide hostname")
	private String hostname;
	@Column(name = "username")
	@NotEmpty(message = "*Please provide database username")
	private String username;
	@Column(name = "password")
	@Length(min = 5, message = "*Your password must have at least 5 characters")
	@NotEmpty(message = "*Please provide database password")
	@Transient
	private String password;
	@Column(name = "status")
	private Boolean status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}
	
	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}
	
	public String getDB() {
		return DB;
	}

	public void setDB(String DB) {
		this.DB = DB;
	}
	
	public String getDatabasename() {
		return databasename;
	}

	public void setDatabasename(String databasename) {
		this.databasename = databasename;
	}

	public Long getPort() {
		return port;
	}

	public void setPort(Long port) {
		this.port = port;
	}
	
	public String getHostname() {
		return hostname;
	}

	public void setHostname(String hostname) {
		this.hostname = hostname;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}
}
