module Api
	module V1
		class EventsController < ApplicationController
			def index
				events = Event.order('date DESC')
				render json: {status: 'SUCCESS', msg: 'Loaded events', data: events}, status: :ok
			end
		end
	end
end