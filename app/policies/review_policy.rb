class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user
  end

  def create?
    user
  end

  def index?
    user
  end

  def edit?
    user
  end

  def update?
    user
  end

  def destroy?
    user
  end

end
