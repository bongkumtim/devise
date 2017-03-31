class HomesController < ApplicationController

	def index
		@ewallet = Ewallet.where(user_id: current_user.id)
		@ringgit = @ewallet.find_by(currency: 'ringgitcoin')
	end

	def new
	end
end
