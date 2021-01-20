json.extract! timesheet, :id, :date, :hours, :created_at, :updated_at
json.url timesheet_url(timesheet, format: :json)
