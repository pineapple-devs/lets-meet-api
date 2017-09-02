require "rails_helper"

RSpec.describe User, :type => :model do
  it { should have_many(:meetings).dependent(:destroy) }
  it { should have_many(:invitations).dependent(:destroy) }
  it { should have_many(:meetings_invited_to).through(:invitations).source(:meeting) }
end
