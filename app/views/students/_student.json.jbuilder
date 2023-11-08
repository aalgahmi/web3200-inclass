json.extract! student, :id, :wno, :name, :major, :created_at, :updated_at
json.url student_url(student, format: :json)
