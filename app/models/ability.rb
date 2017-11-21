class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all
    unless user.role.nil?
      if user.role.name == 'user'
        can :read, :all
        can :manage, User, id: user.id
        can :create, Comment
        can :manage, Comment, user_id: user.id
        can :create, Advert
        can :manage, Advert, user_id: user.id
      elsif user.role.name == 'modereator'
        can :read, :all
        cam :manage, Comment
        can :manage, Advert
      elsif user.role.name == 'admin'
        can :manage, :all
      end
    end
  end
end
