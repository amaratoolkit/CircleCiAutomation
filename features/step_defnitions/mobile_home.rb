Given("enter app details") do
  @mobile_login = MobileLogin.new
  @mobile_login.start_server
end

When("login to app") do
  @mobile_login.login
end

Then("quit mobile session") do
  @mobile_login.kill_server
end
