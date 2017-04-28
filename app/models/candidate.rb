class Candidate < ApplicationRecord
  validates :name, presence: true
  has_many :logs
#   用Candidate的id查誰投給他的紀錄
  
  def display_name
    "#{name}(#{party})"
  end
  
  def vote
#     increment(:votes) 投票數+1 votes欄位的值+1
    self.votes = self.votes + 1
#     左邊的self一定要加，右邊可以不用加，因為如果只有votes它會自動去抓區域變數
#     資料表votes欄位的值，在抓出來加一，但左邊就不可不加，因為它要把這個物件的值存起來
#     沒有的話就變成儲存區域變數，就無法正確運作
    save
  end
end
