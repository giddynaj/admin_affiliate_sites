ActiveAdmin.register ClientVersion do
  belongs_to :client, shallow: true
  permit_params :client_id, :description

  controller do
  @page_title = "#{}: Comments" # Sets the page title
  end


  index do
    selectable_column
    id_column
    column :client_id
    column :description
    actions
  end
  
  sidebar "Client Version Details", only: [:show] do
    ul do
      li link_to "Stages",    admin_client_version_stages_path(client_version)
    end
  end
end
