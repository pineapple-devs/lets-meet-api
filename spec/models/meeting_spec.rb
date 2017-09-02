require "rails_helper"

RSpec.describe Meeting, :type => :model do
  it { should belong_to(:user) }
  it { should have_many(:intervals).dependent(:destroy) }
  it { should have_many(:invitations).dependent(:destroy) }
  it { should have_many(:guests).through(:invitations).source(:user) }
end
