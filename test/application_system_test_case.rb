require "test_helper"
# require "capybara/poltergeist"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1000, 1000]
  # driven_by :poltergeist
end
