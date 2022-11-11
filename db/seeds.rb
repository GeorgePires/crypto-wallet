# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

coins = [
  {
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://www.svgrepo.com/show/354819/bitcoin.svg"
  },
  {
    description: "Ethereum",
    acronym: "ETH",
    url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZCRfwkqpPvFb3QmmwGONG2i6PsgnqZ3L7dRzCNlaSTB1-ruu5"
  },
  {
    description: "Dash",
    acronym: "DASH",
    url_image: "https://ih1.redbubble.net/image.406055498.8711/ap,550x550,12x12,1,transparent,t.png"
  },
  {
    description: "Iota",
    acronym: "IOT",
    url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png"
  },
  {
    description: "ZCash",
    acronym: "ZEC",
    url_image: "https://www.cryptocompare.com/media/351360/zec.png"
  },
]

coins.each do |coin|
  Coin.find_or_create_by!(coin)
end
