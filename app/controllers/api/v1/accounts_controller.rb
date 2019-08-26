module Api
    module V1
        class AccountsController < ApplicationController
            before_action :authrorize_access_request!
            before_action :set_account, only: [:show]

            # GET /accounts/1
            def show
                render json: @account
            end


            # Only allow a trusted parameter "white list" through.
            def account_params
                params.require(:account).permit(:name, :subdomain)
            end
        end
    end
end
