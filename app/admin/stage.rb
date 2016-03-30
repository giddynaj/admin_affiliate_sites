ActiveAdmin.register Stage do
  belongs_to :client_version, shallow: true
  permit_params :name, :client_id, :client_version_id, :layout_name, :sequence, :form_field_group_id

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  form do |f|
    f.inputs "Stage Details" do
      f.input :name
      f.input :client_id
      f.input :client_version_id
      f.input :layout_name
      f.input :sequence
      f.input :form_field_group_id
    end
    f.actions
  end

end
