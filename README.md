# README

Apple Interview: Coding Assignment

Requirements:
*	Must be done in Ruby on Rails
*	Accept an address (Zip Code) as input
*	Retrieve forecast data for the given address. This should include, at minimum, the current temperature (Bonus points - Retrieve high/low and/or extended forecast)
*	Display the requested forecast details to the user
*	Cache the forecast details for 30 minutes for all subsequent requests by zip codes. Display indicator if result is pulled from cache.

Assumptions:
*	This project is open to interpretation
*	Functionality is a priority over form
*	If you get stuck, complete as much as you can

Submission:
*	Use a public source code repository (GitHub, etc) to store your code
*	Send us the link to your completed code


Response:
* This is a basic app, using one /new form, and one /show. As it is for "reporting", there is no /edit or /delete.
* Since a user will simply "request" forcasts, not knowing what forecasts may have been previously created, the /new form is used for both creating new forecasts, and refreshing old ones.
* Forecasts are cached in a PostgreSQL database. The cache is set to expire after 30 minutes. Any record older than 30 minutes is considered "stale" and will be refreshed.
* The /show page displays the forecast details, and indicates if the forecast was pulled from the cache.
* The /show page also has a link to the /new form, so the user can request a new forecast.

Setup:
There are two steps for setup:
1) Clone the repository, do a `bundle`.
2) Do a `rails db:create db:migrate`.

You can they run `rails s` and go to `http://localhost:3000/` to start the app.

Note: Is is a precursor to have the latest Ruby, Rails, and PostgreSQL installed on your system.
