# Cryptocurrency is all the rage. You have decided to create your own,
# KelloggCoin, that will massively disrupt financial markets at the Global
# Hub.

# Don't change the following code, which represents a series of transactions, each
# of which represents a transfer of KelloggCoin from one user to another – transactions 
# with no from_user are from the "ICO" (Initial Coin Offering)

blockchain = [
  { "from_user" => nil, "to_user" => "ben", "amount" => 20000 },
  { "from_user" => nil, "to_user" => "brian", "amount" => 20000 },
  { "from_user" => "ben", "to_user" => "evan", "amount" => 9000 },
  { "from_user" => "brian", "to_user" => "anthony", "amount" => 7000 },
  { "from_user" => "evan", "to_user" => "anthony", "amount" => 400 },
  { "from_user" => "ben", "to_user" => "anthony", "amount" => 1500 },
  { "from_user" => "anthony", "to_user" => "ben", "amount" => 4500 },
  { "from_user" => "anthony", "to_user" => "evan", "amount" => 1750 }
]

# Write code below that returns the number of KelloggCoin that each user has in their 
# KelloggCoin "wallet".

# It should print out:
# Ben's KelloggCoin balance is 14000
# Brian's KelloggCoin balance is 13000
# Evan's KelloggCoin balance is 10350
# Anthony's KelloggCoin balance is 2650

# 👇👇👇 Your code HERE 👇👇👇

# Step 1: Create an empty hash to store each user's balance
balances = {}

# Step 2: Loop through each transaction in the blockchain
blockchain.each do |transaction|
  # Step 3: Check if the receiver of coins ('to_user') already has a balance
  #         If not, start their balance at 0
  if balances[transaction["to_user"]].nil?
    balances[transaction["to_user"]] = 0
  end

  # Step 4: Increase the receiver's balance by the transaction amount
  balances[transaction["to_user"]] += transaction["amount"]

  # Step 5: Check if the sender of coins ('from_user') already has a balance
  #         (Skip if it's an ICO transaction, where 'from_user' is nil)
  if transaction["from_user"] && balances[transaction["from_user"]].nil?
    balances[transaction["from_user"]] = 0
  end

  # Step 6: Decrease the sender's balance by the transaction amount
  #         (Skip if it's an ICO transaction)
  if transaction["from_user"]
    balances[transaction["from_user"]] -= transaction["amount"]
  end
end

# Step 7: Print out each user's final balance
balances.each do |user, balance|
  puts "#{user}'s KelloggCoin balance is #{balance}"
end

# Refined Version ------------------

# # Initialize a hash to store the balance of each user
# balances = Hash.new(0)

# # Iterate through each transaction
# blockchain.each do |transaction|
#   # Decrease the balance of the sender if not an ICO
#   balances[transaction["from_user"]] -= transaction["amount"] if transaction["from_user"]
  
#   # Increase the balance of the receiver
#   balances[transaction["to_user"]] += transaction["amount"]
# end

# # Print out the balances
# balances.each do |user, balance|
#   puts "#{user.capitalize}'s KelloggCoin balance is #{balance}" unless user.nil?
# end