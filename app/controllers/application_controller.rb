class ApplicationController < ActionController::API
    before_action :authenticate_user!
  
    private
  
    def authorize_admin!
      render json: { error: 'Not Authorized' }, status: :unauthorized unless current_user.admin?
    end
  end
  