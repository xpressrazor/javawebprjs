package change.packages.name.mvc.dao;

import org.springframework.stereotype.Repository;

import change.packages.name.domain.User;
import change.packages.name.mvc.dao.interfaces.UserDAO;

@Repository
public class UserDAOImpl extends GenericDAOImpl<User, Long> implements
		UserDAO {

}
