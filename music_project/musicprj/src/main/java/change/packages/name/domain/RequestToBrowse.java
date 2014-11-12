package change.packages.name.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "request_to_browse")
public class RequestToBrowse {
	private Long id;
	private String itemType; // "MU = Music, MO = Movies, GA = Game
	private Long itemId;
	private List<User> requestedUsers;
	
	@Id
	@GeneratedValue
	@Column(name="request_to_browse_id")
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
		
	@Column(name = "item_id")
	public Long getItemId() {
		return itemId;
	}
	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}
	
	
	@Column(name = "item_type")
	public String getItemType() {
		return itemType;
	}
	public void setItemType(String itemType) {
		this.itemType = itemType;
	}
	
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinTable(name="requested_users",
	joinColumns=@JoinColumn(name="request_to_browse_id"),
	inverseJoinColumns=@JoinColumn(name="user_id")
	)
	
	public List<User> getRequestedUsers() {
		return requestedUsers;
	}
	public void setRequestedUsers(List<User> requestedUsers) {
		this.requestedUsers = requestedUsers;
	}
	
	
}
