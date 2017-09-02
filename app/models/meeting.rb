class Meeting < ApplicationRecord
  belongs_to :user
  has_many :intervals, :dependent => :destroy
  has_many :invitations, :dependent => :destroy
  has_many :guests, :through => :invitations, :source => :user
end
