// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Bid{
    
    uint256 finishTimestamp;

    constructor(uint256 durationInSeconds){
        finishTimestamp = block.timestamp + durationInSeconds;
    }

    function makeBid() view external {
        require(block.timestamp < finishTimestamp, "The bid has finished");
    }
}
