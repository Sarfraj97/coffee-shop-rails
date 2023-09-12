class AddRemindableFieldToReminder < ActiveRecord::Migration[7.0]
  def change
    add_column :reminders, :remindable_id, :integer
    add_column :reminders, :remindable_type, :string
  end
end
