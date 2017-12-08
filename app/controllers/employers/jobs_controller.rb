class Employers::JobsController < Employers::EmployersController
  before_action :current_ability
  before_action :load_job, only: :destroy

  def index
    @jobs = @company.jobs.page(params[:page]).per(Settings.apply.page)
  end

  def destroy
    if @job.destroy
      flash[:success] = t "employers.apply.destroysuc"
    else
      flash[:warning] = t "employers.apply.destroysuc"
    end
    redirect_to employers_jobs_path
  end

  private

  def load_job
    @job = Job.find_by id: params[:id]
    return if @job
    flash.now[:danger] = t "employers.apply.notfind"
    else
    redirect_to root_url
  end
end
