//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {
    // Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // create a mapping of whitelistedAddresses
    // if an address is whitelisted, we would set it to true, it is false by default
    mapping(address => bool) public whitelistedAddresses;

    //numAdressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    uint8 public numAddressesWhitelisted;

    // Setting the max number of whitelisted address
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresse) {
        maxWhitelistedAddresses = _maxWhitelistedAddresse;
    }

    // addAddressToWhitelist - this function adds the address of the sender
    // to the whitelist
    function addAddressToWhitelist() public {
        //check if user has already been whitelisted
        require(
            !whitelistedAddresses[msg.sender],
            "Sender has already been whitelisted"
        );
        //check if the numAddressesWhitelistetd < maxWhitelistedAddresses, if not then throw an error
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "More addresses cant be added, limit reached"
        );
        whitelistedAddresses[msg.sender] = true;
        //increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}
