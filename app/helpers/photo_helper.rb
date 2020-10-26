module PhotoHelper
  def worker_photo(user, opts = {})
    if user.photo.attached?
      cl_image_tag user.photo.key, opts
    else
      image_tag 'worker_placeholder', opts
    end
  end

  def site_photo(site, opts = {})
    if site.photo.attached?
      cl_image_tag site.photo.key, opts
    else
      image_tag "#{['site_placeholder1', 'site_placeholder2'].sample}", opts
    end
  end

  def user_photo(user, opts = {})
    if user.photo.attached?
      cl_image_tag user.photo.key, opts
    else
      image_tag 'user_placeholder', opts
    end
  end
end