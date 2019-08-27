require 'uri'

class SignupController < ApplicationController
  set_current_tenant_through_filter

  def create
    # user_account = Account.find(params[:account_id])
    # user = user_account.users.build(user_params)


    @account = Account.find_by(subdomain: (subdomain_name))
    set_current_tenant(@account)
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

    def all_params
      params.require(:signup).permit(:email, :password, :password_confirmation, :subdomain)
    end

    def user_params
      params.require(:signup).permit(:email, :password, :password_confirmation)
    end

    def subdomain_name
      params.require(:subdomain).split('.').first
    end

end
