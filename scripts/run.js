const main = async() =>
{
    const [owner,randomPerson] = await hre.ethers.getSigners();
    const domainContractFactory = await hre.ethers.getContractFactory("Domains");
    
    const domainContract = await domainContractFactory.deploy();

    await domainContract.deployed();
    console.log("Contract deployeed to ", domainContract.address);
    console.log("Contract deployed by:",owner.address);
    const txn = await domainContract.register("doom");
    await txn.wait();
    const domainOwner = await domainContract.getAddress("doom");
    console.log("owner of domain :",domainOwner);
    // trying to set a record that doesn't belong to me;
    txn = await domainContract.connect(randomPerson).setRecord("doom","Haha my domain now!");
    await txn.wait();
}


const runMain = async() =>{
    try
    {
        await main();
        process.exit(0);
    }
    catch(error)
    {
        console.log(error);
        process.exit(1);
    }
};


runMain();

