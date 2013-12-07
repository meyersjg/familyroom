class Member < ActiveRecord::Base

  has_secure_password

  belongs_to :family, :class_name => "Family", :foreign_key => :family_id
  has_many :messages, :class_name => "Message", :foreign_key => :member_id

end
