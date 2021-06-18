class UserPolicy < ApplicationPolicy
  def index?
    user.is_admin?
  end

  def show?
    user.is_admin? || user == record
  end

  def block_user?
    return false unless record.active? || !user.is_admin?

    user.is_admin? && user != record
  end

  def activate_user?
    return false if record.active? || !user.is_admin?

    user.is_admin? && user != record
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
