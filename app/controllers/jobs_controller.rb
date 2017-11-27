class JobsController < ApplicationController
  layout "job"

  before_action :load_job, except: %i(index new create)
  before_action :load_employer, only: :show
  before_action :load_company, only: :show
  before_action :load_jobs, only: :show

  def show; end

  def new
    @job = Job.new
  end

  def create
    @job = current_user.jobs.build job_params
    if @job.save
      respond_to do |format|
        format.js {flash.now[:success] = t ".created"}
      end
    else
      respond_to do |format|
        format.js {flash.now[:danger] = t ".cant_create"}
      end
    end
  end

  def edit; end

  def update
    if @job.update_attributes update_job_params
      respond_to do |format|
        format.js {flash.now[:success] = t ".updated"}
      end
    else
      respond_to do |format|
        format.js {flash.now[:danger] = t ".cant_update"}
      end
    end
  end

  def destroy
    if @job.destroy
      respond_to do |format|
        format.js {flash.now[:success] = t ".destroyed"}
      end
    else
      respond_to do |format|
        format.js {flash.now[:danger] = t ".cant_destroy"}
      end
    end
  end

  private

  def job_params
    params.require(:job).permit :content, :name, :level, :language,
      :skill, :position, :user_id, :company_id, :description
  end

  def update_job_params
    params.require(:job).permit :content, :name, :level, :language,
      :skill, :position, :description
  end

  def load_job
    @job = Job.find_by id: params[:id]
    return if @job
    flash.now[:danger] = t "jobs.method.cant_find_job"
    redirect_to root_url
  end

  def load_jobs
    @jobs = @company.jobs.sort_by_time.paginate(page: params[:page],
      per_page: Settings.paginate.jobs_perpage)
  end

  def load_employer
    @employer = User.find_by id: @job.user_id
    return if @employer
    flash.now[:danger] = t "jobs.method.cant_find_employer"
  end

  def load_company
    @company = Company.find_by id: @job.company_id
    return if @company
    flash.now[:danger] = t "jobs.method.cant_find_company"
  end
end
