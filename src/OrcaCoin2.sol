pragma solidity ^0.8.13;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OrcaCoin2 is ERC20{
    address stakingContract;

    modifier onlyOwner(){
        require(msg.sender==stakingContract, "only owner required");
        _;
    }
    constructor (address _stakingConract)ERC20("OrcaCoin", "ORC"){
        stakingContract = _stakingConract;

    }

    function mint(address to,uint256 _amount) public onlyOwner{
        _mint(to, _amount);
    }

    function updateStakingContract(address _stakingContract) public onlyOwner{
        stakingContract = _stakingContract;
    }


}   