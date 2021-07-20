class CommentPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    return if user.nil?

    true
  end

  def new?
    create?
  end

  def destroy?
    return unless record.user_id == user.id

    true
  end
end
