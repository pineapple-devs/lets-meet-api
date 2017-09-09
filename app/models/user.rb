class User < ApplicationRecord
  has_many :meetings, :dependent => :destroy
  has_many :invitations, :dependent => :destroy
  has_many :meetings_invited_to, :through => :invitations, :source => :meeting
  has_many :devices, :dependent => :destroy

  def as_json(options = {})
    super(options.merge({ except: [:password, :created_at, :updated_at] }))
  end
end
