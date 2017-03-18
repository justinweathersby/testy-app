json.extract! service_rep, :id, :name, :created_at, :updated_at
json.image service_rep.image(:thumb)
json.role "Service Representative" 
