namespace :import_csv do
  # rake import_csv:users
  desc "User CSVデータのインポート"

  task users: :environment do
    ImportCsv.users_data
  end

end
