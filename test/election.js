var Election = artifacts.require("./Election.sol");

var electionInstance;

contract("Election", function (accounts) {
  it("initialize with two candidates", function () {
    return Election.deployed()
      .then(function (instance) {
        return instance.candidatesCount();
      })
      .then(function (count) {
        assert.equal(count, 2);
      });
  });

  it("it initialize contract with the correct value", function () {
    return Election.deployed()
      .then(function (instance) {
        electionInstance = instance;
        return electionInstance.candidates(1);
      })
      .then(function (candidate) {
        assert.equal(candidate[0], 1, "contains correct id");
        assert.equal(candidate[1], "Candidate 1", "contains correct name");
        assert.equal(candidate[2], 0, "contains the correct votes count");
        return electionInstance.candidates(2);
      })
      .then(function (candidate) {
        assert.equal(candidate[0], 2, "contains correct id");
        assert.equal(candidate[1], "Candidate 2", "contains correct name");
        assert.equal(candidate[2], 0, "contains the correct votes count");
      });
  });
});
