class User < ApplicationRecord
    # review2-2の重複ユーザの排除を追加
    validates :name, presence: true, length: { maximum: 50 }
    validates :name, uniqueness:true
    has_secure_password
    
    has_many :tasks
end
