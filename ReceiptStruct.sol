//Receipt represents the result of a transaction.

type Receipt struct{
   //Consensus fields
   PostState              []byte
   Status                 uint64
   CumulativeGasUsed      uint64
   Bloom                  Bloom
   Logs                   []*Log
  
  //Implementation fields(don't recorder!)
  TxHash                  common.Hash
  ContractAddress         common.Address
  GasUsed                 uint64
}
