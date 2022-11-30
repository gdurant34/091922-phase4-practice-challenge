class PizzasController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Pizza.all
    end

    private

    def render_unprocessable_entity_response(exception)
        render json: exception.record.errors, status: :unprocessable_entity
      end
    
      def render_not_found_response
        render json: { error: "Pizza not found" }, status: :not_found
      end
end
