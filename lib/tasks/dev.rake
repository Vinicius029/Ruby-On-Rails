namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    
    if Rails.env.development?
      show_spinner("Apagando db...") {%x(rails db:drop:_unsafe)}
      
      show_spinner("Criando db...") {%x(rails db:create)}

      show_spinner("Migrando db...") {%x(rails db:migrate)}
      
      %x(rails dev:add_mining_type)
      %x(rails dev:add_coins)
      
    end
  end


  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas...") do
      coins = [
          {
              description: "Bitcoin",
              acronym: "BTC",
              url_image: "https://th.bing.com/th/id/R.b32e86bd5b437e544432d6bd0d109dce?rik=Wmjvbreae5vekQ&pid=ImgRaw&r=0",
              mining_type: MiningType.find_by(acronym: "PoW")
          
          },
          {
              description: "Ethereum",
              acronym: "ETH",
              url_image: "https://cdn.freebiesupply.com/logos/large/2x/ethereum-1-logo-png-transparent.png",
              mining_type: MiningType.all.sample
          
          },
          {
          
              description: "Dash",
              acronym: "DASH",
              url_image: "https://persistencemining.com/images/rel-images/Dash-logo-transparent.png",
              mining_type: MiningType.all.sample
          
          }
      ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastro de tipos de mineração"
  task add_mining_type: :environment do
    show_spinner("Cadastrando tipo de minerações...") do
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "Po"}
      ]

      mining_types.each do |mining|
        MiningType.find_or_create_by!(mining)
      end
    end
  end
  
  
  def show_spinner(msg_star, msg_end = 'Conclído!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_star}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
