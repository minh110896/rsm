class AppliesController < ApplicationController
  before_action :load_job, only: :show
  before_action :load_user, only: :show
  before_action :load_apply, only: :show

  def show

    @applies = Apply.find_job params[:id]
  end

  def new
    @apply = Apply.new
  end

  def create
    debugger
    @apply = Apply.new apply_params
    if @apply.save
      flash[:success] = "Apply succes"
    else
      flash[:danger] = "Apply fail"
    end
    redirect_to job_path
  end

  def edit

  end

  def update

  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:warning] = t "users_controller.errorss"
    redirect_to root_path
  end

  def load_job
    @job = Job.find_by id: params[:id]
    return if @job
    flash.now[:danger] = t "jobs.method.cant_find_job"
    redirect_to root_url
  end

  def load_apply
    @apply = Apply.find_job id: params[:id]
    return if @apply
    flash[:danger] = "fail"
    redirect_to root_path
  end

  def apply_params
    params.require(:apply).permit :status, :user_id, :job_id
  end
end
