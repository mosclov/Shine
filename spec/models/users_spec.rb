require "rails_helper.rb"
require "support/violate_check_constraint_matcher"

describe User do
  describe "email" do
    let(:user) {
      User.create!(email: "foo@a.com",
                   password: "qwertyquerty",
                   password_confirmation: "qwertyquerty")
    }
    it "absolutely prevents invalid email addresses" do
      expect {
        user.update_attribute(:email, "foobar@fooland.com")
      }.to violate_check_contraint(:email_must_be_company_email)
    end
  end
end
