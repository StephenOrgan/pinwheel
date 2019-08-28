class SigninController < ApplicationController
	before_action :authorize_access_request!, only: [:destroy]


	def create
  # set the tenant
	@account = Account.find_by(subdomain: (subdomain_name))
	set_current_tenant(@account)

	# find user with the email passed in the form
	user = User.find_by(email:params[:email])

	# if credentials accepted set the authorized header, otherwise not authorized
	if user.authenticate(params[:password])
		payload = {user_id: user.id}
		session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
		tokens = session.login
		response.set_cookie(JWTSessions.access_cookie,
			value: tokens[:access],
			httponly: true,
			secure: Rails.env.production?)
		render json: { csrf: tokens[:csrf]}
	else
		not_authorized
	end
end

	def destroy
		session = JWTSessions::Session.new(payload: payload)
		session.flush_by_by_access_payload
		render json: :ok
	end


	private

	def not_found
		render json: { error: "Cannot find email/password combination" }, status: :not_found
	end

	def all_params
		params.require(:signin).permit(:email, :password, :subdomain)
	end

	def user_params
		params.require(:signin).permit(:email, :password)
	end

	def subdomain_name
		params.require(:subdomain).split('.').first
	end

end
