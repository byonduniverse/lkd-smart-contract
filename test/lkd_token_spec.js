// /*global contract, config, it, assert*/
const LKDToken = embark.require('Embark/contracts/LKDToken');
const secrets = require('./../env.json'); // should NOT be in source control

config({
  "deployment": {
    "accounts": [
      {
        "privateKey": secrets.dev.key,
        balance: "5 ether"
      }
    ]},
  contracts: {
    "LKDToken": {
      "file": "./contracts/LKD.sol",
      "onDeploy": ["LKDToken.methods.transfer('"+secrets.dev.address+"', \"141120000\").send()"]
    }
  }
});

contract("LKDToken", function () {
  this.timeout(0);

  it("should send 141120000 tokens to defined dev address " + secrets.dev.address, async function () {

    web3.eth.getBalance(secrets.dev.address).then(console.log);


    let result = await LKDToken.methods.balanceOf(secrets.dev.address).call();
    assert.strictEqual(parseInt(result, 10), 141120000);
  });
});
