package change.packages.name.mvc.dao;

import org.springframework.stereotype.Repository;

import change.packages.name.domain.Game;
import change.packages.name.mvc.dao.interfaces.GameDAO;

@Repository
public class GameDAOImpl extends GenericDAOImpl<Game, Long> implements
		GameDAO {

}
