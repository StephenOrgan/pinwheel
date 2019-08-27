class HomeController < ApplicationController
	set_current_tenant_through_filter

	before_action :authorize_access_request!

	def index
		# @account = current_user.accounts.find(params[:id])
		@account = Account.find(@account.id)
		render json: @account
	end

end
