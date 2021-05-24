class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '食事' },
    { id: 3, name: 'ドライブ' },
    { id: 4, name: '体験型' },
    { id: 5, name: '鑑賞' },
    { id: 6, name: '観光' },
    { id: 7, name: 'イベント' },
    { id: 8, name: 'ツアー' },
    { id: 9, name: 'その他' }
  ]

end
