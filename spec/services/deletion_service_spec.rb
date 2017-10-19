require 'rails_helper'

describe DeletionService do
  let!(:user)  { FactoryGirl.create(:user,  name: "Sheikh", email: "Sheikh@live.com") }
  let!(:job)  { FactoryGirl.create(:job, user_id: user.id, job_type: "dispatch") }
  let!(:job1)  { FactoryGirl.create(:job, user_id: user.id, job_type: "dispatch") }
  let!(:task)  { FactoryGirl.create(:task, job_id: job.id, task_name: "get me some food") }
  let!(:task1)  { FactoryGirl.create(:task, job_id: job1.id, task_name: "get me some desert") }

  describe 'hard_delete' do
    let!(:service)   { DeletionService.new(user.id) }

    before { service.hard_delete }
    
    it "should destroy the user" do
      expect(User.all.count).to equal(0)
    end
    it "should destroy user jobs" do
      expect(user.jobs.count).to equal(0)
    end
    it "should destroy tasks associated to user.jobs" do
      expect(Task.where(job_id: [user.jobs.pluck(:id)]).count).to equal(0)
    end
    it { expect(service.hard_delete).to eq({success: true, user_name: "Sheikh", hard_del: true}) }
  end

  describe 'soft_delete' do
    let!(:service)   { DeletionService.new(user.id) }

    before { service.soft_delete }

    it { expect(User.all.count).to equal(1) }
    it { expect(user.jobs.count).to eq(2) }
    it { expect(Task.where(job_id: [user.jobs.pluck(:id)]).count).to eq(2) }
    it { expect(user.jobs.count).to eq(2) }
    it { expect(service.soft_delete).to eq({success: true, user_name: "Sheikh", hard_del: false}) }
    # it "should change user.deleted_at to time.now" do
    #   expect{service.soft_delete}.to change{user.deleted_at}.from(nil).to(Time.now)
    # end
  end
end