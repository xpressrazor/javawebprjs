package change.packages.name.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import change.packages.name.domain.Music;
import change.packages.name.mvc.dao.interfaces.MusicDAO;
import change.packages.name.mvc.service.interfaces.MusicService;

/**
 * Override methods from GenericService if you want different implementation
 * other than provided here. You may completely change from default CRUD methods
 * to write our own service methods. However if you need CRUD operations in addition to some more.
 * Add those new methods in MusicService and implement here. In every service implementation class
 * override the constructor to pass the associated DAO as done in following example. Our GenericServiceImpl
 * class waits for a proper DAO class which is of type (or child) of GenericDAO. MusicDAO is one of those
 * type. @Autowired below injects MusicDAOImpl class for us. I recommend you to use this type of implementation
 * in service rather than done in PersonService. Please report if this approach brings some error.
 */ 
@Service
public class MusicServiceImpl extends GenericServiceImpl<Music, Long>
		implements MusicService {

	@Autowired
	public MusicServiceImpl(MusicDAO contactDAO) {
		super(contactDAO);
		
		System.out.println("MusicService Impl creating ...... !!!!!!!!!!!!");

	}
}
