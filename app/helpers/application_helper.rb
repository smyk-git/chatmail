module ApplicationHelper

  def avatar_for(user, size: 40, class_name: "")
    image_tag(
      user.gravatar_url(size),
      alt: user.email,
      class: class_name
    )
  end
end
