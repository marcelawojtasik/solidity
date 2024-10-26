// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract HelloWorld{
    string name;
    address wallet;
    string message;
    uint256 date;

    constructor(string memory _name){ //paso nombre x parametro, puede tener los q sea
        wallet = msg.sender;
        message = "Contract created";
        date = block.timestamp;
        name = _name;
    }

    function seeLastVisit() external view returns (string memory, address, string memory, uint256){
        return (name, wallet, message, date); 
    }


    function writeVisit(string memory _name, string memory _message) external {
        name = _name;
        wallet = msg.sender; //tx.origin
        message = _message;
        date = block.timestamp; 
    }

    // Dir del contract 0x2893C957Fe8aa4dc56c5592560f89794A8a3C7D2
}