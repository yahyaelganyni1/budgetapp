class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Purchase, user: user
    can :manage, Category, user: user
  end
end
