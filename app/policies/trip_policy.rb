class TripPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    user
  end

  def create?
    user
  end

  def edit?
    owner_or_admin?
  end

  def update?
    owner_or_admin?
  end

  def destroy?
    owner_or_admin?
  end

  private

  def owner_or_admin?
    @record.user == @user || admin? # read it as @trip.user == current_user || current_user.admin == true
  end

  def admin?
    if @user != nil
      @user.admin
    else
      false
    end
  end
end
