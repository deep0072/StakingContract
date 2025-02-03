// // SPDX-License-Identifier: UNLICENSED
// pragma solidity ^0.8.13;

// import {Test, console} from "forge-std/Test.sol";
// import {OrcaCoin} from "../src/OrcaCoin.sol";

// contract OrcaCoinTest is Test {
//     OrcaCoin public orcaCoin;

//     function setUp() public {
//         orcaCoin = new OrcaCoin(address(this));
//     }

//     function test_IntialSupply() public view {
//         assert(orcaCoin.totalSupply() == 0);
//     }

//     function testFailMint() public {
//         vm.prank(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
//         orcaCoin.mint(address(this), 10);

//     }

//     function test_mint() public {
//         orcaCoin.mint(address(this), 10);
//         assert(orcaCoin.totalSupply()==10);
//         assert(orcaCoin.balanceOf(address(this))==10);
//     }

//     function testFailUpdateStakingContract() public {
//         vm.prank(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
//         orcaCoin.updateStakingContract(address(this));
//     }
//     function test_update_staking_contract() public {
//         orcaCoin.updateStakingContract(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
//         orcaCoin.mint(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266, 90);
//         assert(orcaCoin.balanceOf(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266)==90);

//     }
// }
