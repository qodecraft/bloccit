This is a clone of reddit!
This is the link to the app on heroku [blocreddit](https://blocreddit.herokuapp.com/)

<blockquote>
  <p><%= comment.body %></p>
  <footer><%= image_tag(User.find(comment.user_id).avatar.tiny.url) %>  <%= User.find(comment.user_id).name %>, posted <%= time_ago_in_words(comment.created_at) %> ago.
    <% if policy(comment).destroy? %>
      <%= link_to "Delete", comment_url_helper(comment), method: :delete, remote: true %>
    <% end %> 
  </footer>
</blockquote>
<% end %>

.
<%= render partial: '/comments/comment', collection: @comments %>