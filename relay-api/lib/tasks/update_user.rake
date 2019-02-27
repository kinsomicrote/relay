namespace :update_user do
    desc "Updates user role"
  
    task :role_to_staff, [:user] => :environment do |t, args|
        user = User.find_by(name: args[:user])
        user.update(role: 'staff')
    end

    task :role_to_admin, [:user] => :environment do |t, args|
        user = User.find_by(name: args[:user])
        user.update(role: 'admin')
    end
end