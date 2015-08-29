module Hzadmin
class SessionsController < BaseController
  layout 'auth'
  skip_before_filter :authenticate!

   def index
    
   end

   def create
    @response = Auth.new(params[:email], params[:password]).authenticate
    if @response.has_key?('auth_token')
      session[:admin_token] = @response['auth_token']
      session[:admin_email] = @response['user_email']
      redirect_to builders_path
    else
      flash[:error] = 'Authentication Failed'
      render 'index'
    end
   end
end
end