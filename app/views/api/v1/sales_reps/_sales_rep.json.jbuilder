json.extract! sales_rep, :id, :name, :created_at, :updated_at
json.image sales_rep.image(:thumb)
json.role "Sales Representative" 
