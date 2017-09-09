class InvitationNotification
  def self.send_invitation(invitation, invited_user)
    new(invitation, invited_user).send_invitation
  end

  def self.send_invitation_changed(invitation, invited_user)
    new(invitation, invitation.meeting.user).send_invitation_changed
  end

  def initialize(invitation, invited_user)
    @invitation = invitation
    @meeting = @invitation.meeting
    @meeting_owner = @meeting.user
    @invited_user = invited_user
    @devices = @invited_user.devices
  end

  def send_invitation
    options = {
      data:
      { title: "#{@meeting_owner.name} has invited you to a meeting!",
        body: "Meeting name: #{@meeting.title}, Meeting description #{@meeting.description}",
        user_id: @invited_user.id },
      topic: "com.letsmeet",
      contentAvailable: 1
    }

    gcm.send(devices_to_send(@invited_user), options)
  end

  def send_invitation_changed
    name = @invited_user.try(:name) || @invitation.email
    accepted = @invitation.accepted ? "accepted" : "declined"
    options = {
      data:
      { title: "#{name} has #{accepted} your invitation!",
        body: "Meeting name: #{@meeting.title}, Meeting description #{@meeting.description}",
        user_id: @meeting_owner.id },
      topic: "com.letsmeet",
      contentAvailable: 1
    }

    gcm.send(devices_to_send(@meeting_owner), options)
  end

  private

  def devices_to_send(user)
    user.devices.pluck(:token)
  end

  def gcm
    @gcm ||= GCM.new(ENV["GCM_API_KEY"])
  end
end
