//Trie is a Merkle Patricia Trie.

//Trie is not safe for concurrent use.
type Trie struct{
  db *Database
  root node
  originalRoot common.Hash
  
  //creqte generation values.
  cachegen, cachelimit uint16

}
