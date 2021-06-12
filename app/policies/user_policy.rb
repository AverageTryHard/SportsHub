class UserPolicy < ApplicationPolicy
  def index?
    user.is_admin?
  end

  def show?
    user.is_admin? || user == record
  end

  class Scope < Scope
    def resolve
      scope.all
      if user.is_admin?
        scope
      else
        scope.none
      end
    end
  end
end
