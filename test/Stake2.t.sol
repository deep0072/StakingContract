// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Stake2, IOrcaCoin} from  "../src/Stake2.sol";
import {OrcaCoin2} from "../src/OrcaCoin2.sol";

contract StakingTest is  Test{
    Stake2 stakeContract;
    OrcaCoin2 orcaCoin;

    function setUp() public {
        orcaCoin = new OrcaCoin2(address(this));
        stakeContract = new Stake2(IOrcaCoin(address(orcaCoin)));
        orcaCoin.updateStakingContract(address(stakeContract));


    }

    function testStake() public {
        address user = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
        vm.prank(user);
        vm.deal(user, 10 ether);
        uint256 _amount = 10 ether;
        stakeContract.stake{value:_amount}();
        assert(stakeContract.balanceOf(user)== 10 ether);
    }

    function testUnstake() public {
        address user = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
        vm.deal(user, 10);
        uint256 _amount = 7;
        vm.startPrank(user);
        stakeContract.stake{value:_amount}();
        assert(stakeContract.balanceOf(user)==7);
        stakeContract.unstake(_amount);
        assert(stakeContract.balanceOf(user)==0);
        

    }

    function testRedeemReward() public {
        address user = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
        vm.startPrank(user);
        vm.deal(user, 600);
        stakeContract.stake{value:7}();
        vm.warp(block.timestamp + 1);
        assert(stakeContract.balanceOf(user)==7);
        stakeContract.unstake(7);
        assert(stakeContract.balanceOf(user)==0);
        assert(orcaCoin.balanceOf(user)==0);
        console.log("total reward before minted token",orcaCoin.balanceOf(user));
      
       


        console.log("total reward you are getting",stakeContract.getTotalReward());
        stakeContract.redeemReward();
        assert(orcaCoin.balanceOf(user) > 0);
        console.log("total reward in minted token",orcaCoin.balanceOf(user));
        console.log("after redeeming reward");
        console.log("total reward",stakeContract.totalReward(user));
        

    }
}