require "rails_helper"

RSpec.describe Invitation, :type => :model do
  it { should have_db_column(:email) }
  it { should have_db_column(:accepted) }
  it { should have_db_column(:user_id) }
  it { should have_db_column(:meeting_id) }

  it { should belong_to(:meeting) }
  it { should belong_to(:user) }

  describe "#created_by_user" do
    before do
      @user = User.create
      meeting = @user.meetings.create
      @invitation = meeting.invitations.create
    end

    it "returns invitations created by user" do
      expect(described_class.created_by_user(@user)).to eq([@invitation])
    end
  end
end
