# ECS_Standard
Respository detailing ECS standard and Cutouts project with crypto stamping 



The cutouts.sol contract extends Openzeppelin's ERC721 contract (version 4.4.1).
Tested and deployed using Remix.
Currently deployed onto the Rinkeby network.


Features

constructor of ECS01 (uint256 maxCount_ ,bool setconstRarity_ , uint256 constRarity_ ) , where maxCount_ is set for max no of crypto stamps allowed in collections , seconstconstRarity_ is bool to decide if we set a constant rarity across all the nfts in collections with constRarity_ as the value of rarity if seconstconstRarity_ is set to true otherwise ignored

Functions :

_setRarityIndex(uint256 _tokenid, uint256 _rarity) is ised to set/change the rarity of each of the tokenid 

_getRarityIndex(uint256 _tokenid) returns the rarity of tokenid

maxCount() returns the maxcount set in constructor initialization

maxRarity() returns the maxrarity set in ECSO1 conract to 99

_setNewContractlink(address _linkAdress) is used to set newContract address the contract can point to , intially set to address(0)

Cutouts NFt is importng ECS01 stantard to give collection cryptostamping functionalities
Functions on cutouts.sol

createCutOut(string memory tokenURI , uint256 rarity , address to) creates a NFT with the given toekURI with a set rarity, directly minted in to address set. The price of 0.05 eth was set to mint 

getRarity(uint256 tokenid) is called to get rarity of tokenid

# TODO

Add ReentrancyGuard to the contract
