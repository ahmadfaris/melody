# class SessionsController < ApplicationController
#   def create
#     auth = request.env["omniauth.auth"]
#     session[:omniauth] = auth.expect('extra')
#     user = User.sign_in_from_omniauth(auth)
#     session[:user_id] = user.id
#     redirect_to root_url, notice: "Sign in!"
#   end

#   def destroy
#     session[:user_id] = nil
#     session[:omniauth] = nil
#     redirect_to root_url, notice: "Sign out!"
#   end
# end
