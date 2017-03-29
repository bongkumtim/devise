class AccountsController < ApplicationController
	before_action :find, only: [:show, :edit, :destroy, :update]

	def index
		@accounts = Account.all.order(created_at: :desc)
	end

	def show
	end

	def new
		@account = Account.new
	end

	def create
		@account = Account.new(account_params)
		if @account.save
			flash[:success] = "You successfully top up your e-Wallet!"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		@account.update(account_params)
	end

	def destroy
		@account.destroy
		redirect_to root_path

	end

	private

	def find
		@account= Account.find(params[:id])
	end

	def account_params
		params.require(:account).permit(:ringgitcoin, :bahtcoin, :singcoin, :rupiahcoin)
	end

end
