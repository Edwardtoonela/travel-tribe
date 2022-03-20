class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    user
  end

  def destroy?
    user
  end

  def index?
    user
  end

  def accept?
    user
  end

  def reject?
    user
  end

end
