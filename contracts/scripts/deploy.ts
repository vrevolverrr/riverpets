import { ethers } from 'hardhat';
import { stringifyData } from '@vechain/sdk-errors';

async function main(): Promise<void> {
    const signer = (await ethers.getSigners())[0];

    const riverPetsTokenFactory = await ethers.getContractFactory(
        'RVPToken',
        signer
    );

    const riverPetsNFTFactory = await ethers.getContractFactory(
        'RiverPetsNFT',
        signer
    );

    const riverPetsTradeFactory = await ethers.getContractFactory(
        'RVPTrade',
        signer
    );

    const riverPetsNFTContract = await riverPetsNFTFactory.deploy();
    const riverPetsTokenContract = await riverPetsTokenFactory.deploy();
    const riverPetsTradeContract = await riverPetsTradeFactory.deploy();

    console.log(`NFT deployed @ ${await riverPetsNFTContract.getAddress()}`)
    console.log(`Token deployed @ ${await riverPetsTokenContract.getAddress()}`)
    console.log(`Trade deployed @ ${await riverPetsTradeContract.getAddress()}`)

    await riverPetsTokenContract.approve(await riverPetsTradeContract.getAddress(), 10000000)
    await riverPetsNFTContract.approve(await riverPetsTradeContract.getAddress(), 10000000)
    
    // Mint NFT
    await riverPetsNFTContract.mintNFT("0xf077b491b355E64048cE21E3A6Fc4751eEeA77fa", 0, 0, 100, 100 , 99, "https://raw.githubusercontent.com/bookofcolinn/fishes/main/bluey.json");
    
    // console.log(await riverPetsNFTContract.getTraits(0));
    await riverPetsNFTContract.transferNFT("0xf077b491b355E64048cE21E3A6Fc4751eEeA77fa", "0x7DBbC2b205C23574cF3C66172dFf6BAeb6fB4488", 0);
}

//

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});