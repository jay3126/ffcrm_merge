Given /^two duplicate contacts$/ do
  @dup_contact = Factory(:contact, :first_name => "Test User",
                                   :last_name  => "One",
                                   :phone      => "1111-1111",
                                   :mobile     => "(111)1111111111",
                                   :email      => "testuserone@example.com",
                                   :alt_email  => "testuserone@test.com")
  @contact     = Factory(:contact, :first_name => "Test User",
                                   :last_name  => "Two",
                                   :phone      => "2222-2222",
                                   :mobile     => "(222)2222222222",
                                   :email      => "testusertwo@example.com",
                                   :alt_email  => "testusertwo@test.com")
end

When /^I click the first autocomplete dropdown option$/ do
  begin
    Capybara.current_session.driver.browser.
       execute_script("$$('#auto_complete_dropdown ul li').first().simulate('click');")
  rescue Capybara::NotSupportedByDriverError
  end
end

When /^I force the confirm dialog to return true$/ do
  begin
    Capybara.current_session.driver.browser.
       execute_script("window.confirm = function() { return true; }")
  rescue Capybara::NotSupportedByDriverError
  end
end

Then /^I should pause$/ do
  sleep 1000
end

