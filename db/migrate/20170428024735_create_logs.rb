class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.integer :candidate_id
      t.string :ip_address

      t.timestamps
    end
  end
end
