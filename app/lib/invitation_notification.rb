class InvitationNotification
  def self.send(invitation, invited_user)
    new(invitation, invited_user).send
  end

  def initialize(invitation, invited_user)
    @invitation = invitation
    @meeting = @invitation.meeting
    @user = @meeting.user
    @devices = invited_user.devices
  end

  def send
    options = {
      data:
      { title: "#{@user.name} has invited you to a meeting!",
        body: "Meeting name: #{@meeting.title}, Meeting description #{@meeting.description}" },
      topic: "com.letsmeet",
      contentAvailable: 1
    }

    gcm.send(devices_to_send, options)
  end

  private

  def devices_to_send
    @devices.pluck(:token)
  end

  def gcm
    @gcm ||= GCM.new(ENV["GCM_API_KEY"])
  end
end
