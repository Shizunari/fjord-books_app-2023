# frozen_string_literal: true

module UsersHelper
  def current_user_name(user)
    [user.name, user.email].find(&:present?)
  end

  def user_avatar_tag(user)
    return image_tag('no-image.png', alt: '') unless user.avatar.attached?

    image_tag user.avatar.variant(resize_to_fill: [160, 160]), alt: ''
  end
end
