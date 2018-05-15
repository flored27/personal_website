class ChangeIntegerLimitInMessages < ActiveRecord::Migration[5.1]
  def change
     change_column :messages, :phone, :integer, limit: 8
   end
end
