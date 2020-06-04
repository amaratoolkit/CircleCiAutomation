Given("User enter URL") do
  @homePage = LaunchPage.new
  @homePage.start_server
  puts("Enter URL")
end

When("Verify title of the Page") do
  puts "Verify Title"

  @homePage.launch_app
  @homePage.get_title.eql? "The Internet"
  puts"Verified Successfully"

end

Then("Quit Session") do
  puts "Verify User Name"
  @homePage.kill_server
end
