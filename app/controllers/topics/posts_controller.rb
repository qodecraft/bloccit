class Topics::PostsController < ApplicationController
  
  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
  

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id]) 
    @post.topic = @topic
    @comments = @post.comments
  end

  def new
    @post = Post.new
    @topic = Topic.find(params[:topic_id])
    authorize @post
  end

  
   def create
     @topic = Topic.find(params[:topic_id])
     puts "here is the topic id"
     puts @topic.inspect
     @post = @topic.posts.build(post_params)
     @post.user = current_user
     authorize @post
     if @post.save
       @post.create_vote
       flash[:notice] = "Post was saved."
       redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
   end


  def edit
     @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @post
  end

   def update
     @post = Post.find(params[:id])
     @topic = Topic.find(params[:topic_id])
     authorize @post
     if @post.update_attributes(post_params)
       flash[:notice] = "Post was updated."
       redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end
  
  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    title = @post.title
    
    authorize @post
    if @post.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
       redirect_to @topic
     else
       flash[:error] = "There was an error deleting the post."
       render :show
     end
   end

  
end
