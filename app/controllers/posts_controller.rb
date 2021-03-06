class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  ### changed on 0722 ### 
  def index
    #redirect_to topics_url
    
    # 0730 when redirect to blow path, success to redirect to original posts
    # how transfer the topic's :id such as via session ? 
    # also comment out since the routing solved in create method
    #@topic = Topic.find(params[:topic_id])
    #id = @topic
    #redirect_to topic_path(1)
  end

#### 0722 back up ###
#  def index
#    @posts = Post.all    
#  end



  # GET /posts/1
  # GET /posts/1.json
  def show
  
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
    max_num = @topic.posts.maximum(:post_number)
    max_num = 0 if max_num.blank?
    @post.post_number = max_num + 1

  	respond_to do |format|
		  if @post.save
			 #format.html { redirect_to [@topic, @post], notice: 'Post was successfully created.' }
       format.html { redirect_to topic_path(@topic), notice: 'Post was successfully created.' }
			 format.json { render json: @post, status: :created, location: [@post, @post] }
		  else
    		format.html { render action: "new" }
  			format.json { render json: @post.errors, status: :unprocessable_entity }
    	end
  	end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:contributor, :content, :post_number)
    end
end
