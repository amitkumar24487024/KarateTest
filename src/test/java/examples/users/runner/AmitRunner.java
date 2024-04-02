package examples.users.runner;

import com.intuit.karate.junit5.Karate;

class AmitRunner {

  private static final String FEATURE_PATH = "classpath:examples/users/features/users.feature";

  @Karate.Test
  public Karate runUserTestScenarios() {
  
    return Karate.run(FEATURE_PATH).tags("@Smoke");
  
  }
  
}