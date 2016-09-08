module ApplicationHelper
  def profile_img(user)
    return image_tag(user.avatar, alt: user.name, size: '48x48') if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url, alt: user.name, size: '48x48')
  end
end
