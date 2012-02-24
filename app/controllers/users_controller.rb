class UsersController < ApplicationController
	
	# Skip the require_user filter set up in the application controller
	# as it allows access to index and show. Then reapply to protect everything
	skip_filter :require_user
	before_filter :require_user
	
  def index
    @users = User.find(:all, :order => 'admin_level DESC, name ASC', :conditions =>"id > 1")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @Users }
    end
  end


  def new
		@user = User.new  
	end

	def create  
   @user = User.new(params[:user])  
   respond_to do |format|
     if @user.save  
       format.html { redirect_to(users_path, :notice => 'User Created.') }
       format.xml  { render :xml => @user, :status => :created, :location => @user }
     else  
       render :action => 'new'  
     end  
    end
  end  
 
  def edit
   @user = User.find(params[:id])  
  end

  # PUT /sponsors/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(users_url, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @User.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

end
