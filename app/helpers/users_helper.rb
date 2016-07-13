module UsersHelper
  #Returns Gravatar of user
  def gravatar_for(user, options = { size: 50 })
    g_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    g_url = "https://secure.gravatar.com/avatar/#{g_id}?s=#{size}"
    image_tag(g_url, alt: user.name, class: "gravatar")
  end
end