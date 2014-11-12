package change.packages.name.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import change.packages.name.domain.Contact;
import change.packages.name.domain.Game;
import change.packages.name.domain.Movie;
import change.packages.name.domain.Music;
import change.packages.name.mvc.service.interfaces.ContactService;
import change.packages.name.mvc.service.interfaces.GameService;
import change.packages.name.mvc.service.interfaces.MovieService;
import change.packages.name.mvc.service.interfaces.MusicService;

@Controller
@RequestMapping("/media/*")
public class MediaController {
	@Autowired
	private GameService gameService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private MusicService musicService;

	@RequestMapping
	public String list(Model model, HttpServletRequest request) {
	
		HttpSession session = request.getSession();
		
		
		
		if(session.getAttribute("USERNAME") != null) {
		
			//System.out.println("USERNAME: " + session.getAttribute("myAtribute").toString());
			
			model.addAttribute("gameList", gameService.findAll());
			model.addAttribute("movieList", movieService.findAll());
			model.addAttribute("musicList", musicService.findAll());

			return "media/list";
		} else {
			return "redirect:/user/login";
		}
	}
	
	@RequestMapping("/addGame")
	public String addGame(Model model) {
		model.addAttribute("game", new Game());		

		return "media/addGame";
	}
	
	/* Game section */
	@RequestMapping(value = "/addGame", method = RequestMethod.POST)
	public String addGame(@ModelAttribute("game") Game game) {

		gameService.create(game);

		return "redirect:/media/";
	}
	
	@RequestMapping("/editGame/{id}")
	public String editGame(@PathVariable("id") Long id, Model model) {
		Game game = gameService.findById(id);
		

		model.addAttribute("game", game);

		return "media/editGame";
	}
	
	@RequestMapping(value = "/editGame/{id}", method = RequestMethod.POST)
	public String editGame(@PathVariable("id") Long id,
			@ModelAttribute("game") Game game) {	

		gameService.update(game);

		return "redirect:/media/";
	}
	
	@RequestMapping("/deleteGame/{id}")
	public String deleteGame(@PathVariable("id") Long id) {
		gameService.delete(id);

		return "redirect:/media/";
	}
	
	/* Game section ends */
	
	
	
	
	/* Movie section */
	@RequestMapping("/addMovie")
	public String addMovie(Model model) {
		model.addAttribute("movie", new Movie());		

		return "media/addMovie";
	}
	@RequestMapping(value = "/addMovie", method = RequestMethod.POST)
	public String addMovie(@ModelAttribute("movie") Movie movie) {

		movieService.create(movie);

		return "redirect:/media/";
	}
	
	@RequestMapping("/editMovie/{id}")
	public String editMovie(@PathVariable("id") Long id, Model model) {
		Movie movie = movieService.findById(id);
		

		model.addAttribute("movie", movie);

		return "media/editMovie";
	}
	
	@RequestMapping(value = "/editMovie/{id}", method = RequestMethod.POST)
	public String editMovie(@PathVariable("id") Long id,
			@ModelAttribute("movie") Movie movie) {	

		movieService.update(movie);

		return "redirect:/media/";
	}
	
	@RequestMapping("/deleteMovie/{id}")
	public String deleteMovie(@PathVariable("id") Long id) {
		movieService.delete(id);

		return "redirect:/media/";
	}
	/* Movie section ends */
	
	/* Music section */
	@RequestMapping("/addMusic")
	public String addMusic(Model model) {
		model.addAttribute("music", new Music());		

		return "media/addMusic";
	}
	@RequestMapping(value = "/addMusic", method = RequestMethod.POST)
	public String addMusic(@ModelAttribute("music") Music music) {

		musicService.create(music);

		return "redirect:/media/";
	}
	
	@RequestMapping("/editMusic/{id}")
	public String editMusic(@PathVariable("id") Long id, Model model) {
		Music music = musicService.findById(id);
		

		model.addAttribute("music", music);

		return "media/editMusic";
	}
	
	@RequestMapping(value = "/editMusic/{id}", method = RequestMethod.POST)
	public String editMusic(@PathVariable("id") Long id,
			@ModelAttribute("music") Music music) {	

		musicService.update(music);

		return "redirect:/media/";
	}
	
	@RequestMapping("/deleteMusic/{id}")
	public String delete(@PathVariable("id") Long id) {
		musicService.delete(id);

		return "redirect:/media/";
	}
	/* Music section ends */	
}
