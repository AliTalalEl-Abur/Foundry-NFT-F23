// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {MoodNft} from "../../src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {Test} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view{
        string memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAyNHB4IiBoZWlnaHQ9IjEwMjRweCIgdmlld0JveD0iMCAwIDEwMjQgMTAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4NCiAgPHBhdGggZmlsbD0iIzMzMyIgZD0iTTUxMiA2NC42Yy0yNDcuIDAtNDQ4IDEwMC42LTQ0OCAyMjQuNnY0MDEuNkg1MTJjMjA1LjQgMCAzNzItMTY2LjYgMzcyLTM3MnMtMTY2LjYtMzcyLTM3Mi0zNzJ6bTAtMjI0Yy0xMDEuOSAwLTE4NC40IDEyMi41LTE4NCAyMjQuNnY0MDEuNkg1MTJjMTAyLjEgMCAxODYuNy04NC42IDE4Ni43LTIwMS42IDAtMTI0LTEwMS42LTE4NC0yMjQuNnYtNDE2em0yNTYgNjYuNmMtNDkuOSAwLTkwLjEtNDAuMi05MC4xLTkwLjJzNDAuMi00MC4yIDkwLjEtNDAuMmM0OS45IDAuMSA5MCA0MC4yIDkwIDkwLjJ6Ii8+DQo8L3N2Zz4=";
        string memory svg = '<svg width="1024px" height="1024px" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg"><path fill="rgb(51, 51, 51)" d="M512 64.6C265 64.6 64 165.2 64 289.2v401.6h512V289.2c0-124-82.5-224.6-184-224.6zM0 708.2c0-101.9 82.5-184.4 184-184.4s184 82.5 184 184.4v401.6H0V708.2zM768 640c-49.9 0-90.1-40.2-90.1-90.2s40.2-40.2 90.1-40.2c49.9 0 90.1 40.2 90.1 90.2s-40.2 90.2-90.1 90.2z"/></svg>';
        string memory actualUri = deployer.svgToImageUri(svg);
        assert(keccak256(abi.encodePacked(actualUri)) == keccak256(abi.encodePacked(expectedUri)));
    }
    
}