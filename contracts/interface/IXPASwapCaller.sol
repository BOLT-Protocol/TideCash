// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.4;

interface IXPASwapCaller {
    function XPASwapCall(address sender, uint amount0, uint amount1, bytes calldata data) external;
}