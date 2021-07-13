class CommentPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def destroy?
    return unless record.user_id == user.id && user.is_admin?

    true
  end
end
