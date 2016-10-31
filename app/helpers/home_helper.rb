module HomeHelper
  def navbar_class_for_action
    controller.action_name.eql?('index') ? '' : 'scrolled'
  end

  def full_image_url_for(url)
    return nil if url.blank?
    URI::join(root_url, url).to_s
  end
end
