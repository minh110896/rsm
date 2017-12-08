class Employers::UsersController < ApplicationController
  before_action :load_user, only: :show
  layout "employers/employer"

  def show
    @users = Apply.find_by(id: params[:id])
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash.now[:danger] = t "employers.apply.notfind"
    else
    redirect_to root_url
  end
end
