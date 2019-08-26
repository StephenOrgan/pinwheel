class HomeController < ApplicationController
	# before_action :authrorize_access_request!
	def index
		# @account = current_user.accounts.find(params[:id])
		@accounts = Account.all
		render json: @accounts
	end
end
