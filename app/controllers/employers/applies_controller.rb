class Employers::AppliesController < ApplicationController
  before_action :current_ability
  before_action :load_apply, only: %i(update destroy)
  layout "employers/employer"

  def show
    @applies = Job.find_by(id: params[:id]).applies.page(params[:page]).per(Settings.apply.page)
  end

  def destroy
    if @apply.Not_receive?
      flash[:warning] = t "employers.apply.destroyfail"
    else
      @apply.destroy
      flash[:success] = t "employers.apply.destroysuc"
    end
    redirect_to employers_apply_path
  end

  def update
    if @apply.update_attributes apply_params
      flash[:success] = t "employers.apply.destroysuc"
    else
      flash[:warning] = t "employers.apply.destroyfail"
    end
    redirect_to employers_apply_path
  end

  private

  def apply_params
    params.require(:apply).permit :status, :user_id, :job_id
  end

  def load_apply
    @apply = Apply.find_by id: params[:id]
    return if @apply
    flash.now[:danger] = t "employers.apply.notfind"
    else
    redirect_to root_url
  end
end
