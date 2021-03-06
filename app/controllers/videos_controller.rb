class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy, :redeem]
  before_action :authenticate_user!, except: [:index, :show]
  protect_from_forgery except: :show


  # GET /videos
  # GET /videos.json
  def index
    if I18n.locale.to_s == "en"
      @videos = Video.video_by_type("Youtube")
    elsif I18n.locale.to_s == "zh-CN"
      @videos = Video.video_by_type("Youku")
    end
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    # render file: 'videos/show.js.erb'
    @video = Video.find(params[:id])
    respond_to do |format|
      format.html
      format.js {}
    end
  end

  def redeem
    # a flash message hash associated with redeem
    flash[:redeem] = {}
    if (current_user.has_reward?)
      # add video to user
      current_user.videos << @video unless current_user.videos.include?(@video)
      # remove points
      current_user.subtract_reward(1)
      @msg = t('.redeem_success', title: @video.title.upcase, default: "video " + @video.title.upcase + " is now available.")
      flash[:redeem][:success] = @msg
      flash.discard
      respond_to do |format|
        format.html { redirect_to videos_path }
        format.js {}
      end
    else
      @msg = t('.redeem_failure', default: "Not enough fund to redeem any videos!")
      flash[:redeem][:warning] = @msg
      flash.discard
      respond_to do |format|
        format.html { redirect_to videos_path }
        format.js {}
      end
    end
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:title, :summary, :summary_md)
    end
end
