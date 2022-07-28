package definitions;

import cucumber.api.java.en.Given;

import static support.TestContext.getDriver;

public class AnnaVStepDefs {
    @Given("I navigate {string}")
    public void iNavigate(String arg0) {
        getDriver().get("http://ask-internship.portnov.com/#/login");
    }
}
