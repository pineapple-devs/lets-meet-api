class Meeting < ApplicationRecord
  belongs_to :user
  has_many :intervals, :dependent => :destroy
  has_many :invitations
  has_many :guests, :through => :invitations, :source => :user
end
