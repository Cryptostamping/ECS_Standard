// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract ECS01 {

    uint256 private _maxCount;
    
    uint256 private _maxRarity = 99;

    uint256 private _constRarity; 

    bool private _setconstRarity = false;   

    mapping(uint256 => uint256) private _rarityIndex;

    address public _nextContractAddress;

    uint256 private usedcapacity;

    event NewContractAdress(address newone);

    constructor(uint256 maxCount_ ,bool setconstRarity_ , uint256 constRarity_ ) {
        _maxCount = maxCount_;
        _setconstRarity = setconstRarity_;
        _constRarity = constRarity_;
    }

    function maxCount() public view returns (uint256) {
        return _maxCount;
    }

    function maxRarity() public view returns (uint256) {
        return _maxRarity;
    }


    function _setRarityIndex(uint256 _tokenid, uint256 _rarity)  internal  {

        require(_rarity > 0 , "rarity cannot be zero , min 1" );

        require(_setconstRarity == false, "set to use only constant rarity , cannot set or change ");

        if (_rarity > _maxRarity ){
            _rarity = _maxRarity;
        }

        if (_rarityIndex[_tokenid] == 0){
            if (usedcapacity < _maxCount){
            _rarityIndex[_tokenid] = _rarity;
            usedcapacity = usedcapacity+1;
            }
        }
        else{
         _rarityIndex[_tokenid] = _rarity;
        }
        
    }

    function _getRarityIndex(uint256 _tokenid)  internal view returns (uint256)  {

        if (_setconstRarity){
            return _constRarity;
        }

        return _rarityIndex[_tokenid];
        
    }

    function _setNewContractlink(address _linkAdress)  internal  {

        _nextContractAddress = _linkAdress;

        emit NewContractAdress(_nextContractAddress);
   
    }


}
