class AddColumnPermissionToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :permission, :string, default: "private"
  end
end
