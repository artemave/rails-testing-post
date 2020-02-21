require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  def self.js?
    ENV['JS'] || ENV['GUI']
  end

  if js?
    if ENV['GUI']
      driven_by :selenium, using: :chrome, options: { args: %w[auto-open-devtools-for-tabs start-maximized] }
    else
      driven_by :selenium, using: :headless_chrome
    end
  else
    driven_by :rack_test
  end

  def js?
    self.class.js?
  end

  def confirm
    self.class.js? ? accept_confirm { yield } : yield
  end
end
