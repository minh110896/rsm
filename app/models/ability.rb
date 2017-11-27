class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    if user.present?
      if user.employer?
        if user.members.present?
          can :update, Company do |company|
            user.members.last.end_time.nil? && company.id == user.members.last.company_id
          end
        end
      else user.admin?
        can :manage, :all
      end
      can :read, :all
      can :manage, Achievement, user_id: user.id
    end
  end
end

