import { ethers } from 'hardhat';
import { RiverPetsNFT, RVPToken__factory } from '../typechain-types';

async function main(): Promise<void> {
    const signer = (await ethers.getSigners())[0];

    // const riverPetsNFTFactory = await ethers.getContractFactory(
    //     'RiverPetsNFT',
    //     signer
    // );

    // const riverPetsNFTContract = await riverPetsNFTFactory.deploy();
    // await riverPetsNFTContract.waitForDeployment();

    // const riverPetsNFTContract = riverPetsNFTFactory.attach("0x70efc054cbee7e75e36e675ebb9bad74da726c1e")
    
    // console.log(await riverPetsNFTContract.getAddress())
    // console.log(await riverPetsNFTContract.getTraits(0));

    const riverPetsTradeFactory = await ethers.getContractFactory('RVPTrade', signer);

    const riverPetsTradeContract = riverPetsTradeFactory.attach("0xc54e5073271c68d69c4c221c42f76cbd66ee7e2b")

    await riverPetsTradeContract.connect(signer).transferBoth("0x7675c7abf9fb6d1898913470654325605ecc30c4", "0x1fc87bddeeca51cc9eb6d001cebac020c95b5480", "0x7DBbC2b205C23574cF3C66172dFf6BAeb6fB4488", "0xf077b491b355E64048cE21E3A6Fc4751eEeA77fa", 1000, 0);

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});