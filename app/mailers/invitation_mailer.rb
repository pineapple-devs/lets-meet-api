class InvitationMailer < ApplicationMailer
  def invitation_mail(invitation)
    @invitation = invitation
    @meeting = @invitation.meeting
    @user = @meeting.user

    mail(to: @invitation.email, subject: "#{@user.name} has invited you to a meeting!")
  end
end
