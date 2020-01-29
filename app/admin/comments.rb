ActiveAdmin.register Comment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :post_id, :name, :public, :content, :ipadress, :admin
  #
  # or
  #
  # permit_params do
  #   permitted = [:post_id, :name, :public, :content, :ipadress, :admin]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :post_id # 全カラム明示しないとなぜかこのカラムが表示されない
      f.input :name
      f.input :public
      f.input :content
      f.input :ipadress
      f.input :admin
    end
    f.actions
  end

end
