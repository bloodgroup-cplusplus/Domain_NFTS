pragma solidity ^0.8.10;

import "hardhat/console.sol";

contract Domains
{
    // A "mapping" data type to store their names
    mapping(string => address) public domains;
    //checkout our new mapping! this will store values 
    mapping(string =>string) public records;
    constructor()
    {
        console.log("This is my domains contract.Noice.");

    }

    //A register function that adds their names to our mapping
    function register(string calldata name) public 
    {
        domains[name] = msg.sender;
        console.log("%s has registered a domain !",msg.sender);
    }

    // This will give us a the domain owners' address
    function getAddress(string calldata name) public view returns (address)
    {
        return domains[name];
    }

    function setRecord(string calldata name, string calldata record) public
    {
        //Check that the owner is the transaction sender
        require (domains[name]==msg.sender);
        records[name] = record;
    }

    function getRecord (string calldata name) public view returns (string memory)
    {
        return records[name];
    }


}


