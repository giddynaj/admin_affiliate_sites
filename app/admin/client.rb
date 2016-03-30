ActiveAdmin.register Client do
  permit_params :name, :base_url

  sidebar "Client Details", only: [:show] do
    ul do
      li link_to "Client Versions",    admin_client_client_versions_path(client)
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :base_url
    actions
  end

  filter :name
  filter :base_url

  form do |f|
    f.inputs "Client Details" do
      f.input :name
      f.input :base_url
    end
    f.actions
  end

end
