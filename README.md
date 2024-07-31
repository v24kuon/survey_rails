# 要件定義

## 管理者

・新規登録は画面上では不可<br>
・email フィールド とパスワードフィールドが表示される<br>
・email とパスワードでログイン<br>
・ログイン後は admins_surveys_path へリダイレクト<br>
・ログアウト後は root_path にリダイレクト<br>
・上記はテスト済み

## アンケート

### 管理者側

・CRUD 作成完了(URL 設定完了)<br>
・アンケートのタイトルと説明の入力は必須<br>
・上記はテスト済み<br>
・アンケートの質問テーブルはアンケート入力画面で入力<br>
・アンケートのタイトルと回答の形式(text,email 等の input の type)を入力する<br>
・アンケート詳細画面で紐づいた質問が確認できる<br>
・今回追加した質問の入力、表示に関してテスト作成が必要


### ユーザー側

・トップページ、一覧ページ、詳細ページ作成<br>
・表示テスト済み

## メモ

```
surveys GET    /surveys(.:format)    surveys#index
survey GET    /surveys/:id(.:format) surveys#show
admins_surveys GET /admins/surveys(.:format)  admins/surveys#index
POST   /admins/surveys(.:format)  admins/surveys#create
new_admins_survey GET    /admins/surveys/new(.:format)   admins/surveys#new
edit_admins_survey GET    /admins/surveys/:id/edit(.:format)   admins/surveys#edit
admins_survey GET    /admins/surveys/:id(.:format)   admins/surveys#show
PATCH  /admins/surveys/:id(.:format)   admins/surveys#update
PUT    /admins/surveys/:id(.:format)   admins/surveys#update
DELETE /admins/surveys/:id(.:format)   admins/surveys#destroy
root GET    /   surveys#home
```
