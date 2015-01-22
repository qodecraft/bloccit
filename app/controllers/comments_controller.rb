class CommentsController < ApplicationController
  
  def show
    @comment = Comment.new
  end
  
 
   def create
     @comment = current_user.comments.build(params.require(:comment).permit(:body))
     @post = Post.find(params[:post_id])
     @comment.post = @post
     @topic = @post.topic
     authorize @comment
     if @comment.save
       flash[:notice] = "Post was saved."
       redirect_to [@post.topic, @post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       redirect_to [@post.topic, @post]
     end
   end
  
  def destroy
     @topic = Topic.find(params[:topic_id])
     @post = @topic.posts.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to [@topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@topic, @post]
     end
   end
end




