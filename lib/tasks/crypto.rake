if Rails.env.development?
  namespace :crypto do
    desc "Configura o ambiente de desenvolvimento"
    task setup: :environment do
      show_msg_spinner("Dropped database..") { %x(rails db:drop) }
      show_msg_spinner("Created database..") { %x(rails db:create) }
      show_msg_spinner("Migrating..") { %x(rails db:migrate) }
    end
  end

  def show_msg_spinner(start)
    spinner = TTY::Spinner.new("[:spinner] #{start}")
    spinner.auto_spin
    yield
    spinner.success("(successful)")
  end
end
