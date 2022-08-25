# Use o rails dev:setup (app/lib/tasks/dev.rb)
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

coins = [
    {
        description: "Bitcoin",
        acronym: "BTC",
        url_image: "https://th.bing.com/th/id/R.b32e86bd5b437e544432d6bd0d109dce?rik=Wmjvbreae5vekQ&pid=ImgRaw&r=0"
    
    },
    {
        description: "Ethereum",
        acronym: "ETH",
        url_image: "https://cdn.freebiesupply.com/logos/large/2x/ethereum-1-logo-png-transparent.png"
    
    },
    {
    
        description: "Dash",
        acronym: "DASH",
        url_image: "https://persistencemining.com/images/rel-images/Dash-logo-transparent.png"
    
    }
]

coins.each do |coin|
    Coin.find_or_create_by!(coin)
end
puts "criando db"




=begin

Coin.create!(
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://th.bing.com/th/id/R.b32e86bd5b437e544432d6bd0d109dce?rik=Wmjvbreae5vekQ&pid=ImgRaw&r=0"
)

Coin.create!(
    description: "Ethereum",
    acronym: "ETH",
    url_image: "https://cdn.freebiesupply.com/logos/large/2x/ethereum-1-logo-png-transparent.png"
)

Coin.create!(
    description: "Dash",
    acronym: "DASH",
    url_image: "https://persistencemining.com/images/rel-images/Dash-logo-transparent.png"
)
=end
