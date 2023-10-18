import Debug "mo:base/Debug"; //import this libray to display messages in console
import Float "mo:base/Float";
import Time "mo:base/Time";

actor dbank {

  var currentValue : Float = 100; //Create variables //if we add stable to this variable this variable will do not reset to it's original state even we restart the canister
  currentValue := 100; //Assign new values to variable
  Debug.print(debug_show (currentValue));

  var startTime = Time.now();

  // let id = 87884834843; //Create constants

  // Debug.print("Hello"); //Print text inside console

  // Debug.print(debug_show (currentValue)); //Display numbers in console

  //***These are update function it takes lot's of time to execute because here we are updating a state and write it to block chain.That's why it is take time
  public func topUp(amount : Float) {

    currentValue += amount;
    Debug.print(debug_show (currentValue));

  };

  public func withdraw(amount : Float) {
    //We are passing a parameter named amount.Here the data type of amount is Natural Number.

    let tempValue : Float = currentValue - amount; //Here the data type of tempValue us Integer
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("The enterd amount is grater that Current value");
    };

  };
  //hello

  //*These are query function we sholud addd special keyword before function named query.
  //*These are much faster because they are just use to show some values
  public query func showCurrentValue() : async Float {
    // Id we are retuning something from public function we must use "async" keywoed.
    return currentValue;
  };

  public func compound() {

    let currentTime = Time.now();
    let timeElaspsedNS = currentTime - startTime;
    let timeElaspsedSEC = timeElaspsedNS / 1000000000;

    currentValue := currentValue +((1 +0.01) ** Float.fromInt(timeElaspsedSEC));
    startTime := currentTime;

    Debug.print(debug_show ());
  };

};
