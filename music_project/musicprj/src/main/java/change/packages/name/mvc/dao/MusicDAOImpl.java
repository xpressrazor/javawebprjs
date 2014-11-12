package change.packages.name.mvc.dao;

import org.springframework.stereotype.Repository;

import change.packages.name.domain.Music;
import change.packages.name.mvc.dao.interfaces.MusicDAO;

@Repository
public class MusicDAOImpl extends GenericDAOImpl<Music, Long> implements
		MusicDAO {

}
