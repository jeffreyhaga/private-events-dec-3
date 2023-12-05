class RsvpsController < ApplicationController
    before_action :require_login

  def create
    event = Event.find(params[:id])
    rsvp = Rsvp.new(event_id: event.id, current_user_id: params(:id))

    if rsvp.save
      rsvp.invited!
      flash[:notice] = "RSVP Sent!"
      redirect_to users_path(event_id: event.id)
    else
      flash[:alert] = "RSVP unsuccessful"
      redirect_to event_path(event)
    end
  end

  def destory
    event = Event.find(params[:event_id])
    rsvp = Rsvp.find(params[:id])
    if current_user == event.creator
      rsvp.destroy
      flash[:notice] = "The RSVP was cancelled"
    else
      rsvp.invited!
      flash[:notice] = "You have been dropped from the #{event.name}"
    end

    redirect_to users_path(event_id: event.id, id: rsvp.id)
  end

  def update
    @event = Event.find(params[:event_id])
    @rsvp = Rsvp.find_by(event_id: params[:event_id], user_id: current_user.id)
    if @rsvp && @rsvp.invited?
      @rsvp.accepted!
        flash[:notice] = "Thank you for signing up for #{@event.name}"
    else
      flash[:alert] = "Your name is not on the invite list."
    end
    redirect_to event_path(@event)
  end
end
