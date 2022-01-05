// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

import "@openzeppelin/contracts/access/Ownable.sol";

import "./ECS01.sol";

contract cutouts is ERC721URIStorage, ECS01 , Ownable {
    
    uint256 public tokenCounter;
    
    uint256 _price = 0.05 ether;

    uint256 MaxCount = 1000; 

    address _admin;

    constructor()  
    ERC721("CutOuts", "CutOuts") 
    ECS01(MaxCount ,false , 0 )
    {
        _admin = msg.sender;
        tokenCounter = 0;

    }

    
    function createCutOut(string memory tokenURI , uint256 rarity , address to)
        public
        payable
        returns (uint256)
    {
        
        require(tokenCounter < MaxCount , "Exceeds maximum Cutouts supply");

        if (_admin != msg.sender){
            require( msg.value >= _price, "Ether sent is not correct" );
        }
    
        _safeMint(to, tokenCounter);
        _setTokenURI(tokenCounter, tokenURI);
        
        //set RarityIndex
        _setRarityIndex(tokenCounter , rarity);
        
        tokenCounter = tokenCounter + 1;
        return tokenCounter;
    }
    

    function totalSupply() public view returns (uint256) {
        return tokenCounter;
    }
    
    function getRarity(uint256 tokenid) external view returns (uint256) {
        return  _getRarityIndex(tokenid);
    }
    
    
    function setNewPrice(uint256 newPrice) external onlyOwner {
        _price = newPrice;
    }
    
    
    function withdraw() public payable onlyOwner {
        require(payable(msg.sender).send(address(this).balance));

    }

    function setNewAdmin(address newAddress) external onlyOwner {
        _admin = newAddress;
    }

    function changeTokenURI(uint256 tokenid_ , string memory  tokenURI_) external onlyOwner {
        _setTokenURI(tokenid_, tokenURI_);
    }


    function setUpgrableContract(address newAddress) external onlyOwner {
        _setNewContractlink(newAddress);
    }
    

}
