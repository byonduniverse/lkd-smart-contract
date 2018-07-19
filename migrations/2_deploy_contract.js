var Crowdsale = artifacts.require("Crowdsale");
var TimebasedMachineToken = artifacts.require("TimebasedMachineToken");

module.exports = function(deployer) {
    const RATE = new web3.BigNumber(1000);
    const WALLET = web3.eth.accounts[0];
    
    var deployedAddress;
    deployer.deploy(TimebasedMachineToken).then(function() {
        return deployer.deploy(Crowdsale, RATE, WALLET, TimebasedMachineToken.address );
    });
};
