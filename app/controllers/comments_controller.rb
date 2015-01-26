class CommentsController < ApplicationController
  
#   def new
#     @comment = Comment.new
#   end
  
 
  def create
   
    @post = Post.find(params[:post_id])
   
    
    @comments = @post.comments
    
    @comment = current_user.comments.new(comment_params)
    
    @comment.post = @post
    
    @new_comment = Comment.new
     
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
    
     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to [@post.topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@post.topic, @post]
     end
   end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end




