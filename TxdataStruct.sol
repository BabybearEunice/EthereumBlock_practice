type txdata struct{
  Accountance        uint64
  Price              *big.Int
  GasLimit           uint64
  Recipient          *common.Address
  Amount             *big.Int   
  Payload            []byte
  
}
