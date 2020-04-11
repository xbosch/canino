import hashlib as hasher
import datetime as date


# Define CANINOs block
class Block:

  def __init__(self, index, timestamp, data, previous_hash):
    self.index = index
    self.timestamp = str(timestamp)
    self.data = data
    self.previous_hash = previous_hash
    self.hash = self.hash_block()
  
  def hash_block(self):
    sha = hasher.sha256()
    sha.update(str(self.index).encode("utf8") + str(self.timestamp).encode("utf8") + str(self.data).encode("utf8") + str(self.previous_hash).encode("utf8"))
    return sha.hexdigest()

# Generate genesis block
def create_genesis_block():
  # Manually construct Genesis block w arbitrary previous hash
  return Block(0, date.datetime.now(), "Caracoles de colores, amarillos, rojos e de todos los colorines", "112233445566778899")

# Generate blocks in the blockchain
def next_block(last_block):
  this_index = last_block.index + 1
  this_timestamp = date.datetime.now()
  this_data = "Hey! I'm block " + str(this_index)
  this_hash = last_block.hash
  this_block =Block(this_index, this_timestamp, this_data, this_hash)
  return this_block



if __name__ == "__main__":
      
  # Create the blockchain and add the genesis block
  blockchain = [create_genesis_block()]
  previous_block = blockchain[0]

  # Blocks after Genesis
  num_of_blocks_to_add = 200

  # Add blocks to the chain
  for i in range(0, num_of_blocks_to_add):
    block_to_add = next_block(previous_block)
    blockchain.append(block_to_add)
    previous_block = block_to_add
  # print ("Block %d has been added to the blockchain!"%block_to_add.index)
  # print ("Hash: %s \n"%block_to_add.hash) 

  print("== Displaying the whole Chain ==")
  for block in blockchain:
    print("%4d -> %s | data: %s"%(block.index, block.hash, block.data))  