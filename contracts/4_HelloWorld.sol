// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract HelloWorld{
    string name;
    address wallet;
    string message;
    uint256 date;

//sin parámetros - con atributos
    function seeLastVisit() external view returns (string memory, address, string memory, uint256){
        return (name, wallet, message, date); 
    }

//con parámetros 
    function writeVisit(string memory _name, string memory _message) external {
        name = _name;
        wallet = msg.sender; //pido dir wallet del que envia
        message = _message;
        date = block.timestamp; //pido fecha a solidity
    }

    //0x8A982bF6E307E6463187EDe04dFdaB75f736b6cb Dir del contract
}