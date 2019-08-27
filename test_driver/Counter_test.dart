// Imports the Flutter Driver API.

import 'package:flutter_driver/flutter_driver.dart';
//import 'package:screenshots/screenshots.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final counterTextFinder = find.byValueKey('counter');
    final buttonFinder = find.byValueKey('increment');
    //final configInfo = Config().configInfo;

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      //sleep(Duration (seconds: 10));
      //driver = await FlutterDriver.connect(dartVmServiceUrl: "http://127.0.0.1:8888/YajgTVNAE1c=/");
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      //await screenshot(driver, configInfo, 'Screenshot1');
      expect(await driver.getText(counterTextFinder), "0");
    });

    test('increments the counter', () async {
      // First, tap the button.
      await driver.tap(buttonFinder);

      // Then, verify the counter text is incremented by 1.
      //await screenshot(driver, configInfo, 'Screenshot2');
      expect(await driver.getText(counterTextFinder), "1");
    });

    test('Multiple taps', () async{
      //Starting the loop
      for(var i = 0; i < 5; i++){
        await driver.tap(buttonFinder);
        print("       Iteration # $i" + "      Value of Button Press: " + await driver.getText(counterTextFinder));
        //await screenshot(driver, configInfo, 'Screenshot-Loop$i');
      }

      //Verifying the result

      expect(int.parse(await driver.getText(counterTextFinder)), greaterThan(4));

      /*
      expect(int.parse(await driver.getText(counterTextFinder)), greaterThan(8), reason: "Value is less than 8");
      expect(int.parse(await driver.getText(counterTextFinder)), lessThan(8), reason: "Value is More than 8");var text = await driver.getText(counterTextFinder);
      int variable = int.parse(text.toString());int variable;
      var text;, radix: 10);
      var s =0;
      print(await driver.getText(counterTextFinder));
      print(text.toString() + "/n" + "/n" + '$variable');
      print(text.toString() + "/n" + "/n" + '$variable');*/

    });

  });
}