require "rails_helper"

RSpec.describe Invitation, :type => :model do
  it { should have_db_column(:email) }
  it { should have_db_column(:accepted) }
  it { should have_db_column(:user_id) }
  it { should have_db_column(:meeting_id) }

  it { should belong_to(:meeting) }
  it { should belong_to(:user) }
end
