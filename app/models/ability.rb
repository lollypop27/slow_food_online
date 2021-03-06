class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      elsif user.rest_owner?
        can :manage, Restaurant, user: user
        can :read, :all
      else
        can :read, :all
      end
  end
end
