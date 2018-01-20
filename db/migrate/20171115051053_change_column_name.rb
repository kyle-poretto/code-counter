class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :build_sessions, :title, :name
  end
end
