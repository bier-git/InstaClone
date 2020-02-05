class ChangeColumnUserId < ActiveRecord::Migration[6.0]

  def change

      rename_column :posts, :users_id, :user_id
   
  end
end
