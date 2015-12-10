class SessionsController < ApplicationController
  	def new
  		respond_to do |format|
  			format.html { render :new }
  		end
	end

	def create
	  user = User.authenticate(params[:email], params[:password])
	  	respond_to do |format|
		  if user
		    session[:user_id] = user.id
		    format.html { render root_path, notice: 'Logged in' } #redirect_to root_url, :notice => "Logged in!"
		  else
		    flash.now.alert = "Invalid email or password"
		    format.html { render :new }
		  end
		end
	end

	def destroy
	  session[:user_id] = nil
	  respond_to do |format|
	  	format.html { render root_path, notice: 'Logged out' } #redirect_to root_url, :notice => "Logged out!"
	  end
	end
end
