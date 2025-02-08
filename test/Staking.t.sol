// // SPDX-License-Identifier: UNLICENSED
// pragma solidity ^0.8.13;

// import {Test, console} from "forge-std/Test.sol";
// import {Stake} from  "../src/Stake.sol";

// contract StakingTest is  Test{
//     Stake stakeContract;

//     function setUp() public {
//         stakeContract = new Stake();

//     }

//     // function testStake() public {
//     //     address user = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
//     //     vm.prank(user);
//     //     vm.deal(user, 10 ether);
//     //     uint256 _amount = 10 ether;
//     //     stakeContract.stake{value:_amount}();
//     //     assert(stakeContract.tokenBalance(user)== 10 ether);
//     // }

//     function testUnstake() public {
//         address user = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
//         // address user = address(this);
//         vm.startPrank(user);
//         vm.deal(user,10);
//         stakeContract.stake{value:10}();
//         console.log("contract balance after staking ",stakeContract.tokenBalance(user));
//         stakeContract.unstake(5);
//         assert(stakeContract.tokenBalance(user)==5);
//         vm.stopPrank();

//     }
// }