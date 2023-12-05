class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @future_events = Event.future
    @past_events = Event.past
  end

end
