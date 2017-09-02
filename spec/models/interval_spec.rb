require "rails_helper"

RSpec.describe Interval, :type => :model do
  it { should belong_to(:user) }
  it { should belong_to(:meeting) }
end
