const secrets = require('./../env.json'); // should NOT be in source control

module.exports = {
  // default applies to all environments
  default: {
    // Blockchain node to deploy the contracts
    deployment: {
      host: "localhost", // Host of the blockchain node
      port: 8545, // Port of the blockchain node
      type: "rpc" // Type of connection (ws or rpc),
      // Accounts to use instead of the default account to populate your wallet
      ,accounts: [
        {
          privateKey: secrets.dev.key,
          balance: "5 ether"  // You can set the balance of the account in the dev environment
                              // Balances are in Wei, but you can specify the unit with its name
         }
      /*  {
          privateKeyFile: "path/to/file" // You can put more than one key, separated by , or ;
        },
        {
          mnemonic: "12 word mnemonic",
          addressIndex: "0", // Optionnal. The index to start getting the address
          numAddresses: "1", // Optionnal. The number of addresses to get
          hdpath: "m/44'/60'/0'/0/" // Optionnal. HD derivation path
        }*/
      ]
    },
    // order of connections the dapp should connect to
    dappConnection: [
      "$WEB3",  // uses pre existing web3 object if available (e.g in Mist)
      "ws://localhost:8546",
      "http://localhost:8545"
    ],
    gas: "auto",
    contracts: {
      // example:
      LKDToken: {
        "file": "./contracts/LKD.sol",
        "onDeploy": ["LKDToken.methods.transfer('"+secrets.dev.address+"', \"141120000\").send()"]
      }
    }
  },
  testnet: {
    deployment:{
      accounts: [
        {
         privateKey: secrets.ropsten.key
        }
      ],
      host: "ropsten.infura.io/v3/d8094160bace450f8d23a11bf300a7dd",
      port: false,
      protocol: 'https',
      type: "rpc"
    }
  }
};
