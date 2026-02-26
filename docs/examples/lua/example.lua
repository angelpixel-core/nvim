local User = {}
User.__index = User

function User.new(id, name)
  return setmetatable({ id = id, name = name }, User)
end

function User:greet()
  return "Hello, " .. self.name
end

local function find_by_id(users, id)
  for _, user in ipairs(users) do
    if user.id == id then
      return user
    end
  end
  return nil
end

local users = {
  User.new(1, "Ana"),
  User.new(2, "Rui"),
}

local selected = find_by_id(users, 2)
if selected then
  print(selected:greet())
end
