class TokensController < ApplicationController
  def create
    user = User.where(email: params[:email]).limit(1).first
    if !user.nil? && user.authenticate(params[:password])
      render json: payload(user)
    else
      render json: { errors: ['Invalid Username/Password'] }, status: :unauthorized
    end
  end

  private
    def payload(user)
      return nil unless user and user.id
      {
        auth_token: JsonWebToken.encode({ user_id: user.id }),
        user: { id: user.id, email: user.email },
        success: true
      }
    end
end
