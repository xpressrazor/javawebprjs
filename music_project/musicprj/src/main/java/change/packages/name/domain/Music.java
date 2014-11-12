package change.packages.name.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "music")
public class Music {
	private Long id;
	private String title;
	private String length;
	private String album;
	private String genere;
	private String description;
	private User loanedTo;
	private Date loanedDate;
	
	@Id
	@GeneratedValue
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
	public String getLength() {
		return length;
	}
	public void setLength(String length) {
		this.length = length;
	}
	public String getAlbum() {
		return album;
	}
	public void setAlbum(String album) {
		this.album = album;
	}
	public String getGenere() {
		return genere;
	}
	public void setGenere(String genere) {
		this.genere = genere;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "loaned_to")
	public User getLoanedTo() {
		return loanedTo;
	}
	public void setLoanedTo(User loanedTo) {
		this.loanedTo = loanedTo;
	}
	
	
	@Column(name = "loaned_date")
	public Date getLoanedDate() {
		return loanedDate;
	}
	public void setLoanedDate(Date loanedDate) {
		this.loanedDate = loanedDate;
	}
	
}
