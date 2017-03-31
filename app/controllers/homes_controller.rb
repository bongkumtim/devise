class HomesController < ApplicationController

	def index
		@ewallet = Ewallet.where(user_id: current_user.id).order(created_at: :desc)
		
		ringgit = @ewallet.where(currency: 'ringgitcoin')
		@ringgit = ringgit.sum(:balance)

		sing = @ewallet.where(currency: 'singcoin')
		@sing = sing.sum(:balance)

		rupiah = @ewallet.where(currency: 'rupiahcoin')
		@rupiah = rupiah.sum(:balance)

		baht = @ewallet.where(currency: 'bahtcoin')
		@baht = baht.sum(:balance)
	end

	def new
	end
end
