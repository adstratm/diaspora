class PeopleController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @people = current_user.friends.paginate :page => params[:page], :order => 'created_at DESC'
  end
  
  def show
    @person= Person.where(:id => params[:id]).first
  
    @person_profile = @person.profile
    @person_posts = Post.where(:person_id => @person.id).paginate :page => params[:page], :order => 'created_at DESC'
    @latest_status_message = StatusMessage.newest_for(@person)
    @post_count = @person_posts.count
  end
  
  def destroy
    current_user.unfriend(params[:id])
    flash[:notice] = "unfriended person."
    redirect_to people_url
  end
  
end
