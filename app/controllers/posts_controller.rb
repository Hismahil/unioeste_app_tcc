class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    if params[:category]
      @categorizations = Categorization.where(' category_id = ? ', params[:category])
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    if @post == nil
      redirect_to root_url, notice: 'Post not found!'
    end

    @is_owner = if current_user and current_user.id == @post.user.id then
      true
    else
      false
    end
  end

  # GET /posts/new
  def new
    if current_user
      @post = Post.new
    else
      redirect_to root_url, notice: 'You cannot create post without be user'
    end
  end

  # GET /posts/1/edit
  def edit
    if current_user == nil
      redirect_to root_url, notice: 'You cannot edit this post'
    end

    if current_user and current_user.id != @post.user.id
      redirect_to root_url, notice: 'You cannot edit this post'
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.categories << Category.find(params[:post][:category_id])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if current_user and current_user.id == @post.user.id
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_url, notice: 'You cannot update this post'
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if current_user and current_user.id == @post.user.id
      @post.destroy
      redirect_to root_url, notice: 'Post destroyed'
    else
      redirect_to root_url, notice: 'You cannot destroy this post'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      begin
        @post = Post.find(params[:id])
      rescue
        logger.info('Post não encontrado')
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :text)
    end
end
