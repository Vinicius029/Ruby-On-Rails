class Coin < ApplicationRecord
    belongs_to  :mining_type # Coin vai conversa com MiningType
end
