module UsersHelper
  def display_name_by user_id
    @display_name_user = User.find_by id: user_id
    @display_name_user ? @display_name_user.name : t("virtual_employer")
  end
end
