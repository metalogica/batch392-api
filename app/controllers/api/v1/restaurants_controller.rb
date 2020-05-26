class Api::V1::RestaurantsController < Api::V1::BaseController
    acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_restaurant, only: [ :show, :update, :destroy ]

    def index
        # @restaurants = Restaurant.all
        @restaurants = policy_scope(Restaurant)
    end

    def show
    end

    def update
        if @restaurant.update(restaurant_params)
            render :show
        else
            render_error
        end
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        @restaurant.user = current_user # identified by the API token and email
        authorize @restaurant
        if @restaurant.save
            render :show, status: :created #201
        else
            render_error
        end
    end

    def destroy
        @restaurant.destroy
        head :no_content # 204
    end

    private

    def set_restaurant
        # /api/v1/9
        @restaurant = Restaurant.find(params[:id]) # params[:id] == 9
        authorize @restaurant
    end

    def restaurant_params
        params.require(:restaurant).permit(:name, :address)
    end

    def render_error
        render json: { errors: @restaurant.errors.full_messages }, status: 422 # unprocessible entity
    end
end