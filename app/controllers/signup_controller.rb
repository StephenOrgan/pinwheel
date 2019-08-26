class SignupController < ApplicationController
  set_current_tenant_through_filter
  before_action :set_account

  def create
    # user_account = Account.find(params[:account_id])
    # user = user_account.users.build(user_params)
    user = User.new(user_params)


    if user.save
      payload = { user_id: user.id }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.login

      response.set_cookie(JWTSessions.access_cookie,
                          value: tokens[:access],
                          httponly: true,
                          secure: Rails.env.production? )

      render json: { csrf: tokens[:csrf] }
    else
      render json: { error: user.errors.full_messages.join(' ') }, status: :unprocessable_entity
    end
  end


  private

    def user_params
      params.permit(:email, :password, :password_confirmation)
    end

    def set_account
  		@account = Account.find_by(subdomain: request.subdomain)
  		set_current_tenant(@account)
  	end

end
