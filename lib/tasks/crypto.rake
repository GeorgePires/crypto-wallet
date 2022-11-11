if Rails.env.development?
  namespace :crypto do
    desc "Configura o ambiente de desenvolvimento"
    task setup: :environment do
      puts "------> Aplicando Configuração"
      system("rails db:drop db:create db:migrate db:seed")
    end
  end
end
