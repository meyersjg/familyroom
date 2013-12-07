class InviteMailer < ActionMailer::Base
  default from: "johngmeyers@gmail.com"

def invite_members(family_id, first_name, email)
    @family_id = family_id
    @first_name = first_name
    @email = email
    @url  = "localhost:3000/invite_member"

    mail(:to => @email,
         :subject => "You Are Invited To FamilyRoom!",
         :date => Time.now
         )
  end
end
