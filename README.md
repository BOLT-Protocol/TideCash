# TideCash
Smart Contract for Stable Token

## 用戶操作流程
1. 存入 10,000 XPA 與 10,000 Crebit 至 TideStake
2. 30 日後取得 250 TIC 與 500 TIB
3. 存入 250 TIS 與 250 TIB 至 TideStake
4. 30 日後取得 25 TIC
5. 5 日後 1 TIC = 0.9 USDT，以 100 TIB 換取 100 TIC
6. 5 日後 1 TIC = 1.1 USDT，以 100 TIC 換取 100 TIB，同時因 TIC 溢價規則於 TideStake 取得 2.5 TIC


## XPASwap
作為 TideCash 各機制匯率來源，參考 uniswap 機制，可自訂交易對與執行換匯功能
- getTotalPair 取得目前交易對數量
- getPairAddress 根據交易對序號取得交易對地址
- getPairDetail 根據交易對地址取得交易對資訊
- getPrice 指定幣種取得匯率資訊

- createPair 建立交易對，根據兩種幣存放數量決定初始匯率
- depositPair 提供交易對流通數，並取得交易對持股
- withdraw 銷毀持股並根據比例取出交易對資產


## TideStake
鎖倉功能合約，同時也是 TIS、TIB、TIC 管理合約，根據規範發行 TIS、TIB、TIC 並進行空投，每 30 日發行量縮減為 75%，當 TIC > 1.1 USD 時每 24 小時增發 10% TIC 並分配給 TIS 鎖倉戶
- getBalance 取得指定幣種非鎖倉帳戶餘額
- getLockBalance 取得指定幣種鎖倉帳戶餘額
- getTotalPlan 取得支援的幣種總數
- getPlanAddress 根據幣種序號取得幣種地址
- getPlanDetail 取得定存專案幣種、最低定存額度、最高定存額度、配息、鎖倉期等資訊
- deposit 指定專案進行定存
- withdraw 提出合約內非鎖倉資產

- addCurrency 新增支援幣種
- removeCurrency 移除支援幣種
- setMaxStake 設定最小定存金額
- setMinStake 設定最大定存金額
- setInterest 設定利息與配息幣種
- airdrop 根據特定幣種定存比例空投


## TideBoardroom
TideWallet、XPA、Crebit 等服務所有更新皆需經 TideBoardroom 進行投票表決，超過半數同意後才進行實裝；所有合約內所倉資產存放於 TideStake，並將其中 80% 利息分配給鎖倉用戶
- getTotalProposal 取得所有議案數量
- getProposalDetal 取得議案細節，包含原始文件於 IPFS 路徑
- getBalance 取得餘額
- getLockBalance 取得鎖定餘額

- createProposal 鎖倉 TIS 建立新議案，須提供IPFS原文資料路徑，並設定表決期限，預設為 100,000 Block，若提案通過將支付鎖倉期間 TIC 利息，若提案不通過則沒收 10% 鎖倉金額
- vote 指定抵押 TIS 數量進行投票，鎖倉期間將支付TIC利息
- withdraw 提領解鎖貨幣


## TideShare
符合 ERC-777 規範的 Token 合約，總發行量為 750,000
- authorizeOperator
- revokeOperator
- send
- operatorSend
- burn
- operatorBurn
- transfer
- transferFrom
- approve
- allowance


## TideBond
符合 ERC-777 規範的 Token 合約，總發行量為 750,000
- authorizeOperator
- revokeOperator
- send
- operatorSend
- burn
- operatorBurn
- transfer
- transferFrom
- approve
- allowance


## TideCash
符合 ERC-777 規範的 Token 合約，無發行上限，操作受限於 TideStake、XPASwap 數值
- authorizeOperator
- revokeOperator
- setUnit 指定 USD 參考價值 Token，可指定為 USX 或 USDT
- swap 當 1 TIC > 1 USD 時存入 TIB 換取等量 TIC，當 1 TIC < 1 USD 時存入 TIC 換取等量 TIB
- send
- operatorSend
- burn
- operatorBurn
- transfer
- transferFrom
- approve
- allowance
