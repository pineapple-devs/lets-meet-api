class User < ApplicationRecord
  has_many :meetings, :dependent => :destroy
end
