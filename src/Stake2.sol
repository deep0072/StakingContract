pragma solidity ^0.8.13;

interface IOrcaCoin{
    function mint (address _to, uint256 _amount) external;

}

contract Stake2 {
    uint256 public totalStakedToken;
    mapping(address=>uint256) public balanceOf;
    uint256 public lastUpdatedTime;
    mapping(address => uint256) public totalReward;
    uint256 public REWARD_PER_SEC = 1;
    IOrcaCoin public mintTokenAddress;
    constructor (IOrcaCoin _mintTokenAddress){
        mintTokenAddress = _mintTokenAddress;
    }

    function _updateReward() internal{
        if (lastUpdatedTime == 0){
            lastUpdatedTime = block.timestamp;
            return;
        }

        totalReward[msg.sender]+= (block.timestamp-lastUpdatedTime) * balanceOf[msg.sender] *REWARD_PER_SEC;

        lastUpdatedTime = block.timestamp;
    }

    function stake() public payable {
        uint256 _amount = msg.value;
        require(_amount >0, "should be more than the zero");
        _updateReward();
        balanceOf[msg.sender]+=_amount;
        totalStakedToken+=_amount;

    }

    function unstake(uint256 _amount) public {
        require(_amount > 0, "amount should be atleast greater than zero");
        require(balanceOf[msg.sender] >= _amount, "not anough amount to unstake");
        _updateReward();
        totalStakedToken-=_amount;
        balanceOf[msg.sender]-=_amount;
        payable(msg.sender).transfer(_amount);


    }


    function redeemReward() public {
        uint256 _amount = totalReward[msg.sender];
        _updateReward();
        require(_amount>0, "no reward to redeem");
        mintTokenAddress.mint(msg.sender,_amount);




    }

    function getTotalReward() public returns (uint256) {
        uint256 timeDiff = block.timestamp - lastUpdatedTime;
        if (timeDiff==0){
            return totalReward[msg.sender];
        }

        return totalReward[msg.sender]+=timeDiff*balanceOf[msg.sender]*REWARD_PER_SEC;
    
        
    }
}