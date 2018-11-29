require 'selenium-webdriver'
require 'test/unit'
require_relative '../PageObjects/login_page'

class FaceBookTestBase < Test::Unit::TestCase

  attr_accessor :driver
  attr_accessor :login_page

  def setup
    @driver = Selenium::WebDriver.for :chrome
    @login_page = LoginPage.new(@driver)
  end

  def teardown
    # if the test status is anything but "passed", a screen shot will be taken before the browser is closed.
    unless passed?
      @driver.save_screenshot("TestScreenshot #{self.name.to_s}.png")
      # I would store the screenshots in a better place, or convert to a base64 string and move to a whatever
      # system is being used as a test result reporting.  This is where I would report the test status as well.
    end

    @driver.quit
  end

end