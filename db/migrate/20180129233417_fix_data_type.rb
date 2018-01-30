class FixDataType < ActiveRecord::Migration[5.1]
  def change
    rename_column :build_sessions, :user_ids, :user_id
  end
end
