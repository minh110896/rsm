class Ability
  include CanCan::Ability

  def initialize user, controller_namespace = nil
    if user.present?
      case controller_namespace
        when "Employers"
          permission_employer user
        else
          if user.employer?
            permission_employer user
          elsif user.admin?
            permission_admin
          end
          permission_user user
      end
    end
  end

  def permission_employer user
    return unless user.employer?
    if user.members.present?
      can :update, Company do |company|
        company.id == user.members.last.company_id && user.members.last.end_time.nil?
      end
    end
    can :manage, Company, id: user.id
    can :manage, Member, id: user.id
  end

  def permission_admin
    can :manage, :all
  end

  def permission_user user
    can :read, :all
    can :update, User, id: user.id
    can :manage, Club, user_id: user.id
    can :manage, Achievement, user_id: user.id
    can :manage, Certificate, user_id: user.id
    can :manage, Experience, user_id: user.id
    can :manage, BookmarkLike, user_id: user.id
    can :manage, Apply, user_id: user.id
  end
end
