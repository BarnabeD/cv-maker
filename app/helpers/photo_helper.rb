module PhotoHelper
  def worker_photo(user, opts = {})
    if user.photo.attached?
      cl_image_tag user.photo.key, opts
    else
      image_tag 'worker_placeholder.png', opts
    end
  end

  def site_photo(site, opts = {})
    if site.photo.attached?
      cl_image_tag site.photo.key, opts
    else
      # image_tag "#{['site_placeholder1.jpg', 'site_placeholder2.jpg'].sample}", opts
      # image_tag 'https://source.unsplash.com/collection/1066077', opts
      image_tag "fake/#{(1..26).to_a.sample}.jpg", opts
    end
  end

  def user_photo(user, opts = {})
    if user.photo.attached?
      cl_image_tag user.photo.key, opts
    else
      image_tag 'user_placeholder.jpg', opts
    end
  end
end

