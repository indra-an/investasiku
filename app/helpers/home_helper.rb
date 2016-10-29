module HomeHelper
  def navbar_class_for_action
    controller.action_name.eql?('index') ? '' : 'scrolled'
  end
end
