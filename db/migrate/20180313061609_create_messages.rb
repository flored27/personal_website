class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :body

      t.timestamps
    end
  end
end
