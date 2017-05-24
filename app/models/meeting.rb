class Meeting < ApplicationRecord
  belongs_to :user
  has_many :intervals, :dependent => :destroy
end
