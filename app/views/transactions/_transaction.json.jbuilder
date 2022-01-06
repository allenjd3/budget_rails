json.extract! transaction, :id, :name, :item_id, :spent, :spent_date, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
