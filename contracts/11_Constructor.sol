// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract VariablesEj{
    string storedInfo;
    uint public countChanges = 0;

 constructor(){
    storedInfo = "Inicializando storedInfo con constructor";
    //contador en cero
 }   

 function setInfo(string memory _storedInfo) external{
    storedInfo = _storedInfo;
    countChanges++;
 }  
 function getInfo() external view returns (string memory){
    return storedInfo; 
 }
}