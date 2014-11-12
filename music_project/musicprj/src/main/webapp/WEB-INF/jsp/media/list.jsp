<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta charset='utf-8'>
		<title>Media Management</title>
		<style>
			* {padding:0; margin:0;}

			html {				
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
		<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
		<script>
			// Wait until the DOM has loaded before querying the document
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
	<h1>Hi ${USERNAME}</h1>
	<a href="<c:url value="/media/addGame" />">Add Game</a>
	<a href="<c:url value="/media/addMovie" />">Add Movie</a>
	<a href="<c:url value="/media/addMusic" />">Add Music</a>
	<a href="<c:url value='/user/logout'/>">Logout </a>
	<c:if test="${USERNAME == 'admin'}">
	<a href="<c:url value='/user/list'/>">Manage Users</a>
	</c:if>
		<ul class='tabs'>
			<li><a href='#tab1'>Games</a></li>
			<li><a href='#tab2'>Movies</a></li>
			<li><a href='#tab3'>Music</a></li>
		</ul>
		<div id='tab1'>
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
		<div id='tab2'>
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
		<div id='tab3'>
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
	</body>
</html>