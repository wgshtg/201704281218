class CandidatesController < ApplicationController
  before_action :find_candidate, only: [:show, :edit, :update, :destroy, :vote]
#   before_action :find_candidate, exception: [:index, :new, :create]
#   除了index,new,create都要再做動作之前先做find_candidate
  def index
    @candidates = Candidate.all
  end
  
  def show
#     @candidate = Candidate.find_by(id: params[:id])
#     before_action 做動作之前要做的是，find_candidate,後面放only表示只有這些動作要
    #params 是model封裝好的方法，find_by 去資料庫找到資料 
    #@candidate "@" 是為了要顯示在view上面，不然其實一般不用candidate 用在method 裡面
  end
  
  def new
    @candidate = Candidate.new
  end
  
  def vote
    log = Log.new(candidate: @candidate, ip_address:request.remote_ip)
    @candidate.logs << log
    @candidate.save
    redirect_to candidates_path, notice: "done!"
  end
  
#   def vote
#     @candidate.vote
#     redirect_to candidates_path, notice: "done!"
#   end
  
  def create
      @candidate = Candidate.new(candidate_params)
      if @candidate.save
        redirect_to candidates_path, notice: "create success"
      else
        render 'new'
        #or render :new
        #借new的畫面顯示
        #redirect_to new_candidate_path
      end
    end
  
  def edit
#     find_candidate 
  end
  
  def update
#     find_candidate
    
    if @candidate.update(candidate_params)
      redirect_to candidates_path, notice: "updated"
    else
      render 'edit'
    end
  end
    
  def destroy
#       find_candidate
      @candidate.destroy
#       flash[:notice] = "deleted!" 在rails 4 之後，可以把這列改寫成下面
#       flash 是出現一次之後就會消失，可以當作提示通知訊息
      redirect_to candidates_path, notice: "deleted!"
  end
    
  private
     def candidate_params
       params.require("candidate").permit(:name, :party, :age, :politics)
     end
#    清洗資料，把傳送的資料，篩選哪些欄位可以傳進來
  end

  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
    redirect_to candidates_path, notice: "no data!" if @candidate.nil?
  end
#  DRY Don't repeat yourself 重複的程式碼包成一個方法，找候選人、是否存在