class EwalletsController < ApplicationController
	before_action :find, only: [:show, :edit, :update, :destroy]

	def index
		@ewallets = Ewallet.all.order(created_at: :desc)
	end

	def show
	end

	def new
		@ewallet = Ewallet.new
	end

	def create
		@ewallet = Ewallet.new(ewallet_params)
		@ewallet.user_id =  current_user.id
		if @ewallet.save
		flash[:sucess] = 'You succesfully top up!'
		redirect_to root_path
	else
		render 'new'
	end
	end

	def edit
	end

	def update
		@ewallet.update(ewallet_params)
	end

	def destroy
		@ewallet.destroy
		redirect_to root_path
	end

	private

	def find
		@ewallet = Ewallet.find(params[:id])
	end

	def ewallet_params
		params.require(:ewallet).permit(:currency, :description, :choice, :balance)
	end

end
