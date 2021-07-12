class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
