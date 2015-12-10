require "rails_helper"

RSpec.describe EmployeeNotifier, type: :mailer do
  describe "signed_up" do
    let(:mail) { EmployeeNotifier.signed_up }

    it "renders the headers" do
      expect(mail.subject).to eq("Signed up")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "verified" do
    let(:mail) { EmployeeNotifier.verified }

    it "renders the headers" do
      expect(mail.subject).to eq("Verified")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "verify" do
    let(:mail) { EmployeeNotifier.verify }

    it "renders the headers" do
      expect(mail.subject).to eq("Verify")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
