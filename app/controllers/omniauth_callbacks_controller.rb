class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter #twitterメソッドを定義
      @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))

      if @user.persisted? #ユーザー情報が保存されているかチェック
        sign_in_and_redirect @user #登録確認できればログイン
      else
        session["devise.user_attributes"] = @user.attributes #違う場合登録ページに移動
        redirect_to new_user_registration_url
      end
  end
end
