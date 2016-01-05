class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    redirect_to root_url
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if current_user == nil
      redirect_to root_url, notice: 'You cannot show other user'
    end
    
    if current_user and current_user.id != @user.id
      redirect_to root_url, notice: 'You cannot show other user'
    end
  end

  # GET /users/new
  def new
    if current_user and session[:user_id]
      redirect_to root_url, notice: 'You cannot create new user'
    else
      @user = User.new
    end
  end

  # GET /users/1/edit
  def edit
    if current_user == nil
      redirect_to root_url, notice: 'You cannot edit this user'
    end

    if current_user and current_user.id != @user.id
      redirect_to root_url, notice: 'You cannot edit this user'
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, :notice => "Signed up!" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if current_user and current_user.id == @user.id
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_url, notice: 'You cannot update this user'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if current_user and current_user.id == @user.id
      @user.destroy
      redirect_to log_out_path
    else
      redirect_to root_url, notice: 'You cannot destroy this user'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :avatar)
    end
end
