// Copyright 2015 The go-ethereum Authors
// This file is part of the go-ethereum library.
//
// The go-ethereum library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The go-ethereum library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the go-ethereum library. If not, see <http://www.gnu.org/licenses/>.

package params

// MainnetBootnodes are the enode URLs of the P2P bootstrap nodes running on
// the main CommerciumX network.
var MainnetBootnodes = []string{
        "enode://19d8b13cad133adf51c12775101df186f2239d49a2cf3be1733a2177cc77799a485b538e0fbe97b12f1a99539cc95461058f3690925f449130a8bd68b1873b74@139.99.118.17:2019",
        "enode://3477445b54864481c37910a1dae7fa8db3b2ec85f19d6667c57091a3ea4bf21ca5de328563b948ab0c5c428dd4b999f91f28566628e43d191c6d593adb0f1857@206.189.77.7:2019",
	"enode://f6a04949d220a227e747e0eb2ac2a0bdcfaf4dcd1ab8764df1aeab0752276d842a167af12e37e2a93fd2d70a61144433600a53f63caee3342db88271a8eb7a5b@46.101.226.138:2019",
}

// TestnetBootnodes are the enode URLs of the P2P bootstrap nodes running on the
// Ropsten test network.
var TestnetBootnodes = []string{
}

// RinkebyBootnodes are the enode URLs of the P2P bootstrap nodes running on the
// Rinkeby test network.
var RinkebyBootnodes = []string{
}

// DiscoveryV5Bootnodes are the enode URLs of the P2P bootstrap nodes for the
// experimental RLPx v5 topic-discovery network.
var DiscoveryV5Bootnodes = []string{
        "enode://19d8b13cad133adf51c12775101df186f2239d49a2cf3be1733a2177cc77799a485b538e0fbe97b12f1a99539cc95461058f3690925f449130a8bd68b1873b74@139.99.118.17:2019",
        "enode://3477445b54864481c37910a1dae7fa8db3b2ec85f19d6667c57091a3ea4bf21ca5de328563b948ab0c5c428dd4b999f91f28566628e43d191c6d593adb0f1857@206.189.77.7:2019",
        "enode://f6a04949d220a227e747e0eb2ac2a0bdcfaf4dcd1ab8764df1aeab0752276d842a167af12e37e2a93fd2d70a61144433600a53f63caee3342db88271a8eb7a5b@46.101.226.138:2019",
}
