class User < ApplicationRecord
  has_many :meetings, :dependent => :destroy
  has_many :invitations, :dependent => :destroy
  has_many :meetings_invited_to, :through => :invitations, :source => :meeting
end
