// SPDX-License-Identifier: GPL-3.0


pragma solidity ^0.8.0;
/**
 * Contract: PaymentSplitter
 * @Brief: 	This contract allows to split Ether payments among a group of accounts. 
 *			The split can be in equal parts or in any other arbitrary proportion. 
 *			The way this is specified is by assigning each account to a number of shares.
 *			Of all the Ether that this contract receives, each account will then be able to
 *			claim an amount proportional to the percentage of total shares they were assigned.
 *			
 *			#PaymentSplitter follows a pull payment model. This means that payments are not
 *			automatically forwarded to the accounts but kept in this contract, and the actual 
 *			transfer is triggered as a separate step by calling the release function.
 *
 * @TODO:	Automate the contract to follow a push method instead of pulling. This could require fallback function.
 */
import "@openzeppelin/contracts/finance/PaymentSplitter.sol";

/**
 * @Brief: PaymentMNG is a payment manager contract that inherit from the PaymentSplitter contract 
 *
 */
contract PaymentMNG is PaymentSplitter {
 
    //create a constructor method and pass it through the PaymentSplitter contract
    //Payable constructor can receive Ether
    //Input1: ["0xADDR1", "0xADDR2", "0xADDRN"]
    //INPUT2: [EQUITY1, EQUITY2, EQUITYN]
    constructor (address[] memory payees, uint256[] memory shares) PaymentSplitter(payees, shares) payable {}
    
}  