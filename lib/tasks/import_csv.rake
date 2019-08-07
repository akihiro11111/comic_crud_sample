namespace :import_csv do
  # rake import_csv:users
  desc "User CSVデータのインポート"

  task users: :environment do
    User.users_data
  end

end
