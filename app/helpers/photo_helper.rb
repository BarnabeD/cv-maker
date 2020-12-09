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
      photos = [
        '1_gyem7f',
        '2_dbwigs',
        '3_zcbybi',
        '4_qjc2zz',
        '5_gz49ox',
        '6_snres6',
        '7_mxskl1',
        '8_ezey6w',
        '9_kooe2e',
        '10_myju6u',
        '11_pza5vu',
        '12_vs6qng',
        '13_cmavqn',
        '14_mygzgs',
        '15_pzxhzx',
        '16_admeh0',
        '17_qkum0z',
        '18_k69k3s',
        '19_z7fg0o',
        '20_ueef5u',
        '21_hfje9y',
        '22_jzmm6k',
        '23_ooldzf',
        '24_ml0nau',
        '25_r0jjfh',
        '26_dqzuhh'
      ]

      cl_image_tag("CV-maker/#{photos.sample}.jpg", opts)
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

