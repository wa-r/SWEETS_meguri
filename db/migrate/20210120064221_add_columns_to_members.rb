class AddColumnsToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :introduction, :text
    add_column :members, :profile_image_id, :string
    add_column :members, :is_deleted, :boolean, default: false
  end
end