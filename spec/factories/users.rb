# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 8)
    nickname { "abe"  }
    email { Faker::Internet.email }
    password { password }
    password_confirmation { password }
  end
end



#

#
# password = Faker::Internet.password(min_length: 8)
# nickname { "abe"  }
# email { Faker::Internet.email }
# password { password }
# password_confirmation { password }
