module Api
    module V1
        class CustomersController < ApplicationController
          before_action :authrorize_access_request!
          before_action :set_customer, only: [:show, :update, :destroy]

          # GET /customers
          def index
            @customers = current_user.customer.all

            render json: @customers
          end

          # GET /customers/1
          def show
            @customers = current_user.customer.find(params[:id])
            render json: @customer
          end

          # POST /customers
          def create
            @customer = current_user.customer.build(customer_params)

            if @customer.save
              render json: @customer, status: :created, location: @customer
            else
              render json: @customer.errors, status: :unprocessable_entity
            end
          end

          # PATCH/PUT /customers/1
          def update
            if @customer.update(customer_params)
              render json: @customer
            else
              render json: @customer.errors, status: :unprocessable_entity
            end
          end

          # DELETE /customers/1
          def destroy
            @customer.destroy
          end

          private
            # Use callbacks to share common setup or constraints between actions.
            def set_customer
              @customer = current_user.customer.find(params[:id])
            end

            # Only allow a trusted parameter "white list" through.
            def customer_params
              params.require(:customer).permit(:name, :user_id)
            end
        end
    end
end
