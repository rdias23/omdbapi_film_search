# README - Full Stack Engineer Take Home - Alpha

HEROKU URL: ---> copy and paste the URL from unpublished / "not converted" markdown or it will not work (I had issues anyway)
https://agile-shore-45761.herokuapp.com

Instruction Summary: In short, the assignment was to build a web application that uses the API from http://www.omdbapi.com/​ to retrieve movie information and save movies to a "Favorites List" along with Ratings and Comments.

Application Set-Up<br/>
- Clone the repository<br/>
- create a fresh gemset for Ruby 2.5.3 with RVM<br/>
- run bundle install<br/>
- make sure you have Postgres installed and rake db:migrate<br/>
- As per conventions of dotenv-rails gem -- 'OMDB_API_KEY' <br/>specified inside a '.env.development' file located in the <br/>project root is needed. See below... Where the "XXXXXXXXXX"'s<br/> are is where the key information should be.<br/>
			- $ cat .env.development <br/>
				OMDB_API_KEY=XXXXXXXXXX<br/>
- 'rails server' command to start web server on localhost:3000<br/>

Web Application Specs:<br/>
- Rails 5.2.3<br/>
- Ruby 2.5.3<br/>
- relevant gems:<br/>
	- Devise - for user registration<br/>
	- Bootstrap - for styles and grid layout<br/>
	- Faraday - for actually making the connection to the OMDB<br/>API. The code is inside two classes, connection.rb and<br/>request.rb, located inside an omdb folder, located inside<br/> the 'lib' directory at the project root. Only<br/> searches by title that return full plots are<br/> functional, but these classes were built to make adding<br/> other types of searches easy.<br/>
	- acts_as_list<br/>
		- I decided to make the Favorites List easily sortable (e.g. if "Terminator 2" is #1 in the list, you can hit a down arrow to move it down by one position). The acts_as_list gem makes this easy... A User has a Favorites_List, that has and belongs to many Movies through a Favorite_Selection join table / Model with a position attribute used by acts_as_list.
		- dotenv-rails - is used for storing application secret keys. In this case, that means 'OMDB_API_KEY' specified inside a '.env.development' file located in the project root. See below... Where the "XXXXXXXXXX"'s are is where the key information should be.<br/>
			- $ cat .env.development<br/>
				OMDB_API_KEY=XXXXXXXXXX<br/>
- Application Architecture - It's a SPA (Single Page Application) that uses Rails AJAX submit forms with the "remote: true" option. Inside the controller actions you see respond_to blocks with format.js sections specifying *.js.erb files inside the View directories. Those *.js.erb files run javascript that appends rendered partials into the DOM.<br/>
- Application Functionality - Meeting and Exceeding requested functionality<br/>
	- User can search OMDB for Movies by Title using the Search form. Search results show: (1) Title (2) Year (3) poster (4) full summary.<br/>
	- User can add Movie to a Favorites List always visible on the right side of the page.<br/>
	- User can remove Movie from the Favorites List.<br/>
	- User can change the rank / order of Movies in their Favorites List with down and up arrows.<br/>
	- User can View the movie again, with all functionality noted below, without using the Search form, but by using the "View" button for the item in the Favorites List instead. 
	- User can see a list of other Users who have also saved the Movie to their Favorites List.<br/>
	- User can rate the Movie from 1 Star to 4 Stars.
	- User can update the rating for a Movie.<br/>
	- User can see the average rating for a Movie and how many ratings there are.<br/>
	- User can leave a comment for the Movie.<br/>
	- User can update their comment for a movie.<br/>

## Heroku
- HEROKU URL: ---> copy and paste the URL from unpublished / "not converted" markdown or it will not work (I had issues anyway)
https://agile-shore-45761.herokuapp.com <br/>
- You can create a new user account, or if you want to see a list populated with movies already (that are shared with other user lists, so you can see all additional functionality such as average ratings) you can use these credentials:<br/>
	- User Name: dummy_email_1@gmail.com<br/>
	- Password: Rocks47!<br/>
