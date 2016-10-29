module ApplicationHelper
  def class_for_content_indicator(_controller, _action_1 = nil, _action_2 = nil)
    controller.controller_name.eql?(_controller.to_s) &&
      (_action_1.nil? || controller.action_name.eql?(_action_1.to_s) ||
        controller.action_name.eql?(_action_2.to_s)) ? 'active' : ''
  end
end
