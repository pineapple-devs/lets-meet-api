require "rails_helper"

RSpec.describe User, :type => :model do
  it { should have_many(:meetings) }
  it { should have_many(:meetings_invited_to).through(:invitations).source(:meeting) }
end
