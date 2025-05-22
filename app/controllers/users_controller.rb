class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :show ]
  def show
    @user = User.find(params[:id])
    @created_events = @user.created_events
  end
end
