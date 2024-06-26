  class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
          enum role: {buyer: 0, seller: 1, }
          has_one :shop, dependent: :destroy
          has_one :cart, dependent: :destroy
        
    
            has_one :cart, dependent: :destroy
            has_many :orders, dependent: :destroy
            
            def has_shop?
    self.shop.present?
  end

          def buyer?
            role == 'buyer'
          end


          def seller?
            role == 'seller'
          end
  end
