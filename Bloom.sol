func CreateBloom(receipts Receipts) Bloom{
  bin := new(big.Int)
  for _, receipt := range receipts{
    bin.Or(bin, LogsBloom(receipt.Logs))
  }
  
  return BytesToBloom(bin.Bytes())
}


func LogsBloom(logs []*Log) *big.Int{
  bin := new(big.Int)
  for _, log := range logs{
    bon.Or(bin, bloom9(log.Address.Bytes()))
    for _, b := range log.Topics{
      bin.Or(bin, bloom9(b[:]))
    }
  }
  
  return bin
}


func bloom9(b []byte) *big.Int{
  b = crypto.Keccak256(b[:])
  r := new(big.Int)
  
  for i := 0; I<6; i +=2{
    t := big.NewInt(1)
    b := (uint(b[i+1])) + (uint(b[i])) << 8)) & 2047
    r.Or(r, t.Lsh(t, b))
  }

  return r
}


//Look up bloom
func BloomLookUp(bin Bloom, topic bytesBacked) bool{
  bloom := bin.Big()
  cmp:= bloom9(topic.Bytes()[:])
  
  return bool.And(bloom, cmp).Cmp(cmp) == 0

}




