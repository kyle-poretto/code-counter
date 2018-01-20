class AddColumnsTimeblockColumns < ActiveRecord::Migration[5.1]
  def change
    add_column(:build_sessions, :expected_pomo_periods, :integer)
    add_column(:build_sessions, :actual_pomo_periods, :integer)
  end
end
