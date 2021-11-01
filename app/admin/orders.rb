ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :number, :total, :state, :user_id, :shop_profile_id, :subtotal
  #
  # or
  #
  # permit_params do
  #   permitted = [:number, :total, :state, :user_id, :shop_profile_id, :subtotal]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :id
    column :subtotal
    column :state
  end

  form do |f|
    f.inputs 'Order' do
      f.input :id
      f.input :subtotal
      f.input :state
    end
    f.actions
  end

  
end
