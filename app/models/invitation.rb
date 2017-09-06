class Invitation < ApplicationRecord
  belongs_to :user, :optional => true
  belongs_to :meeting

  def self.created_by_user(user)
    Invitation.joins(:meeting => [:user]).where("users.id" => user.id)
  end
end
