// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IOrcaCoin{
    function mint(address _to, uint256 _mint) external;

    

}

contract Stake {
    uint256 public totalStaked;
    mapping(address => uint256) public tokenBalance;
    mapping(address => uint256) public totalReward;
    mapping(address => uint256) lastUpdatedTime;
    uint256 public constant REWARD_PER_SEC_PER_ETH = 1;

    IOrcaCoin public orcaCoin;

    

    constructor(IOrcaCoin _token) {
        orcaCoin = _token;
    }

    function _updateReward(address _user) internal {
        if (lastUpdatedTime[_user] == 0){
            lastUpdatedTime[_user] = block.timestamp;
            return;
        }

        totalReward[_user] += (lastUpdatedTime[_user] - block.timestamp)*tokenBalance[_user]*REWARD_PER_SEC_PER_ETH;
        lastUpdatedTime[_user] = block.timestamp;


    }

    function stake() external payable {
        // accept ethereum
        require(msg.value > 0, "should be more than 0");
        _updateReward(msg.sender);
        tokenBalance[msg.sender]+=msg.value;
        totalStaked+=msg.value;

    }
    function unstake(uint256 _amount) public {
       
        require(_amount <=tokenBalance[msg.sender], "not enough amount");
        // totalReward[msg.sender]+=_amount;
        payable(msg.sender).transfer(_amount);
        _updateReward(msg.sender);
        tokenBalance[msg.sender]-=_amount;

        // now call claimRewarad


    }

    function claimReward() public {
        _updateReward(msg.sender);
        orcaCoin.mint(msg.sender,  totalReward[msg.sender]);
        require(totalReward[msg.sender] > 0, "nothing left to claim reward");


    }
}
