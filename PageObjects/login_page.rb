require 'selenium-webdriver'

class LoginPage
  # most likely there would be a base page that this page object would inherit form.  The base page would contain any items
  # that are present across all other pages on the website.
  FIRST_NAME_LOCATOR = {name: "firstname"}
  LAST_NAME_LOCATOR = {name: "lastname"}
  PASS_WD_LOCATOR = {name: "reg_passwd__"}
  EMAIL_LOCATOR = {name: "reg_email__"}
  SUBMIT_BUTTON_LOCATOR = {name: "websubmit"}

  attr_reader :driver

  def initialize(driver)
    @driver = driver
    visit
  end

  def visit
    driver.navigate.to("http://www.facebook.com/")
  end

  def click_submit
    driver.find_element(SUBMIT_BUTTON_LOCATOR).click
    # If this click was successful and the login worked, this method would normally return the page object of whichever
    # page comes next in the flow.
  end

  # I would normally write custom getter and setter to make getting field values and setting more reader friendly, but I
  # am still too unfamiliar with Ruby.

  def set_first_name(name)
    el = driver.find_element(FIRST_NAME_LOCATOR)

    el.clear
    el.send_keys(name)
  end

  # I would spend more time on determining the state of the field, I am sure this can be cleaned up a lot.
  def first_name_in_error_state
    !driver.find_element(FIRST_NAME_LOCATOR).attribute("aria-describedby").empty?
  end

  def first_name_in_ok_state
    driver.find_element(FIRST_NAME_LOCATOR).attribute("aria-describedby").nil?
  end

  def set_last_name(name)
    el = driver.find_element(LAST_NAME_LOCATOR)

    el.clear
    el.send_keys(name)
  end

  def last_name_in_error_state
    !driver.find_element(LAST_NAME_LOCATOR).attribute("aria-describedby").empty?
  end

  def last_name_in_ok_state
    driver.find_element(LAST_NAME_LOCATOR).attribute("aria-describedby").nil?
  end

  def set_passwd(passwd)
    el = driver.find_element(PASS_WD_LOCATOR)

    el.clear
    el.send_keys(passwd)
  end

  def passwd_in_error_state
    !driver.find_element(PASS_WD_LOCATOR).attribute("aria-describedby").empty?
  end

  def passwd_in_ok_state
    driver.find_element(PASS_WD_LOCATOR).attribute("aria-describedby").nil?
  end

  def set_email(email)
    el = driver.find_element(EMAIL_LOCATOR)

    el.clear
    el.send_keys(email)
  end

  def email_in_error_state
    !driver.find_element(EMAIL_LOCATOR).attribute("aria-describedby").empty?
  end

  def email_in_ok_state
    driver.find_element(EMAIL_LOCATOR).attribute("aria-describedby").nil?
  end
end