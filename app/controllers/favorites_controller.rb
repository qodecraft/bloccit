class FavoritesController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    authorize @favorite
    
    if favorite.save
      flash[:notice] = "Post has been favorited"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Please try again later"
      redirect_to [@post.topic, @post]
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @favorite = Favorite.find(params[:id])
    authorize @favorite
    
    if @favorite.destroy
      flash[:notice] = "You have unfavorited this post"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error try again later"
      redirect_to [@post.topic, @topic]
    end
  end
 
end
