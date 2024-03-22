// // SPDX-License-Identifier: MIT

// pragma solidity 0.8.24;

// // We will create a library for PriceConverter
// // This will help declutter our environment

// import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


//  library PriceConverter {

//     // how do we change USD into Eth?
//     // get Eth price
//     // then covert it into USD

//     // this function gets the price of Eth in terms of UD from chainlink data feed
//     // then converts it into wei unint256 value
//     function getPrice()  internal view returns (uint256){
//     //     // to get the price of Eth we need chainlink data feeds
//     //     // Address https://docs.chain.link/data-feeds/price-feeds/addresses?network=ethereum&page=1
//     //     // ETH/USD 0x694AA1769357215DE4FAC081bf1f309aDC325306
        
//     //     // How do we get the ABI? Got to chainlink smartcontractkit github
//     //      // price of Eth in terms of USD in gwei
//     //     // price has eight decimals
//     //

//         // **** troubleshooting*****
//         AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);   
//         (, int256 answer, , , ) = priceFeed.latestRoundData();
//          // need to typecast it into unint256 as the returned variable answer is int256
//          //  multiplication by 10000000000 to move the decimal 10 places to the right
//          // this is because it will convert a value with 8 decimals to a value with 18 decimals
//          // msg.value usually has 18 decimals and is int256
//          // we also need to convert int256 answer into a uint256

//          // eg price feed answer variable returns 3400 = 1 ETH (in terms of USD)
//          // it will return  3400.12345678
//          // to convert it to a uint256 we have to multiply by 10000000000 to convert it into wei
//          // this will return 3400 * 10000000000 = 34000000000000 (price in wei)

         

//         //  we have to typecast the price as well and make it uint256
//         // we can typecast int256 into uint256. However sometimes we cannot. 
//         // Read the docs for more info.
//          return uint256(answer * 10000000000);
//     }

//     // Converts an ETH amount in wei back into USD amount worth in ETH
    
//     function getConversionRate(uint256 ethAmount /*uint256 somethingElse*/) internal view returns (uint256) {
//         // 1 eth?
//         // e.g. 2000,000000000000000000 (with 18 decimals)
//         // (2000,000000000000000000 * 1,000000000000000000)  / 1e18
//         // 1 ETH = 2000 or 2000USD 
//         // as it is in wei we need to change to Ether. wei has 18 decimals
//         // a whole number. Always multiply before divide

//         // this will return eth price in terms of wei
//         // we need to get the getPrice function
//         uint256 ethPrice = getPrice();

//         // conversely to change wei back into ETH the calculation is:
//         // priceInWei / 1 ether
//         // example 
//         // = 34000000000000 / 1e18 (thats 10 ** 18)
//         // 0.034 ETH

//         // the reason why we divid by 10 ** 18 is because
//         // ethPrice and ethAmount when multiplies will have 36 zeroes
//         // good rule of thumb is to always multiply first then divide.
//         // the below ethAmountInUsd returns in Gwei and will have 18 decimals very Important!

//         // Go to eth converter and put in the value of ethAmountInUsd
//         // you should see the ETH value 2000 
//         // this will mean 1 ETH = 2000 USD
//         // this section was really confusing 
//         // **** troubleshooting*****
//         uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1000000000000000000;
//         return ethAmountInUsd;
//     }

//     function getVersion() internal view returns (uint256) {
//         return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
//     }



//  }