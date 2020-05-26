class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # Restaurant.where(user: current_user)
      scope.all
      # Restaurant.all
    end
  end

  def show?
    # public api, anyone can use
    true 
  end

  def update?
    # only the restaurant owner is allowed to update it
    true if record.user == user
    # true if @restaurant.user == current_user
  end

  def create?
    # only users with an API token can create a record
    true if user
    # true if current_user.present?
  end

  def destroy?
    # only the user that created the record can delete it
    update?
    # true if record.user == user
  end
end
