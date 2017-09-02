# Preview all emails at http://localhost:3000/rails/mailers/invitation_mailer
class InvitationMailerPreview < ActionMailer::Preview
  def invitation_mailer
    InvitationMailer.invitation_mail(Invitation.first)
  end
end
