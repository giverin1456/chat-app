FactoryBot.define do
  factory :room_user do
    association :user
    association :room
    # room,userとアソシエーションの関係があることを定義している
  end
end