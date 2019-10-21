// Copyright Fuzamei Corp. 2018 All Rights Reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package types

//Collateralize op
const (
	CollateralizeActionCreate = 1 + iota
	CollateralizeActionBorrow
	CollateralizeActionRepay
	CollateralizeActionAppend
	CollateralizeActionFeed
	CollateralizeActionClose
	CollateralizeActionManage

	//log for Collateralize
	TyLogCollateralizeCreate    = 731
	TyLogCollateralizeBorrow    = 732
	TyLogCollateralizeRepay     = 733
	TyLogCollateralizeAppend    = 734
	TyLogCollateralizeFeed      = 735
	TyLogCollateralizeClose     = 736
)

// Collateralize name
const (
	CollateralizeX = "collateralize"
	CCNYTokenName = "ccny"
	CollateralizePreLiquidationRatio = 1.1 //TODO 预清算比例，抵押物价值跌到借出ccny价值110%的时候开始清算
)

//Collateralize status
const (
	CollateralizeStatusCreated = 1 + iota
	CollateralizeStatusClose
)

const (
	CollateralizeAssetTypeBty = 1 + iota
	CollateralizeAssetTypeBtc
	CollateralizeAssetTypeEth
)

const (
	CollateralizeUserStatusCreate = 1 + iota
	CollateralizeUserStatusWarning
	CollateralizeUserStatusSystemLiquidate
	CollateralizeUserStatusExpire
	CollateralizeUserStatusExpireLiquidate
	CollateralizeUserStatusClose
)