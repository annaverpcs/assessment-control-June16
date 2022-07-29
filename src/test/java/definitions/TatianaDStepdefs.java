package definitions;

import cucumber.api.java.en.Given;

import static support.TestContext.getDriver;

public class TatianaDStepdefs {
    @Given("I go to {string}")
    public void iGoTo(String arg0) {
        getDriver().get("http://ask-internship.portnov.com/#/login");
    }
}
