class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users)
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    
    if @topic.save
      redirect_to topics_path, success: '登録に成功しました'
    else
      flash.now[:danger] = '登録に失敗しました'
      render :now
    end
  end
  
  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end
