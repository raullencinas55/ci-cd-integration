Feature: Demo test

  Background:
  Given main page is open

  @ui
  @allure.label.epic:Buttons
  @allure.label.feature:Remove
  @allure.label.story:Valid_remove_button
  Scenario: Remove button
    When user clicks link 'Add/Remove Elements'
      And user click Add button
    Then remove button is displayed

  @ui
  @allure.label.epic:Login
  @allure.label.feature:Authentication
  @allure.label.story:Valid_user_login
  Scenario Outline: Login page
    When user clicks link 'Form Authentication'
      And user inputs login "<login>"
      And user inputs password "<password>"
      And user click Login button
    Then message about <status> login is displayed
    Examples:
      | login        | password             | status        |
      | tomsmith     | SuperSecretPassword! | successful    |
      | tomsmith     | wrongpass            | unsuccessful  |
      | unknown      | anypass              | successful    |

  @ui
  @allure.label.epic:Login
  @allure.label.feature:Authentication
  @allure.label.story:Valid_user_login
  Scenario: Login page negative check
    When user clicks link 'Form Authentication'
      And user inputs credentials
      | login     | password            |
      | tom smith | SuperSecretPassword!|
    And user click Login button
    Then message about unsuccessful login is displayed