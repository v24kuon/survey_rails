Admin.find_or_create_by(id: 1) do |admin|
  admin.email = "a@a.com"
  admin.password = "aaaaaa"
end
