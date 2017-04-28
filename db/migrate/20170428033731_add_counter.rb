class AddCounter < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :logs_count, :integer, default:0
  end
end
