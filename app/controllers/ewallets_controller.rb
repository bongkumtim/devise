class EwalletsController < ApplicationController
	before_action :find, only: [:edit, :update, :destroy]

	def index
		@ewallets = Ewallet.all.order(created_at: :desc)
	end

	def show
		@ewallet = Ewallet.where(user_id: current_user.id)
		@ringgit = @ewallet.where(currency:"ringgitcoin")
		@sing = @ewallet.where(currency:"singcoin")
		@rupiah = @ewallet.where(currency:"rupiahcoin")
		@baht = @ewallet.where(currency:"bahtcoin")
	end

	def ringgit
		@ewallet = Ewallet.where(user_id: current_user.id)
		@ringgit = @ewallet.where(currency:"ringgitcoin")
		render 'ewallets/ringgit'
	end

	def rupiah
		@ewallet = Ewallet.where(user_id: current_user.id)
		@rupiah = @ewallet.where(currency:"rupiahcoin")
		render 'ewallets/rupiah'
	end

	def sing
		@ewallet = Ewallet.where(user_id: current_user.id)
		@sing = @ewallet.where(currency:"singcoin")
		render 'ewallets/sing'
	end

	def baht
		@ewallet = Ewallet.where(user_id: current_user.id)
		@baht = @ewallet.where(currency:"bahtcoin")
		render 'ewallets/baht'
	end

	def new
		@ewallet = current_user.ewallets.build
	end

	def create
		@ewallet = current_user.ewallets.build(ewallet_params)
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
