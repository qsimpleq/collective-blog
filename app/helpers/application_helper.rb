module ApplicationHelper
  def action_method_to_css_class_color(name = action_name)
    if %w[new update].include?(name)
      'success'
    elsif %w[show edit index].include?(name)
      'primary'
    elsif name == 'destroy'
      'warning'
    else
      'default'
    end
  end
end
