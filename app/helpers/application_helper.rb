module ApplicationHelper
  def current_layout
    controller.send :_layout, lookup_context, []
  end
end
