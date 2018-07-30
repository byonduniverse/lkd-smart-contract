var MockTMT = artifacts.require("MockTMT");

module.exports = function(deployer) {
    const RATE = new web3.BigNumber(1000);
    const WALLET = web3.eth.accounts[0];
    
    var deployedAddress;
    deployer.deploy(MockTMT);
};
