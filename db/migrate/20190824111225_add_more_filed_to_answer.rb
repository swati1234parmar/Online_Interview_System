class AddMoreFiledToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :duration, :integer, :default => 0
  end
end
