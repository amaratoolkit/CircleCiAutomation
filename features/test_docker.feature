@docker
Feature: As an user I want to see Welcome message

Scenario: Verify error messages of username input and password input
Given Enter given url and click on signin link
When Enter incorrect username and incorrect password
Then Verify error messages
