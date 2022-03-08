class AboutUsController < ApplicationController
	def index
		@about_us = AboutUs.first
		@about_us_title = AboutUs.first.title
		@about_us_body = AboutUs.first.static_body
		@team = Team.all
		@venues = Venue.all
	end
end
