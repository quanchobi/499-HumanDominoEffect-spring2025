# Unit testing

[Back to index](index.md)

This project utilizes GdUnit for testing. This is a flexible plugin for testing nodes and scenes.

## Setting up plugin

-   GdUnit is pre-installed in this repository
    -   No additional installation required
-   In the editor
    -   Go to `project` -> `project settings` -> `Plugins`
    -   Enable GdUnit
-   (Optional): If using Visual studio code as external editor
    -   Install recommended extensions. [`Godot GdUnit Test Explorer`](https://marketplace.visualstudio.com/items?itemName=mikeschulze.gdunit3) should be included.

## Creating new tests

When creating new tests it's valuable to take a look at [the documentation for GdUnit3.](https://mikeschulze.github.io/gdUnit3/)

Some example test suites:

-   `DominoUnitTest`
-   `LobbyIntegrationTest`

### If using Godot editor

-   Open the script of the node / scene you want to create a test for
-   Right click the definition of the function you wish to test
    -   The line with `func <function_name>(...)`
-   Click on `create test`
-   A new file should be created using the template
-   Simply create new tests by writing new functions using the following format
    -   `func test_<test_case_name>(<test parameters and cases if parametarized test>)`

### If using Visual Studio Code

-   You can use the above steps to create the test file using the suggested template
-   Simply create new tests by writing new functions using the following format
    -   `func test_<test_case_name>(<test parameters and cases if parametarized test>)`

## Running locally

-   In the Godot editor, a tab for GdUnit should appear
-   To execute tests, click the `run tests` button.
-   To debug tests, place breakpoints and click the `debug tests` button.
