class RemovingColumnToTableExpire < ActiveRecord::Migration[6.1]
  def change
    remove_column :announcements, :expire
  end
end
