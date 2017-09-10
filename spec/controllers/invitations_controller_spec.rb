require 'rails_helper'

RSpec.describe InvitationsController, type: :controller do
  before do
    @user = User.create
    @invited_user = User.create
    @meeting = Meeting.create(:user => @user)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, :params => {
        :user_id => @user.id, :meeting_id => @meeting.id
      }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    before do
      @invitation = Invitation.create(:meeting => @meeting,
                                      :user => @invited_user)
    end

    it "returns http success" do
      get :index, :params => {
        :user_id => @user.id, :meeting_id => @meeting.id, :id => @invitation.id
      }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    before do
      @invitation = Invitation.create(:meeting => @meeting)
    end

    it "returns http success" do
      get :update, :params => {
        :user_id => @user.id, :meeting_id => @meeting.id, :id => @invitation.id,
        :invitation => { :email => "defunkt@github.com", :accepted => true }
      }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #answer_email" do
    before do
      @invitation = Invitation.create(:meeting => @meeting)
    end

    it "returns http success" do
      get :answer_email, :params => {
        :user_id => @user.id, :meeting_id => @meeting.id, :invitation_id => @invitation.id,
        :invitation => { :email => "defunkt@github.com", :accepted => true }
      }
      expect(response).to have_http_status(:success)
    end
  end

end
