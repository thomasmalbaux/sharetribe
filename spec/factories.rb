Factory.define :person do |p|
  p.id "dMF4WsJ7Kr3BN6ab9B7ckF"
  p.is_admin 1
  p.locale "en"
end  

Factory.define :listing do |l|
  l.title "Sledgehammer"
  l.description("Test" * 1000)
  l.author { |author| author.association(:person) }
  l.listing_type "request"
  l.category "item"
  l.share_type ["buy", "borrow"]
  l.tag_list("tools, hammers")
  l.valid_until DateTime.now + 3.months
end

Factory.define :conversation do |c|
  c.title "Item request: Sledgehammer"
  c.association :listing
  c.status "pending"
end

Factory.define :message do |m|
  m.content "Test"
  m.association :conversation
  m.sender { |sender| sender.association(:person, :id => get_test_person_and_session("kassi_testperson1")[0].id) }
end

Factory.define :participation do |p|
  p.association :conversation
  p.association :person
  p.is_read false
  p.last_sent_at DateTime.now
end    