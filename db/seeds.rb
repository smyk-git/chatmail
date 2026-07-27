# Demo data for local development and interview walkthroughs.
# Idempotent: safe to run repeatedly via `bin/rails db:seed`.

demo = User.find_or_create_by!(email: "demo@chatmail.dev") do |user|
  user.name = "Demo User"
  user.password = "password123"
end

ada = User.find_or_create_by!(email: "ada@chatmail.dev") do |user|
  user.name = "Ada Lovelace"
  user.password = "password123"
end

conversation = Conversation.find_or_create_by!(subject: "Welcome to chatmail") do |record|
  record.user_id = demo.id
end

[ demo, ada ].each do |user|
  conversation.users << user unless conversation.users.exists?(user.id)
end

[
  [ demo, "Hello Ada, welcome to chatmail!" ],
  [ ada,  "Hi Demo — thanks. The real-time updates are neat." ],
  [ demo, "Every message is scored by the chatmail-analyzer microservice." ]
].each do |author, body|
  next if conversation.messages.exists?(body: body)

  conversation.messages.create!(body: body, user: author)
end

puts "Seeded demo account -> demo@chatmail.dev / password123"
