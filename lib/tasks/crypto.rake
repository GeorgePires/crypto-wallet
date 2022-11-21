if Rails.env.development?
  namespace :crypto do
    desc "Configure development environment"
    task setup: :environment do
      puts "------> Setup"
      show_msg_spinner("Dropped database..") { %x(rails db:drop) }
      show_msg_spinner("Created database..") { %x(rails db:create) }
      show_msg_spinner("Migrating..") { %x(rails db:migrate) }
      %x(rails crypto:add_mining_types)
      %x(rails crypto:add_coins)
    end

    desc "Create Coins"
    task add_coins: :environment do
      show_msg_spinner("Created coins..") do
        coins = [
          {
            description: "Bitcoin",
            acronym: "BTC",
            url_image: "https://www.svgrepo.com/show/354819/bitcoin.svg",
            mining_type:  MiningType.find_by(acronym: 'PoW')
          },
          {
            description: "Ethereum",
            acronym: "ETH",
            url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZCRfwkqpPvFb3QmmwGONG2i6PsgnqZ3L7dRzCNlaSTB1-ruu5",
            mining_type: MiningType.all.sample
          },
          {
            description: "Dash",
            acronym: "DASH",
            url_image: "https://ih1.redbubble.net/image.406055498.8711/ap,550x550,12x12,1,transparent,t.png",
            mining_type: MiningType.all.sample
          },
          {
            description: "Iota",
            acronym: "IOT",
            url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png",
            mining_type: MiningType.all.sample
          },
          {
            description: "ZCash",
            acronym: "ZEC",
            url_image: "https://www.cryptocompare.com/media/351360/zec.png",
            mining_type: MiningType.all.sample
          },
        ]

        coins.each do |coin|
          Coin.find_or_create_by!(coin)
        end
      end
    end

    desc "Create Mining types"
    task add_mining_types: :environment do
      show_msg_spinner("Create Mining types..") do
        mining_types = [
          { description: "Proof of Work", acronym: "PoW" },
          { description: "Proof of Stake", acronym: "PoS" },
          { description: "Proof of Capacity", acronym: "PoC" },
        ]

        mining_types.each do |mining_type|
          MiningType.find_or_create_by!(mining_type)
        end
      end
    end
  end

  def show_msg_spinner(start)
    spinner = TTY::Spinner.new("[:spinner] #{start}")
    spinner.auto_spin
    yield
    spinner.success("(successful)")
  end
end
