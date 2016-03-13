class VisitorsController < ApplicationController
	def new
		@owner = Owner.new
		Rails.logger.debug 'DEBUG: Owner is' +@owner.countdown.to_s
	end
end
