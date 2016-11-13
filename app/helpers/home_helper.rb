module HomeHelper
  def navbar_class_for_action
    controller.action_name.eql?('index') ? '' : 'scrolled'
  end

  def full_image_url_for(url)
    return nil if url.blank?
    URI::join(root_url, url).to_s
  end

  def generate_keywords_from(content)
    result = ['investasiku', 'investasi', 'belajar']
    counter = WordsCounted.count(content).token_frequency
    counter.each do |word|
      break if result.count.eql?(20)
      result << word[0]
    end
    result
  end
end
