func NewBlock(header *Header, txs []*Teansaction, uncles []*Header, receipts []*Receipt) *Block{
b := &Block{header: CopyHeader(header), td: new(big.Int)}

//panic if len(txs) != len(receipts)
if len(txs) == 0{
  b.header.TxHash = EmptyRootHash
}else{
  b.header.TxHash = DeriveSha(Transactions(txs))
  b.transactions =  make(Transactions(Txs))
  copy(b.transactions, txs)
}

if len(receipts == 0){
  b.header.ReceiptHash = EmptyRootHash
}else{
  b.header.ReceiptHash = DeriveSha(Receipts(receipts))
  b.header.Bloom = CreateBloom(receipts)
}

if len(uncles) == 0{
  b.header.UncleHash = EmptyRootHash
}else{
  b.header.UncleHash = DeriveSha(Receipts(receipts))
  b.Uncles = make([]*Header, len(uncles))
  for i := range uncles{
      b.uncles[i] = CopyHeader(uncles[i])
  }
}

return b







}
