class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.text :message, null: false

      t.timestamps
    end
  end
end
