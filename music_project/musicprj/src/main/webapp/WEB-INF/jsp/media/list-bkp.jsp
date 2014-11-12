<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="<c:url value="/resources/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui/jquery-ui.js"/>"></script>
<style>
* {padding:0; margin:0;}

			html {
				background:url(/img/tiles/wood.png) 0 0 repeat;
				padding:15px 15px 0;
				font-family:sans-serif;
				font-size:14px;
			}

			p, h3 { 
				margin-bottom:15px;
			}

			div {
				padding:10px;
				width:600px;
				background:#fff;
			}

			.tabs li {
				list-style:none;
				display:inline;
			}

			.tabs a {
				padding:5px 10px;
				display:inline-block;
				background:#666;
				color:#fff;
				text-decoration:none;
			}

			.tabs a.active {
				background:#fff;
				color:#000;
			}
</style>
<title>List Contact</title>
 <script>
 $(document).ready(function(){
	$('ul.tabs').each(function(){
	    // For each set of tabs, we want to keep track of
	    // which tab is active and it's associated content
	    var $active, $content, $links = $(this).find('a');

	    // If the location.hash matches one of the links, use that as the active tab.
	    // If no match is found, use the first link as the initial active tab.
	    $active = $($links.filter('[href="'+location.hash+'"]')[0] || $links[0]);
	    $active.addClass('active');

	    $content = $($active[0].hash);

	    // Hide the remaining content
	    $links.not($active).each(function () {
	      $(this.hash).hide();
	    });

	    // Bind the click event handler
	    $(this).on('click', 'a', function(e){
	      // Make the old tab inactive.
	      $active.removeClass('active');
	      $content.hide();

	      // Update the variables with the new link and content
	      $active = $(this);
	      $content = $(this.hash);

	      // Make the tab active.
	      $active.addClass('active');
	      $content.show();

	      // Prevent the anchor's default click action
	      e.preventDefault();
	    });
	  });
});
</script>
</head>
<body>
	<a href="<c:url value="/media/addGame" />">Add Game</a>
	<a href="<c:url value="/media/addMovie" />">Add Movie</a>
	<a href="<c:url value="/media/addMusic" />">Add Music</a>
	
	<!--  Games section -->
	
	<ul class='tabs'>
	<li><a href="#tabs1">Games</a></li>
	<li><a href="#tabs2">Movies</a></li>
	<li><a href="#tabs3">Music</a></li>
	</ul>
	
	<div id="tabs1"> <!-- tabs-1 -->	
	<c:if test="${!empty gameList}">
		<div class="table">
			<table border="1" width="50%">
				<tr class="heading">
					<td width="10%">Id</td>
					<td width="20%">Title</td>
					<td width="20%">Genere</td>
					<td width="20%">Description</td>
					<td>&nbsp;</td>
				</tr>
				<c:forEach items="${gameList}" var="game" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td><a href="view/${game.id}">${game.title}</a></td>
						<td>${game.genere}</td>
						<td>${game.description}</td>
						<td><a href="editGame/${game.id}">edit</a> &nbsp;<a
							href="deleteGame/${game.id}">delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</c:if>
	</div>
	<!-- Games section ends -->
	<!--  Movie section -->
	<div id="tabs2">	
	<c:if test="${!empty movieList}">
		<div class="table">
			<table border="1" width="50%">
				<tr class="heading">
					<td width="10%">Id</td>
					<td width="20%">Title</td>
					<td width="20%">Genere</td>
					<td width="20%">Description</td>
					<td>&nbsp;</td>
				</tr>
				<c:forEach items="${movieList}" var="movie" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td><a href="view/${movie.id}">${movie.title}</a></td>
						<td>${movie.genere}</td>
						<td>${movie.description}</td>
						<td><a href="editMovie/${movie.id}">edit</a> &nbsp;<a
							href="deleteMovie/${movie.id}">delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</c:if>
	</div>
	<!--  Movie section ends -->
	
	<!--  Music section -->
	<div id="tabs3">	
	<c:if test="${!empty musicList}">
		<div class="table">
			<table border="1" width="50%">
				<tr class="heading">
					<td width="10%">Id</td>
					<td width="20%">Title</td>
					<td width="20%">Genere</td>
					<td width="20%">Description</td>
					<td>&nbsp;</td>
				</tr>
				<c:forEach items="${musicList}" var="music" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td><a href="view/${music.id}">${music.title}</a></td>
						<td>${music.genere}</td>
						<td>${music.description}</td>
						<td><a href="editMusic/${music.id}">edit</a> &nbsp;<a
							href="deleteMusic/${music.id}">delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</c:if>
	</div>
	<!--  Music section ends -->
	
	

</body>
</html>