class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user.admin == true
  end

  def create?
    user.admin == true
  end

  def update?
    user.admin == true
  end

  def destroy?
    user.admin == true
  end
end
