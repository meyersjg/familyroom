class AddFamilyIdToMember < ActiveRecord::Migration
  def change
    add_column :members, :family_id, :integer
  end
end
