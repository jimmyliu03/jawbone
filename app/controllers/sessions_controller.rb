class SessionsController < ApplicationController
	skip_before_action :verify_authenticity_token

  def new

  	auth_hash = request.env['omniauth.auth']
  	 current_user = User.first
  	 

  	 #@client = Jawbone::Client.new @current_user.token
  	 token = current_user.token
  	 @auth = "Bearer " + token

	@result = HTTParty.get('http://jawbone.com/nudge/api/v.1.1/users/@me/goals',
                           :headers => { "Authorization" => @auth, "Accept" => "application/json"}
                          )
  	 @result2 = HTTParty.get('http://jawbone.com/nudge/api/v.1.1/users/@me/moves',
                           :headers => { "Authorization" => @auth, "Accept" => "application/json"}
                          )

  end

  def create

  	  	auth_hash = request.env['omniauth.auth']

  	  	@authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
  	  	@token = auth_hash["credentials"]["token"]
	  if @authorization
	  	@current_user = User.first
    @inspections = @current_user.authorizations.inspect
    #render :text => "Welcome back #{@authorization.user.name}! You have already signed up. #{@token}"
    redirect_to '/login'
    @current_user.token = @token


  		else
    #user = User.new :name => auth_hash["user_info"]["uid"], :email => auth_hash["user_info"]["uid"]
    user = User.new :name=>"Jimmy", :email => "Jimmy@email.com", :token => auth_hash["credentials"]["token"]
    user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    user.save
 	redirect_to '/login'
    #render :text => "Hi #{user.name}! You've signed up."


  end



  end

  def failure
  end

  def destroy
  	
  		User.first.destroy unless User.first.nil?
  Authorization.first.destroy unless Authorization.first.nil?
  render :text => "You've logged out!"
end
end