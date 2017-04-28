class AddCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :party
      t.integer :age
      t.text :politics
      t.integer :votes, default: 0
      t.timestamps
    end      
#冒號的位置很重要，不是左就是右，中間一定錯
#時間戳記會記錄creat_at 建立時間 和 update_at 更新時間
#rails db:migrate 建立資料表，只會建一次，不會更新
    
  end
end
