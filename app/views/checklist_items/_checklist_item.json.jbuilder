json.extract! checklist_item, :id, :checklist_id, :description, :is_done, :created_at, :updated_at
json.url checklist_item_url(checklist_item, format: :json)
