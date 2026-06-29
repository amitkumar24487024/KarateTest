# KarateTest

**KarateTest** is a Java project that demonstrates REST API testing using the [Karate](https://github.com/karatelabs/karate) framework, built with Maven and run via JUnit 5.

---

## Table of Contents

- [Overview](#overview)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Running the Tests](#running-the-tests)
- [Test Features](#test-features)
- [Configuration](#configuration)
- [Logging](#logging)

---

## Overview

This project shows how to write and run API tests using Karate DSL. It targets the public demo API at [jsonplaceholder.typicode.com](https://jsonplaceholder.typicode.com) and includes examples of:

- Calling a REST endpoint and asserting the HTTP status
- Reading and printing JSON test data from an external file
- Using a `Scenario Outline` with an inline data table
- Filtering test execution by tag (`@Smoke`)

---

## Tech Stack

| Tool | Version |
|---|---|
| Java | 11 |
| Maven | 3.x |
| Karate (karate-junit5) | 1.4.1 |
| JUnit | 5 (via Karate) |

---

## Project Structure

```
KarateTest/
├── pom.xml                              # Maven build configuration
└── src/
    └── test/
        └── java/
            ├── karate-config.js         # Global Karate configuration (env-aware)
            ├── logback-test.xml         # Logging configuration
            └── examples/
                └── users/
                    ├── features/
                    │   └── users.feature        # Karate test scenarios
                    ├── jsonsDatas/
                    │   └── data.json            # External JSON test data
                    ├── runner/
                    │   └── AmitRunner.java      # JUnit 5 test runner
                    └── utils/
                        └── APIClass.java        # Example Java utility class
```

### Key files explained

| File | Purpose |
|---|---|
| `users.feature` | Main Karate feature file containing three scenarios: reading local JSON data, calling the `/users` REST endpoint, and a data-driven `Scenario Outline`. |
| `data.json` | Sample student JSON object used as test data in the first scenario. |
| `AmitRunner.java` | JUnit 5 entry point that runs all `@Smoke`-tagged scenarios from `users.feature`. |
| `APIClass.java` | Simple Java utility class with an `add` method, demonstrating how Java helpers can be packaged alongside tests. |
| `karate-config.js` | Executed before every test; sets the environment (`dev` by default) and global variables available to all feature files. |
| `logback-test.xml` | Configures Logback to write Karate debug output both to the console and to `target/karate.log`. |

---

## Prerequisites

- **Java 11+**
  ```sh
  sudo apt update && sudo apt install openjdk-11-jdk   # Debian/Ubuntu
  ```
- **Maven 3.x**
  ```sh
  sudo apt install maven
  ```

---

## Getting Started

1. Clone the repository:
   ```sh
   git clone https://github.com/amitkumar24487024/KarateTest.git
   cd KarateTest
   ```

2. Install dependencies (Maven downloads them automatically):
   ```sh
   mvn dependency:resolve
   ```

---

## Running the Tests

Run all tests (the `AmitRunner` executes `@Smoke`-tagged scenarios):
```sh
mvn test
```

After the run, Karate generates an HTML report inside:
```
target/karate-reports/karate-summary.html
```

A full debug log is also written to `target/karate.log`.

---

## Test Features

### `users.feature`

| Scenario | Tag | What it does |
|---|---|---|
| `get json data` | _(none)_ | Reads `data.json` from the classpath and prints its content. |
| `get rest api` | `@Smoke` | Calls `GET /users` on `jsonplaceholder.typicode.com` and asserts HTTP 200. |
| `print data` (Outline) | `@Smoke` | Iterates over two rows of inline user data (name, username, email, phone) and prints each field. |

---

## Configuration

`karate-config.js` is auto-loaded by Karate before each feature. You can pass the environment at runtime:

```sh
mvn test -Dkarate.env=e2e
```

The config currently defines:
- `env` — defaults to `dev`
- `myVarName` — a sample global variable (`someValue`)

Extend the `if/else` blocks inside `karate-config.js` to add environment-specific base URLs or credentials.

---

## Logging

Logging is handled by Logback (`logback-test.xml`):

- **Console** — `INFO` level for all loggers; `DEBUG` level for `com.intuit` (Karate internals).
- **File** — same output written to `target/karate.log` for post-run analysis.

