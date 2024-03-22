// // SPDX-License-Identifier: MIT

// pragma solidity 0.8.24;

// // importing the PriceConverter library
// import {PriceConverter} from "./PriceConverter.sol";

// // creating custom errors saves even more gas
// // custom errors are outside of the contract
// error NotOwner();

// contract FundMe {
//     // lets attach all uint256 for the PriceConverter
//     using PriceConverter for uint256;

//     // make sure min usd is in wei adjusted
//     // for variables that get set one time we can use constant keyword
//     // constants can save gas cost, doesnt take up as much storage
//     // without constant keyword = 887093 gas
//     // with constant keyword = 863678 gas
//     // constant variables have all caps
//     // on other chains that are cheaper this constant keyword wont make a difference but in Ethereum it does
//     // Ethereum gas tracker - shows average gwei
//     // Our transaction cost =  Eth average gas in wei(converted from gwei) * execution cost of the function
//     // 83000000000 * 303 = 2.5149e+13 --> this is in wei --> convert to eth --> 0.000025149 --> convert to USD --> 0.0965 USD
//     uint256 public constant MINIMUM_USD = 5 * (10 ** 18); // 1e18 means 1 x 10 ** 18
//     // you can also write like 5e18

//     // need to keep track of funders who sends us money
//     // lets put it in an array
//     address[] public funders;

//     // we also should make a mapping so that we can check our funders
//     // we can also name our mapping variables to make easy to understand and read
//     // address funder mapped to uint256 amountFunded
//     mapping(address funder => uint256 amountFunded)
//         public addressToAmountFunded;

//     // current problem is our withdraw function
//     // anyone can withdraw money
//     // we only want the owner of the contract to withdraw
//     // we need to set the owner at the beginning of the contract deployment
//     // this is where constructors come in
//     // it is immediately called during deployment
//     // first we need to setup an address that sets the owner
//     // good convention is to name immutable variables as i_
//     address public immutable i_owner;

//     // for variables that get set one time inside a constructor
//     // we can use the keyword immutable
//     // immutable variables are set in the byte code of the contract
//     // Values of immutable variables can be set inside the constructor but cannot be modified afterwards.
//     constructor() {
//         i_owner = msg.sender;
//     }

//     function fund() public payable {
//         // allows users to send $
//         // have a minimum $ sent
//         // msg.value has 18 decimals as it is in wei
//         // msg. value is also int256

//         // **** troubleshooting*****
//         // now that our getConversionRate function is complete we can
//         // pass in msg.value inside the getConversionRate function

//         // *** troubleshoot! ***
//         // however the getConversionRate returns with 18 decimals that means
//         // the minimunUSD must be adjusted to 18 decimals too!

//         // the first input variable for a library function will be the type you will be using for the library
//         // that means uint256 will get passed inside getConverstionRate() even though you dont pass any inside the function.
//         // msg.value = uint256
//         // why does this work?
//         // we are attaching the priceConverter library to all uint256
//         // that means all uint 256 have access to this getConversionRate()
//         // As msg.value is a uint256 it can call getConversionRate()
//         // if you wanted to add extra paramter inside the getConversionRate you would need to pass something inside the getConversion()
//         // eg 123 would be the second paramter in the getConverstionRate()
//         require(
//             msg.value.getConversionRate /*123*/() >= MINIMUM_USD,
//             "didnt send enough ETH"
//         );

//         // pushing a fund sent into the funders array
//         // msg.sender is global variable
//         // in our case the msg.sender will be our test metamask address
//         funders.push(msg.sender);

//         // updating our mapping
//         // *** troubleshooting *** why in this format? I am confused
//         // this will update the mapping.
//         // we can track the funders and the amount funded
//         // the below will find the existing value in the address and then add the msg.value ontop
//         // addressToAmountFunded[0x123abc...] = 100 + 50 = 150 wei
//         // 100 already existed in the above address and we just added 50 to it.
//         addressToAmountFunded[msg.sender] += msg.value;
//     }

//     // Using some for loop to withdraw money
//     // we also added a onlyOwner function modifier to this function
//     // modifiers are functions that are executed first in the code block
//     // they modify a function
//     function withdraw() public onlyOwner {
//         // reset all the mapping values to zero to show all the money has been withdrawn
//         // how do we do that?
//         // use a for loop to loop through array  and grab the address value
//         for (
//             uint256 funderIndex = 0;
//             funderIndex < funders.length;
//             funderIndex++
//         ) {
//             // access each address value
//             address funder = funders[funderIndex];
//             // access the amount value in the mapping by using the funder variable into the mapping addressToAmountFunded.
//             // this will get us access to the uint256 amountFunded.
//             // set amountFunded to zero
//             // that means each mapping number value will equal to zero for each address
//             addressToAmountFunded[funder] = 0;
//         }

//         // lesson 17 resetting an array
//         // we need to reset the array to zero
//         // or basically wipe the array back to zero without any addresses
//         // whats the solution here?
//         // just create a brand new funders array
//         // creates a new dynamic funders array with initial size of zero
//         funders = new address[](0);

//         // lesson 18 sending eth from a contract
//         // we also have to withdraw the money into the owner account
//         // there are three ways to do
//         // transfer, send and call
//         // mostly using call now after december 2019

//         // transfer (capped at 2300 gas, and throw and error)
//         // payable(msg.sender).transfer(address(this).balance);

//         // send (capped at 2300 gas and returns a bool)
//         // bool sendSuccess = payable(msg.sender).send(address(this).balance);
//         // require(sendSuccess, "Send failed");

//         // call (lower level commands)
//         // call forwards all gas or set gas returns bool. It doesnt have a cap gas
//         // you can call virtually any function in ethereum without the ABI
//         // the value is some transaction information in the {}
//         // it returns two variables - a bool and bytes data
//         // bytes objects are arrays so we save it in memory
//         (bool callSuccess /*bytes memory dataReturned*/, ) = payable(msg.sender)
//             .call{value: address(this).balance}("");
//         require(callSuccess, "Call failed");
//     }

//     modifier onlyOwner() {
//         // set the owner before withdrawing
//         // require(msg.sender == i_owner, "not owner, cannot withdraw");
//         // we can add the custom error here using an if statement and revert keyword
//         if (msg.sender != i_owner) {
//             revert NotOwner();
//         }

//         _;
//     }

//     // anytime you send a transaction and dont specify a function
//     // and keep call data blank
//     // the receive() will be triggered
//     // it will then trigger the fund()
//     // what if we copy the fund me address copy it in metamask
//     // and send it through there?
//     receive() external payable {
//         fund();
//     }

//     // whenever data is sent with a transaction
//     // ie calldata is populate the fallback() is triggered
//     // when calldata is populated it is trying to look
//     // for some function
//     // it will then trigger the fund()
//     fallback() external payable {
//         fund();
//     }
// }
