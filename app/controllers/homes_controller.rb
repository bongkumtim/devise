class HomesController < ApplicationController

	def index
		@accounts = Account.all
	end

	def new
	end
end
