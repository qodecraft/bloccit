class FavoriteMailer < ActionMailer::Base
  default from: "karan.kyanam@gmail.com"
  
  def new_comment(post, user, comment)
    
    headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
     headers["References"] = "<post/#{post.id}@your-app-name.example>"
    
    @user = user
    @post = post
    @comment = comment
    
    mail(to: user.email, subject: "New comment on #{post.tile}")
  end
end
