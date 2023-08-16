module Api
  module V1
    class ReviewsController < ApplicationController
      
      def create
        review = restaurant.reviews.new(review_params)
        if review.save
          render json: ReviewSerializer.new(review)
        else
          render json: { error: review.errors.messages }, status: 422
        end
      end

      def destroy
        review = Review.find(params[:id])

        unless review
          render json: { error: 'Review not found' }, status: 422
          return
        end

        if review.destroy
          head :no_content
        else
          render json: { error: review.errors.messages }, status: 422
        end
      end

      def update
        review = Review.find(params[:id])

        unless review
          render json: { error: 'Review not found' }, status: 422
          return
        end

        if review.update(review_params)
          render json: ReviewSerializer.new(review), status: 200
        else
          render json: { error: review.errors.messages }, status: 422
        end
      end

      private

      def restaurant
        @restaurant ||= Restaurant.find(params[:restaurant_id])
      end

      def review_params
        params.require(:review).permit(:title, :description, :score, :restaurant_id)
      end
    end
  end
end
