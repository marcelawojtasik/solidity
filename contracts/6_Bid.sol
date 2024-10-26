// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Bid{
    
    uint256 finishTimestamp;
    uint256 public maxBid; //para poder verla
    address maxBidder;

    constructor(uint256 durationInSeconds){
        finishTimestamp = block.timestamp + durationInSeconds;
    }

    function makeBid() external payable {
        require(block.timestamp < finishTimestamp, "The bid has finished");

        if (msg.value > maxBid){
            maxBid = msg.value;
            maxBidder = msg.sender;
        }
        else{
            revert("The bid is not enough"); //devuelve los fondos
        }
    } 
    //require es como usar if... else
    //payable modificador q indica q function acepta pagos
    //msg.value tiene el valor q voy a mandar
}
