// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract VariablesEj{
    string storedInfo;

 function setInfo(string memory _storedInfo) external{
    storedInfo = _storedInfo;
 }  
 function getInfo() external view returns (string memory){
    return storedInfo; //aca le habia puesto mal q requiera variable como param
 }
}