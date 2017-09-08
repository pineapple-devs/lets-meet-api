require 'rails_helper'

RSpec.describe Device, type: :model do
  it { should have_db_column(:token).of_type(:string) }
  it { should have_db_column(:os).of_type(:string) }
  it { should have_db_column(:last_notification).of_type(:datetime) }

  it { should belong_to(:user) }
end
