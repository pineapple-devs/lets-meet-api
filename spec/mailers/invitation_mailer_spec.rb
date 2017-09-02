require "rails_helper"

RSpec.describe InvitationMailer, type: :mailer do
  describe "#invitation_mail" do
    before do
      @user = User.create(:name => "defunkt")
      @meeting = @user.meetings.create(:title => "GitHub Universe",
                                       :description => "Where we show off GitHub")
      @invitation = @meeting.invitations.create(:email => "everyone@github.com")

      @mail = described_class.invitation_mail(@invitation)
    end

    it "renders the headers" do
      expect(@mail.subject).to eq("defunkt has invited you to a meeting!")
      expect(@mail.to).to eq(["everyone@github.com"])
      expect(@mail.from).to eq(["pineappledevs@gmail.com"])
    end

    it "renders the body" do
      expect(@mail.body.encoded).to match("Hi there!")
    end
  end
end
