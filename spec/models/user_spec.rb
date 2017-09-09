require "rails_helper"

RSpec.describe User, :type => :model do
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:password).of_type(:string) }
  it { should have_db_column(:email_opt_in).of_type(:boolean).with_options(:default => true) }
  it { should have_db_column(:push_opt_in).of_type(:boolean).with_options(:default => true) }

  it { should have_many(:meetings).dependent(:destroy) }
  it { should have_many(:invitations).dependent(:destroy) }
  it { should have_many(:meetings_invited_to).through(:invitations).source(:meeting) }
  it { should have_many(:devices).dependent(:destroy) }
end
