/**
 * @type import('hardhat/config').HardhatUserConfig
 */

require("@nomiclabs/hardhat-waffle");

require('dotenv').config();
const { API_URL, PRIVATE_KEY } = process.env;

// API_URL
// Go to https://www.alchemyapi.io, sign up, create
// a new App in its dashboard, and replace "KEY" with its key

// PRIVATE_KEY
// Replace this private key with your Ropsten account private key
// To export your private key from Metamask, open Metamask and
// go to Account Details > Export Private Key
// Be aware of NEVER putting real Ether into testing accounts

module.exports = {
  solidity: "0.7.3",
  networks: {
    ropsten: {
      url: API_URL,
      accounts: [`${PRIVATE_KEY}`]
    }
  }
};