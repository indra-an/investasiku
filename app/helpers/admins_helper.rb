module AdminsHelper
  def breadcrumb(&block)
    content_tag :ol, { :class => "breadcrumb", :itemprop => "breadcrumb" } do
      yield if block
    end
  end

  def breadcrumb_item(name = nil, url = nil, html_options = {}, &block)
    if name.nil? && url.nil? && html_options.empty? && block.nil?
      content_tag :li do
        link_to admins_dashboard_path do
          raw '<span class="glyphicon glyphicon-home"></span>'
        end
      end
    else
      html_options[:class] = "#{html_options[:class]} active" unless url
      content_tag :li, html_options do
        if block
          block.call name, url
        else
          url ? link_to(name, url) : name
        end
      end
    end
  end

  def class_for_sidebar(menu)
    route = case menu
    when :admins; admins_admins_path
    else admins_dashboard_path
    end

    current_page?(route) ? 'active' : ''
  end
end
