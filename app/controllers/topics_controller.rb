class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # GET /topics
  # GET /topics.json
  def index
    # @topics = Topic.all
    @topics = Topic.order("updated_at DESC")
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @comment = @topic.comments.build
    @comments = @topic.comments
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
    unless @topic.user.id == current_user.id
      respond_to do |format|
        format.html { redirect_to topics_path, notice: '編集できません' }
        format.json { render :show, status: :created, location: @topic }
      end
    end
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'トピックを作成しました' }
        format.json { render :show, status: :created, location: @topic }
        NoticeMailer.sendmail_topic(@topic).deliver
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'トピックを更新しました' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy

    if @topic.user.id == current_user.id
      @topic.destroy
      respond_to do |format|
        format.html { redirect_to topics_url, notice: 'トピックを削除しました' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to topics_url, notice: '更新できませんでした'}
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_topic
    @topic = Topic.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def topic_params
    params.require(:topic).permit(:title, :content)
  end
end
