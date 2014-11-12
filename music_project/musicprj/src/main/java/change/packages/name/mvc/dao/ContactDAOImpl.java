package change.packages.name.mvc.dao;

import org.springframework.stereotype.Repository;

import change.packages.name.domain.Contact;
import change.packages.name.mvc.dao.interfaces.ContactDAO;

@Repository
public class ContactDAOImpl extends GenericDAOImpl<Contact, Long> implements
		ContactDAO {

}
