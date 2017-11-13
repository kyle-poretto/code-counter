class BuildSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :build_sessions do |t|
      t.string :title
      t.string :description
      t.string :reward
      t.integer :minutes
      t.integer :productivity_score
      t.string :user_ids
      t.timestamps null: false
  end
end
end
