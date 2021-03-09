const hre = require("hardhat");
const LazyArtifact = require("../compiled/Lazy.json");
const contractAddress = require("../compiled/contract-address.json");

async function main() {
    const [owner, addr1, ...addrs] = await ethers.getSigners();

    const contract = new ethers.Contract(
        contractAddress.Lazy,
        LazyArtifact.abi,
        owner
    );

    const passing = "this should pass okay is it passing.";
    const failing = "this should fail.";
    const hash = await ethers.utils.id(passing);
    const signed = await owner.signMessage(ethers.utils.arrayify(hash));

    let r1 = await contract._verify(passing, signed);
    let r2 = await contract._verify(failing, signed);
    console.log(r1);
    console.log(r2);
}


main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
