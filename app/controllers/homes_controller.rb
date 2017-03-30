class HomesController < ApplicationController

	def index
		@ewallet = Ewallet.where(user_id: current_user.id)
	end

	def new
	end
end
