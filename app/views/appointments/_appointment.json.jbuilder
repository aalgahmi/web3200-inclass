json.extract! appointment, :id, :availability_id, :student_id, :kind, :on_date, :description, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
