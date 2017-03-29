module ApplicationHelper
  def hasUserLiked post, user_likes
    user_likes.include?(post)
  end
end
