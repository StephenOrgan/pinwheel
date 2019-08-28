class ApplicationController < ActionController::API
	include JWTSessions::RailsAuthorization
	rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized
	set_current_tenant_through_filter
	# protect_from_forgery with: :exception
	before_action :set_account

	private

	def set_account
	  if request.subdomain.present?
			@account = Account.find_by(subdomain: request.subdomain)
	  	set_current_tenant(@account)
		elsif @current_user.present?
			@account = Account.find(@current_user.account.id)
			set_current_tenant(@account)
		end
	end

	def current_user
		@current_user ||= User.find(payload['user_id'])
	end

	def not_authorized
		render json: {error: 'Not authorized' }, status: :unauthorized
	end
end
