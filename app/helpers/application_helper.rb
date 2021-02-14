module ApplicationHelper
  def gravatar(user, options= {size:80})
    email = user.email.downcase
    hash = Digest::MD5.hexdigest(email)
    size = options[:size]
    url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    #byebug
    image_tag(url,class:"rounded mx-auto d-block",alt: user.username)
  end

end
