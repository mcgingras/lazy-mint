# Lazy Minting NFTs
While working on another project, I came up with the need to expose a function that is publically callable, but whose params I want to be within a specific scope. Meaning -- I want anybody to be able to call the function, but I want to be able to set the range of acceptable values for a given param. However, I want the params to change from call to call -- I don't just want to hardcode an acceptable range. This is an alternative to lazy-minting NFTs, since I was struggling to figure out how Opensea actually lazy mints NFTs.

Note -- this isn't actually super hack proof.
Someone could look at the params to another NFT purchase and use the same params to mint an NFT that was technically already claimed. You can use it to prove that the an owner "agrees" a certain param is accetable, but curretly not sure how to prove that something is already claimed.

can also use this for saving gas on bids? (maybe, need to think it through a bit more...)
