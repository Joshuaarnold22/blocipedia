class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def update?
    user.present? && user.premium?
  end

  def show?
    wiki.private? || user.present?
  end
end