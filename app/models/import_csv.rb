class ImportCsv < ApplicationRecord

  def self.users_data
    #インポートするファイルのパスを取得
    path = File.join Rails.root, "db/csv_data/csv_data.csv"
    #インポートするデータを格納するための配列
    list = []
    #CSVファイルからインポートするデータを取得し配列に格納
    CSV.foreach(path, headers: true) do |row|
      list << {
        name: row["name"],
        age: row["age"],
        address: row["address"]
      }
    end

    puts "インポート処理を開始".red
    begin
      #トランザクション
      User.transaction do
        #例外が発生する可能性のある処理
        User.create!(list)
      end
      #正常に動作した場合の処理
      puts "インポート完了!!".green
      #例外処理
    rescue ActiveModel::UnknownAttributeError => invalid
      #例外が発生した場合
      #インポートできなかった場合の処理
      puts "インポートに失敗: #{invalid}".red
    end
  end
end
