json.extract! topic, :id, :title, :content, :created_at, :updated_at
json.url topic_url(topic, format: :json)