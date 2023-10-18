import { dbank_new_backend as dbank} from "../../declarations/dbank_new_backend";

window.addEventListener("load",async()=>{
   
   let currentBalance = (await dbank.showCurrentValue()).toFixed(2);
   document.getElementById("value").innerText = currentBalance;
})

document.querySelector("form").addEventListener("submit",async(event)=>{
  let topUpAmount = parseFloat(event.target.topUp.value);
  let withDrawAmount = parseFloat(event.target.withdraw.value);

  event.preventDefault();//stop auto refesh the form after hit submit button
  let button = event.target.submit_button;


  button.setAttribute("disabled",true);//add attribute disble is true when user enter the transection details.This indicate that the transection process
                                       // is happening
  
  
  let value_in_topUp = document.getElementById("input-amount").value;     //prevent the bug when user press submit button with empty inputs
  let value_in_withdraw = document.getElementById("withdrawal-amount").value;                                   
  
  if(value_in_topUp.length !=0){ //prevent the bug when user press submit button with empty inputs
    await dbank.topUp(topUpAmount);
  }
  
  if(value_in_withdraw.length !=0){
    await dbank.withdraw(withDrawAmount);
  }

  

  button.removeAttribute("disabled");//After the update function are done we enable the button
  value_in_topUp = ""; //clear the data in input boxes after complete the transection
  value_in_withdraw = "";

  let currentBalance = (await dbank.showCurrentValue()).toFixed(2);
  document.getElementById("value").innerText = currentBalance;

})