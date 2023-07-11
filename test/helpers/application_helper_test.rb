require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "check action_to_css_class_color" do
    action = {
      new: 'success',
      create: 'success',
      edit: 'success',
      update: 'success',
      show: 'primary',
      index: 'primary',
      destroy: 'danger',
      other: 'default'
    }

    action.each do |action, color|
      assert action_to_css_class_color(action), color
    end
  end

  test 'check datetime_humanized' do
    date = DateTime.new(2013, 1, 1, 14, 15)

    assert datetime_humanized(date), ' 1 January 2013, 14:15'
  end
end
