class Message < ActiveRecord::Base

  belongs_to :family, :class_name => "Family", :foreign_key => :family_id
  belongs_to :member, :class_name => "Member", :foreign_key => :member_id

end
