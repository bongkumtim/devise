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

	def remit		
	end

	def crypto
	end

	def transfer
		@ewallet = Ewallet.new
		@account_a = Account.find_by_user_id(current_user.id)
		@user = Account.where(user_id: current_user.id)
		@users = User.all
		if params[:search]
    	@users = User.search(params[:search])
    	y = @users.first
    	@account_b = Account.find_by_user_id(y.id)
    	
    	if @user.sum(:amount)-100 > 0
    	ActiveRecord::Base.transaction do
    	@account_a.lock!
    	@account_b.lock!
		@account_a.amount -= 100
		@account_a.save!
		@account_b.amount += 100
		@account_b.save!
		end

		flash[:warning] = 'Your account not enough money to do the transfer!'
		redirect_to root_path
	end
	end
	end
	

	def value
		render 'homes/value'
	end

	def new
	end
end
