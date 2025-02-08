// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OrcaCoin is ERC20 {
    address public stakingContract;
    address owner;

    constructor(address _stakingContract) ERC20("Orca Coin", "ORCA") {
        stakingContract = _stakingContract;
       
    }

    modifier onlyOwner() {
        require(msg.sender == stakingContract, "not authorized");
        _;
    }

    function mint(address to, uint256 _amount) external onlyOwner {
       
        _mint(to, _amount);
    }

    function updateStakingContract(address _stakingContract) public onlyOwner {
        stakingContract = _stakingContract;
    }
}
