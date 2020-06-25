Given("Login as admin") do
  @dockerPage = DockerPage.new
  @dockerPage.loginAsUser
end

When("Navigate to pages") do
@dockerPage.navigateToPages
end

Then("Sign on the webpage") do
@dockerPage.signOnWeb
end
