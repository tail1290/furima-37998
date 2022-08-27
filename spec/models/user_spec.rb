require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameとemailとpasswordとpassword_confirmationとname_kanji_seiとname_kanji_meiとname_kana_seiとname_kana_meiとbirth_dayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end
end
