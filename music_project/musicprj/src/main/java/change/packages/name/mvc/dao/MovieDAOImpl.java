package change.packages.name.mvc.dao;

import org.springframework.stereotype.Repository;

import change.packages.name.domain.Movie;
import change.packages.name.mvc.dao.interfaces.MovieDAO;

@Repository
public class MovieDAOImpl extends GenericDAOImpl<Movie, Long> implements
		MovieDAO {

}
