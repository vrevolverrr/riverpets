import { type HardhatUserConfig } from 'hardhat/config';
import '@nomicfoundation/hardhat-toolbox';
import '@vechain/sdk-hardhat-plugin';

/**
 * Main hardhat configuration
 *
 * Here we have custom VeChain networks: 'vechain_mainnet', 'vechain_testnet' and 'vechain_solo'
 *
 * They have custom parameters:
 * - debug: whether to enable debug mode
 * - delegator: the delegator to use
 * - enableDelegation: whether to enable fee delegation
 */
const config: HardhatUserConfig = {
    solidity: {
        compilers: [
            {
                version: '0.8.20', // Specify the first Solidity version
                settings: {
                    // Additional compiler settings for this version
                    optimizer: {
                        enabled: true,
                        runs: 200
                    },
                    evmVersion: 'paris'
                }
            }
        ]
    },
    networks: {


        /**
         * Testnet configuration
         */
     
        vechain_testnet: {
           
            url: 'https://testnet.vechain.org',
            accounts: {
                mnemonic: 'denial kitchen pet squirrel other broom bar gas better priority spoil cross',
                count: 10,
                path: "m/44'/818'/0'/0",
            },
            gas: 10000000,
           
        } ,

        vechain_solo: {
           
            url: 'http://localhost:1231',
            accounts: {
                mnemonic: 'denial kitchen pet squirrel other broom bar gas better priority spoil cross',
                count: 10,
                path: "m/44'/818'/0'/0",
            },
            gas: 10000000,
           
        } ,
        /**
         * Default hardhat network configuration
         */
        hardhat: {
            // Testnet
            accounts: {
                mnemonic:
                    'vivid any call mammal mosquito budget midnight expose spirit approve reject system',
                    path: "m/44'/818'/0'/0/0",
                count: 3,
                initialIndex: 0
            },

        }
    }
};

export default config;