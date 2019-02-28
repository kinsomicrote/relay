# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative '../config/initializers/strongbolt'


admin_user1 = User.create( name: 'John Doe', role: 'admin' )
admin_user2 = User.create( name: 'Jane Doe', role: 'admin' )
staff_user1 = User.create(name: 'James Henry', role: 'staff')
staff_user2 = User.create(name: 'Jack Henry', role: 'staff')

admin_role  = Strongbolt::Role.create!(name: 'Admin Role')
admin_group = Strongbolt::UserGroup.create!(name: 'Admin Group',
  roles: [admin_role])

Strongbolt::Capability.models.each do |model|
  Strongbolt::Capability::Actions.each do |action|
    Strongbolt::Capability.create!(model: model, action: action, require_ownership: false,
      require_tenant_access: false, roles: [admin_role])
  end
end

staff_role  = Strongbolt::Role.create!(name: 'Staff Role')
staff_group = Strongbolt::UserGroup.create!(name: 'Staff Group',
  roles: [staff_role])
Strongbolt::Capability.create!(model: 'User', action: 'find', roles: [admin_role])
Strongbolt::Capability.create!(model: 'User', action: 'destroy', roles: [admin_role])

admin_user1.user_groups  << admin_group
admin_user2.user_groups  << admin_group
staff_user1.user_groups << staff_group
staff_user2.user_groups << staff_group