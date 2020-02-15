namespace :admin_user do
  desc 'Crete admin user'
  task :create, ['email', 'password'] => :environment do |task, args|
    unless args[:email] and args[:password]
      puts 'usage: rake admin_user:create[yourmail@sample.com,yourpasword]'
      exit
    end

    if AdminUser.create!(email: args[:email], password: args[:password], password_confirmation: args[:password])
      puts 'Created admin user!'
    end
  end
end
