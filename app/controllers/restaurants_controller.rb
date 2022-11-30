class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Restaurant.all
    end

    def show
        render json: find_restaurant, serializer: RestaurantWithPizzasSerializer
    end

    def destroy
        restaurant = find_restaurant
        restaurant.destroy
        head :no_content
    end


    private

    def find_restaurant
        Restaurant.find(params[:id])
    end

    def render_unprocessable_entity_response(exception)
        render json: exception.record.errors, status: :unprocessable_entity
      end
    
      def render_not_found_response
        render json: { error: "Restaurant not found" }, status: :not_found
      end

end
