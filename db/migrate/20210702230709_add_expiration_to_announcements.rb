class AddExpirationToAnnouncements < ActiveRecord::Migration[6.1]
  def change
    add_column :announcements, :expiration, :date
  end
end
