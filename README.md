# ECS_Standard
Respository detailing ECS ( Ethereum Cryptostamping Standard)

ECS01 primarily focuses on rarity factor, i.e a stamping limit that defines the number of times a stamp can be stamped. This pushes context to what user really values at the moment, and is used as a factor in the valuation of a particular stamping.

For example, a rarity factor of 9x represents that at any given point of time in internet, there can only be 9 sightings of that stamp. That is if you wish to stamp it elsewhere, you have to remove it from where you have stamped before. So when we measure the value a stamp adds to the website, we do it like avg. NFT pricing / stamping limit. 


## Constructor

The default ECS constructor is 
`ECS01  (uint256 maxCount_ ,bool setconstRarity_ , uint256 constRarity_ )` 

- `maxCount_` defunes the max no of crypto stamps allowed in collections.
- `seconstconstRarity_` is bool to decide if rarity is constant across all the nfts in collection. 
- `constRarity_` is the value of rarity if seconstconstRarity_ is set to `true`.

## Implementation

- `ECS01(999,false,0)` represents a collection with a max limit of 999 NFT/Stamps with variable rarity based on token ID, set using `_setRarityIndex(uint256 _tokenid, uint256 _rarity)`

- `ECS01(999,true,55)` represents a collection with a max limit of 999 NFT/Stamps with constant rarit of 55 for each NFT/Stamp.

- `ECS01(999,true,0)` represents a collection with a max limit of 999 NFT/Stamps with constant rarit of 0 which stands for infinity i.e there is no stamping limit and hence no value addition.

# Example

The `cutouts.sol` contract extends Openzeppelin's ERC721 contract (version 4.4.1). Tested and deployed using Remix. Currently deployed onto the Rinkeby network. Cutouts NFt is importing ECS01 stantard to add cryptostamping functionality.

`createCutOut(string memory tokenURI , uint256 rarity , address to)` creates a NFT with the given toekURI with a set rarity, directly minted in to a set address. The price of 0.05 eth was set to mint

```bash
function createCutOut(string memory tokenURI , uint256 rarity , address to)
        public
		payable
        returns (uint256)
    {
        
        if (_admin != msg.sender){
            require( msg.value >= 0.05, "Ether sent is not correct" );
        }
    
        _safeMint(to, tokenCounter);
        _setTokenURI(tokenCounter, tokenURI);
       
       	/*Setting Rarity of an individual NFT*/
        _setRarityIndex(tokenCounter , rarity);
        
        tokenCounter = tokenCounter + 1;
        return tokenCounter;
    }
```

# Functions

`_setRarityIndex(uint256 _tokenid, uint256 _rarity)` is used to set/change the rarity of each of the tokenid 

`_getRarityIndex(uint256 _tokenid)` returns the rarity of tokenid

`maxCount()` returns the maxcount set in constructor initialization

`maxRarity()` returns the maxrarity set in ECSO1 conract to 99

`_setNewContractlink(address _linkAdress)` is used to set newContract address the contract can point to , intially set to address(0)

# TODO

Add ReentrancyGuard to the contract
