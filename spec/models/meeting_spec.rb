require "rails_helper"

RSpec.describe Meeting, :type => :model do
  it { should have_many(:intervals).dependent(:destroy) }
  it { should belong_to(:user) }
end
