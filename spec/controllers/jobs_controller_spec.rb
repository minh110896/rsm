controller spec:
require "rails_helper"

RSpec.describe jobsController, type: :controller do
  let(:job) {FactoryGirl.create :job}
  subject {job}
  before { sign_in User.first }

  describe "GET #edit" do
    before :each do
      get :edit, xhr: true, params: {id: job.id}
    end
    it "assigns the requested job to @job" do
      expect(assigns(:job)).to eq job
    end
    it "renders the #edit view" do
      expect(response).to render_template :edit
    end
  end

  describe "PATCH #update" do
    it "update job success" do
      patch :update, params: { id: job.id, job:{name: "Vux.", position: "member",
        start_time: "10/12/2017", end_time: "11/11/2017", user_id: User.first.id} },
          xhr: true, format: "js"
      expect(flash[:success]).to match(I18n.t("jobs.update.update_success"))
    end
    it "update user fail" do
      patch :update, params: { id: job.id, job:{name: "", start_time: "12/11/2017"} },
        xhr: true, format: "js"
      expect(flash[:danger]).to match(I18n.t("jobs.update.update_fail"))
    end
  end
end
