require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it 'nicknameとemailとpasswordとpassword_confirmationとname_kanji_seiとname_kanji_meiとname_kana_seiとname_kana_meiとbirth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが5文字以下は登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it "passwordは英数字混合でないと登録できない" do
        @user.password = "000000"
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "名字が空だと登録できない" do
        @user.name_kanji_sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kanji sei can't be blank")
      end
      it "名前が空だと登録できない" do
        @user.name_kanji_mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kanji mei can't be blank")
      end
      it "名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.name_kanji_sei = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kanji sei is invalid")
      end
      it "名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.name_kanji_mei = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kanji mei is invalid")
      end
      it "フリガナ（名字）が空だと登録できない" do
        @user.name_kana_sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana sei can't be blank")
      end
      it "フリガナ（名前）が空だと登録できない" do
        @user.name_kana_mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana mei can't be blank")
      end
      it "名字のフリガナは全角（カタカナ）でなければ登録できない" do
        @user.name_kana_sei = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana sei is invalid")
      end
      it "名前のフリガナは全角（カタカナ）でなければ登録できない" do
        @user.name_kana_mei = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana mei is invalid")
      end
      it "生年月日が空だと登録できない" do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

    end
  end
end
