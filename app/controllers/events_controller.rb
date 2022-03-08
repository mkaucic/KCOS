class EventsController < ApplicationController
	def show
		@event = Event.from_param(params[:id]) || not_found
	end

	def index
		@navigation_is_transparent = true;
		@starred_count = Event.where(starred: true).count
		@events = []
		if @starred_count == 0
			@events = Event.all.sort_by(&:created_at).reverse.take(2) 
			@starred_count = 2
			return
		end

		if @starred_count == 1
			@events << Event.where(starred: true).first
			@events << Event.all.sort_by(&:created_at).reverse.first
			@starred_count = 2
			return
		end

		if @starred_count > 5
			@events = Event.where(starred: true).sort_by(&:created_at).reverse.take(5)
			@starred_count = 5
			return
		end
		@events = Event.where(starred: true).sort_by(&:created_at).reverse

	end

	def all
		@event = Event.all
	end	
end
