func DeriveSha(list DerivableList) common.Hash{
  keybuf := new(bytes.Buffer)
  trie := new(trie.Trie)
  for i := 0; i < list.len(); i++{
    keybuf.Reset()
    rlp.Encode(keybuf, unit(i))
    trie.Update(keybuf.Bytes(), list.GetRlp(i))
  }
  return trie.Hash
}
