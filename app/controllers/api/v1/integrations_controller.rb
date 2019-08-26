module Api
    module V1
        class IntegrationsController < ApplicationController
          before_action :set_integration, only: [:show, :update, :destroy]

          # GET /integrations
          def index
            @integrations = current_user.account.integration.all

            render json: @integrations
          end

          # GET /integrations/1
          def show
            render json: @integration
          end

          # POST /integrations
          def create
            @integration = current_user.account.integration.build(integration_params)

            if @integration.save
              render json: @integration, status: :created, location: @integration
            else
              render json: @integration.errors, status: :unprocessable_entity
            end
          end

          # PATCH/PUT /integrations/1
          def update
            if @integration.update(integration_params)
              render json: @integration
            else
              render json: @integration.errors, status: :unprocessable_entity
            end
          end

          # DELETE /integrations/1
          def destroy
            @integration.destroy
          end

          private
            # Use callbacks to share common setup or constraints between actions.
            def set_integration
              @integration = current_user.account.integration.find(params[:id])
            end

            # Only allow a trusted parameter "white list" through.
            def integration_params
              params.require(:integration).permit(:name, :account_id)
            end
        end
    end
end
