require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができる時' do
    it 'nameが空でなければ登録できること' do
      @user.name = 'test'
      @user.valid?
      expect(@user).to be_valid
    end

    it 'passwordが6文字以上、かつ半角英数字であれば登録できること' do
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      expect(@user).to be_valid
    end
  end



  context 'ユーザー新規登録ができない時' do
    it 'nameが空だと登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
  
    it '同じemailは登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
  
    it 'emailは@が含まれていないと登録できない' do
      @user.email = 'test.example'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
  
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
  
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  
    it 'passwordが半角英数字混合でなければ登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
  
    it 'passwordが半角数字のみの場合は登録できない' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  
    it 'passwordが全角の場合は登録できない' do
      @user.password = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    # it 'imageが空だと登録できない' do
    #   @user.image = nil
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("Image can't be blank")
    # end
  end
end
