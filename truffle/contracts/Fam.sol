// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

import '../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '../node_modules/@openzeppelin/contracts/access/Ownable.sol';


/** 
*@title Minting contract for FAM
* @notice This contract is used to create FAM 
*/
 
contract Fam is ERC20, Ownable {

	// events
	event FamTransfered(address recipient, uint amount);
    
    // Constructor

	constructor() ERC20('Family Token', 'FAM') {}
	
	/** 
	@dev fonction faucet pour créer des Fam tokens
	*/

	function faucet(address recipient, uint amount) external onlyOwner {
		_mint(recipient, amount);
		
	}

    /** 
	 @dev replace default 18 decimals to 8 decimals
	*/

	function decimals() public view virtual override returns (uint8){
		return 8;
	}

    /** 
	 * @dev See {IERC20-transfer} Openzeppelin librairy
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
	*/

   function transferFAM(address recipient, uint amount) public{
       transfer(recipient , amount);
	   emit FamTransfered(recipient, amount);
   }

    /**
     @notice return the balance of an account
	 */

   function balanceOfFAM(address account) public view  returns (uint) {
      return balanceOf(account);
   }
   
}