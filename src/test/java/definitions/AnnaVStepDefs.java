package definitions;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class AnnaVStepDefs {
    @Given("I navigate {string}")
    public void iNavigate(String sURL) {
        getDriver().get(sURL);
    }

    @When("I click {string} menu item AV")
    public void iClickMenuItemAV(String sMenuItem) {
        //h5[contains(text(),'Quizzes')]
        getDriver().findElement(By.xpath("//h5[contains(text(),sMenuItem)]")).click();
    }

    @Then("I click on the button {string} AV")
    public void iClickOnTheButtonAV(String sButton) {
        getDriver().findElement(By.xpath("//span[contains(text(),'"+sButton+"')]")).click();
    }

    @Then("I type {string} as quiz title AV")
    public void iTypeAsQuizTitleAV(String sQuizTitle) {
        //input[@placeholder='Title Of The Quiz *']
        getDriver().findElement(By.xpath("//input[@placeholder='Title Of The Quiz *']")).sendKeys(sQuizTitle);
    }

    @Then("I add a question AV")
    public void iAddAQuestionAV() {
        getDriver().findElement(By.xpath("//mat-icon[contains(text(),'add_circle')]")).click();
    }

    @When("I type {string} into firstName field AV")
    public void iTypeIntoFirstNameFieldAV(String sFirstName) {
        getDriver().findElement(By.xpath("//input[@placeholder='First Name']")).sendKeys(sFirstName);
    }

    @When("I type {string} into lastName field AV")
    public void iTypeIntoLastNameFieldAV(String sLastName) {
        getDriver().findElement(By.xpath("//input[@placeholder='Last Name']")).sendKeys(sLastName);
    }


    @When("I type {string} into eMail field AV")
    public void iTypeIntoEMailFieldAV(String sEmail) {
        getDriver().findElement(By.xpath("//input[@placeholder='Email']")).sendKeys(sEmail);
    }

    @Then("I type {string} into Group Code field AV")
    public void iTypeIntoGroupCodeFieldAV(String sGroupCode) {

        getDriver().findElement(By.xpath("//input[@placeholder='Group Code']")).sendKeys(sGroupCode);
    }

    @Then("I type {string} into Password field AV")
    public void iTypeIntoPasswordFieldAV(String sPassword) {
        getDriver().findElement(By.xpath("//input[@placeholder='Password']")).sendKeys(sPassword);
    }

    @Then("I type {string} into Confirm Password field AV")
    public void iTypeIntoConfirmPasswordFieldAV(String sConfirmPassword) {
        //input[@placeholder='Confirm Password']
        getDriver().findElement(By.xpath("//input[@placeholder='Confirm Password']")).sendKeys(sConfirmPassword);
    }


    @When("I click {string} button AV")
    public void iClickButtonAV(String sButton) {
        getDriver().findElement(By.xpath("//span[contains(text(),'Register Me')]")).click();
    }

    @Then("I confirm that {string} is displayed AV")
    public void iConfirmThatIsDisplayedAV(String sErrorMessage) {
        String sActualErrorMessage = getDriver().findElement(By.xpath("//mat-error[contains(text(),'Should be a valid email address')]")).getText();
        assertThat(sActualErrorMessage.equals(sErrorMessage)).isTrue();
    }
}

