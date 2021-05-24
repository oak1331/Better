class Situation < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'アクティブ' },
    { id: 3, name: 'ゆっくり' },
    { id: 4, name: 'ロマンチック' },
    { id: 5, name: '特別' },
    { id: 6, name: 'ラフ' },
    { id: 7, name: 'その他' }
  ]

end
