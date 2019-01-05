class AddRecordedOnToMemos < ActiveRecord::Migration[5.0]
  def change
    add_column :memos, :recorded_on, :date
  end
end
