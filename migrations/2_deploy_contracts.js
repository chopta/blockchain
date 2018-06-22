var election = artifacts.require("./election.sol"); //truffle exposed this artifacts

module.exports = function(deployer) {
  deployer.deploy(election);
};
