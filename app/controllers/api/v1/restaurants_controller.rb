module Api
  module V1
    class RestaurantsController < ApplicationController

      def index
        restaurants = Restaurant.all

        render json: RestaurantSerializer.new(restaurants, options)
      end
      
      def show
        restaurant = Restaurant.find_by(slug: params[:slug])

        if restaurant
          render json: RestaurantSerializer.new(restaurant, options)
        else
          render json: { error: 'Restaurant not found' }, status: 422
        end
      end

      def create
        restaurant = Restaurant.new(restaurant_params)
        
        if restaurant.save
          render json: RestaurantSerializer.new(restaurant)
        else
          render json: { error: restaurant.errors.messages }, status: 422
        end
      end

      def update
        restaurant = Restaurant.find_by(slug: params[:slug])

        unless restaurant
          render json: { error: 'Restaurant not found' }, status: 422
          return
        end

        if restaurant.update(restaurant_params)
          render json: RestaurantSerializer.new(restaurant, options)
        else
          render json: { error: restaurant.errors.messages }, status: 422
        end
      end

      def destroy
        restaurant = Restaurant.find_by(slug: params[:slug])

        unless restaurant
          render json: { error: 'Restaurant not found' }, status: 422
          return
        end

        if restaurant.destroy
          head :no_content
        else
          render json: { error: restaurant.errors.messages }, status: 422
        end
      end

      private

      def restaurant_params
        params.require(:restaurant).permit(:name, :image_url)
      end

      def options
        @options ||= { include: %i[reviews] }
      end
    end 
  end
end
