

role = {
  :system => {
    :administrator => true
  }
}

admin_role = Role.create!(
  :name        => ROLE_NAME[:admin],
  :title       => 'Administrator',
  :description => 'Role for administrator',
  :the_role    => role.to_json
)

role = {
  :passwords => {
    :update => true 
  },
  :members => {
    :index => true,
    :search => true 
  },
  :group_loan_products => {
    :index => true ,
    :search => true 
  },
  :group_loans => {
    :index => true, 
    :create => true,
    :update => true,
    :destroy => true,
  },
  :group_loan_memberships => {
    :search => true ,
    :index => true, 
    :create => true,
    :update => true,
    :destroy => true,
    :deactivate => true 
  },
  :group_loan_weekly_collections => {
    :search => true ,
    :index => true, 
    :create => true,
    :update => true,
    :destroy => true,
    :collect => true,
    :uncollect => true 
  },
  
  :group_loan_weekly_uncollectibles => {
    :search => true ,
    :index => true, 
    :create => true,
    :update => true,
    :destroy => true,
    :clear => true,
    :collect => true,
  },
  :group_loan_premature_clearance_payments => {
    :search => true ,
    :index => true, 
    :create => true,
    :update => true,
    :destroy => true 
  },
  
  :savings_entries => {
    :search => true ,
    :index => true, 
    :create => true,
    :update => true,
    :destroy => true 
  }
}


data_entry_role = Role.create!(
  :name        => ROLE_NAME[:data_entry],
  :title       => 'Data Entry',
  :description => 'Role for data_entry',
  :the_role    => role.to_json
)

# create the user
  admin = User.create_main_user(  :name => "Admin", :email => "admin@gmail.com" ,
            :password => "willy1234", :password_confirmation => "willy1234") 
  admin.set_as_main_user
  


  data_entry1 = User.create_object(:name => "Data Entry", :email => "data_entry1@gmail.com", 
                :password => 'willy1234', 
                :password_confirmation => 'willy1234',
                :role_id => data_entry_role.id )
              
  data_entry1.password = 'willy1234'
  data_entry1.password_confirmation = 'willy1234'
  data_entry1.save