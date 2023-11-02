class SessionsController < Devise::SessionsController
  before_action :authenticate_user!


  def destroy
     super
   end
end
