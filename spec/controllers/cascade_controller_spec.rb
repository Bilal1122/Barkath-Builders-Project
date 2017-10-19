require 'rails_helper'

RSpec.describe CascadeController, :type => :controller do
  let!(:user)  { FactoryGirl.create(:user, name: "bilal") }

  describe "GET index" do
    def do_request
      get :index
    end
    before { do_request }
    it { expect(response).to be_success }
    it { expect(response.status).to eq(200) }
  end

  describe "DELETE hard_delete" do
    let!(:service)  { DeletionService.new(user.id) }
    def do_request
      delete :hard_delete, user_id: user.id
    end
    before { do_request }
    it { expect(response.status).to eq(302) }
    it { expect(response).to redirect_to(cascade_index_path(service.hard_delete)) }
  end

  describe "POST soft_delete" do
    let!(:service)  { DeletionService.new(user.id) }
    def do_request
      post :soft_delete, user_id: user.id
    end
    before { do_request }
    it { expect(response.status).to eq(302) }
    it { expect(response).to redirect_to(cascade_index_path(service.soft_delete)) }
  end

  describe "POST undo_soft_delete" do
    def do_request
      post :undo_soft_delete, user_id: user.id
    end
    before { do_request }
    it { expect(response.status).to eq(302) }
    it { expect(response).to redirect_to(cascade_index_path) }
    it { expect(user.deleted_at).to eq(nil) }
  end

end