class Family < ActiveRecord::Base

  has_many :members, :class_name => "Member", :foreign_key => :family_id
  has_many :messages, :class_name => "Message", :foreign_key => :family_id

end
