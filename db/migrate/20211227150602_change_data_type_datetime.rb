class ChangeDataTypeDatetime < ActiveRecord::Migration[6.1]
  def change
    change_column :todos, :date, :date
  end
end
