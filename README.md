# 要件定義

## ユーザー関連

### 管理者

・新規登録は画面上では不可<br>
・email とパスワードでログイン<br>
・ログイン後は admins_surveys_path へリダイレクト<br>
・ログアウト後は root_path にリダイレクト<br>
・ユーザー一覧は管理者のみ表示可能<br>
・ユーザ詳細は管理者も表示可能<br>
・上記はテスト済み

### ユーザー側
・新規登録時以下の項目で登録を行う<br>
　・会社名<br>
　・ブース名<br>
　・ブース詳細<br>
　・氏名<br>
　・電話番号<br>
　・メールアドレス<br>
　・郵便番号<br>
　・住所<br>
<br>
・email とパスワードでログイン<br>
・ログイン画面でパスワードリセット可能<br>
・userは自身の詳細情報のみ閲覧可能<br>
・userは自身の登録情報のみ編集可能
・テスト作成済み



## アンケート

### 管理者側

・アンケートを一覧表示できる<br>
・アンケートのCRUD 作成完了(URL 設定完了)<br>
・アンケートのタイトルと概要と説明の入力は必須<br>
・アンケートの質問は別ページではなくアンケート入力画面で入力<br>
・質問のタイトルと回答の形式(text,email 等の input の type)を入力する<br>
・質問の回答を必須にするか選択できる
・「追加ボタン」で動的に質問フォームを追加できる<br>
・「削除ボタン」で動的に質問フォームを削除できる<br>
・一部の回答形式(ラジオボタン等)は選択肢を動的に追加できる<br>
・アンケート詳細画面で紐づいた質問と選択肢が確認できる<br>
・上記はテスト作成済み

### ユーザー側

・トップページ、一覧ページ、詳細ページ作成<br>
・一覧ページ、詳細ページは登録ユーザーのみ閲覧可能<br>
・管理画面で入力された情報を元にアンケート作成<br>
・表示テスト済み<br>
・フォーム表示のテストまだ

## 回答

### 管理者側

## メモ

```
                        new_user_session GET    /users/sign_in(.:format)                                                                          devise/sessions#new
                            user_session POST   /users/sign_in(.:format)                                                                          devise/sessions#create
                    destroy_user_session DELETE /users/sign_out(.:format)                                                                         devise/sessions#destroy
                       new_user_password GET    /users/password/new(.:format)                                                                     devise/passwords#new
                      edit_user_password GET    /users/password/edit(.:format)                                                                    devise/passwords#edit
                           user_password PATCH  /users/password(.:format)                                                                         devise/passwords#update
                                         PUT    /users/password(.:format)                                                                         devise/passwords#update
                                         POST   /users/password(.:format)                                                                         devise/passwords#create
                cancel_user_registration GET    /users/cancel(.:format)                                                                           devise/registrations#cancel
                   new_user_registration GET    /users/sign_up(.:format)                                                                          devise/registrations#new
                  edit_user_registration GET    /users/edit(.:format)                                                                             devise/registrations#edit
                       user_registration PATCH  /users(.:format)                                                                                  devise/registrations#update
                                         PUT    /users(.:format)                                                                                  devise/registrations#update
                                         DELETE /users(.:format)                                                                                  devise/registrations#destroy
                                         POST   /users(.:format)                                                                                  devise/registrations#create
                                    user GET    /users/:id(.:format)                                                                              users#show
                                 surveys GET    /surveys(.:format)                                                                                surveys#index
                                  survey GET    /surveys/:id(.:format)                                                                            surveys#show
                       new_admin_session GET    /admins/sign_in(.:format)                                                                         admins/sessions#new
                           admin_session POST   /admins/sign_in(.:format)                                                                         admins/sessions#create
                   destroy_admin_session DELETE /admins/sign_out(.:format)                                                                        admins/sessions#destroy
                            admins_users GET    /admins/users(.:format)                                                                           admins/users#index
                             admins_user GET    /admins/users/:id(.:format)                                                                       admins/users#show
                          admins_surveys GET    /admins/surveys(.:format)                                                                         admins/surveys#index
                                         POST   /admins/surveys(.:format)                                                                         admins/surveys#create
                       new_admins_survey GET    /admins/surveys/new(.:format)                                                                     admins/surveys#new
                      edit_admins_survey GET    /admins/surveys/:id/edit(.:format)                                                                admins/surveys#edit
                           admins_survey GET    /admins/surveys/:id(.:format)                                                                     admins/surveys#show
                                         PATCH  /admins/surveys/:id(.:format)                                                                     admins/surveys#update
                                         PUT    /admins/surveys/:id(.:format)                                                                     admins/surveys#update
                                         DELETE /admins/surveys/:id(.:format)                                                                     admins/surveys#destroy
                         admins_question DELETE /admins/questions/:index(/:id)(.:format)                                                          admins/questions#destroy
                                         POST   /admins/questions/:index(.:format)                                                                admins/questions#create
                           admins_choice DELETE /admins/choices/:index(/:id)(.:format)                                                            admins/choices#destroy
                                         POST   /admins/choices/:index(.:format)                                                                  admins/choices#create
                                    root GET    /
```
