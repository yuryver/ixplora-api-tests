Feature: Smoke
  @precondition
  Scenario: APrecondition
    Given I register a new "user"
    And I validate email
    And I login and get token
    And I create a survey

  @Smoke
  Scenario Outline: Smoke
    Given I perform "GET" request to "<End Point>"
    And I set the header "Authorization" with "Bearer {login_response.token}"
    When I send the request
    Then I expect a "200" status code
    Examples:
      | End Point                                        |
      | /health                                          |
      | /surveys                                         |
      | /surveys/{survey_response._id}                   |
      | /surveys/{survey_response._id}/edit              |
      | /surveys/{survey_response._id}/overview          |
      | /surveys/{survey_response._id}/results?type=json |
      | /surveys/{survey_response._id}/results?type=csv  |
      | /users/{user_response._id}                       |
