class AddColumnShowRangeToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :show_range, :string, default: "private"
  end
end
