require 'rails_helper'

  describe Comment do
    
    include TestFactories
    
    describe '#after_create' do
      
      before do
        @post = associate_post
        @user = authenticated_user
        @comment = Comment.new(body: "My comment", post: @post, user_id: 10000)
      end
      
      context "with user's permission" do
      
      it "Sends an email to users who have favorited a post" do
        @user.favorites.where(post: @post).create
        
        allow( FavoriteMailer)
        .to receive(:new_comment)
        .with(@post, @user, @comment)
        .and_return( double(deliver: true) )
        @comment.save
      end
      
      it "Does not send mails to users who have not favorited" do
        expect( FavoriteMailer )
        .not_to receive(:new_comment)
     
     
      @comment.save
      end   
    end

     context "without permission" do
 
       before { @user.update_attribute(:email_favorites, false) }
 
       it "does not send emails, even to users who have favorited" do
         @user.favorites.where(post: @post).create
 
         expect( FavoriteMailer )
           .not_to receive(:new_comment)
         
         @comment.save
       end
     end

   end
 end