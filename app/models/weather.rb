class Weather < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '晴れ' },
    { id: 3, name: '曇り' },
    { id: 4, name: '雨' },
    { id: 5, name: '雪' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts
end
