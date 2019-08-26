module Api
    module Admin
        class AccountsController < ApplicationController
            before_action :authrorize_access_request!
            before_action :set_account, only: [:show, :update, :destroy]

            # GET /accounts
            def index
                @accounts = Account.all

                render json: @accounts
            end

            # GET /accounts/1
            def show
                render json: @account
            end

            # POST /accounts
            def create
                @account = Account.new(account_params)

                if @account.save
                    render json: @account, status: :created, location: @account
                else
                    render json: @account.errors, status: :unprocessable_entity
                end
            end

            # PATCH/PUT /accounts/1
            def update
                if @account.update(account_params)
                    render json: @account
                else
                    render json: @account.errors, status: :unprocessable_entity
                end
            end

            # DELETE /accounts/1
            def destroy
                @account.destroy
            end

            private
            # Use callbacks to share common setup or constraints between actions.
            def set_account
              @account = Accounts.find(params[:id])
            end

            # Only allow a trusted parameter "white list" through.
            def account_params
                params.require(:account).permit(:name, :subdomain)
            end
        end
    end
end
