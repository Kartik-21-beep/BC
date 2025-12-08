async function main(){
    const RPS = await ethers.getContractFactory("RPS");
    const rps = await RPS.deploy();
    await rps.waitForDeployment();
    console.log("RPS deployed to: ", rps.target);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});


