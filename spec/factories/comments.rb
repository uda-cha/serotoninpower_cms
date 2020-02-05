FactoryBot.define do
  factory :comment do
    post_id   { 'test' }
    sequence(:name) { |n| "tester_#{n}"}
    public    { true }
    content   { 'ThisIsTest' }
    ipadress  { '127.0.0.1' }
    admin     { false }
  end
end
