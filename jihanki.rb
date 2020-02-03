# 実行例
# irb
# require '/Users/shibatadaiki/work_shiba/full_stack/sample.rb'
# （↑のパスは、自動販売機ファイルが入っているパスを指定する）
# 初期設定（自動販売機インスタンスを作成して、vmという変数に代入する）
# vm = VendingMachine.new
# 作成した自動販売機に100円を入れる
# vm.slot_money (100)
# 作成した自動販売機に入れたお金がいくらかを確認する（表示する）
# vm.current_slot_money
# 作成した自動販売機に入れたお金を返してもらう
# vm.return_money
class VendingMachine
  # ステップ０　お金の投入と払い戻しの例コード
  # ステップ１　扱えないお金の例コード
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze
  # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
  end
  # 投入金額の総計を取得できる。
  def current_slot_money
    # 自動販売機に入っているお金を表示する
    # puts "合計投入金額#{@slot_money}円"
    return @slot_money
  end
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  # 投入は複数回できる。
  def slot_money(money)
    if MONEY.include?(money) == true
      puts "#{money}を投入"
      @slot_money = @slot_money + money
    else
      puts "無効なお金です"
      puts "投入した#{money}円をそのまま返却"
      return @slot_money
    end
  end
  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    # 返すお金の金額を表示する
    puts "#{@slot_money}円を返却します"
    # 自動販売機に入っているお金を0円に戻す
    @slot_money = 0
    return @slot_money
  end
end

# step2:ジュースの管理
class Stock

  def initialize
    @drinks = {coke:{price: 120, count: 5}}
  end

  def drink_stock
    @drinks
  end

  def coke_price
    @drinks[:coke][:price]
  end

  def coke_count
    return @drinks[:coke][:count]
  end
end
# step2ここまで

# step3:購入処理（以下は新しいクラスに設定すべき？例：Purchase）
st = Stock.new
vm = VendingMachine.new
sales = 0
coke_count = st.coke_count
coke_price = st.coke_price

# お金を入れる処理
vm.slot_money(500)
# 金額の確認
p vm.current_slot_money

# コーラを買う処理（例えばcoke_buyメソッドにするとか？）
if vm.current_slot_money >= 120
  current_slot_money = vm.current_slot_money
  coke_count-=1
  st.drink_stock[:coke][:count] = coke_count
  sales += 120
  current_slot_money -= 120
  puts "売上金額#{sales}"
  puts "残高#{current_slot_money}"
else
  puts "売上金額#{sales}"
  puts "残高#{current_slot_money}"
end
# step3ここまで

# step4ここから
st.drink_stock[:water] = {price:100, count:5}
st.drink_stock[:redbull] = {price:200, count:5}
drink_stock = st.drink_stock

# 冗長なため以下は未完成。（レッドブル、コーラ）、（レッドブル、水）、（レッドブルのみ）、（コーラのみ）の場合分けがない
# 記述が多くて面倒、新しい商品が追加される度コードの記述が増える問題
redbull_count = drink_stock[:redbull][:count]
water_count = drink_stock[:water][:count]
if vm.current_slot_money >=200 && redbull_count != 0 && coke_count != 0 && water_count != 0
  puts "購入可能品：レッドブル、コーラ、水"
elsif vm.current_slot_money >= 120 && coke_count != 0 && water_count != 0
  puts "購入可能品：コーラ、水"
elsif vm.current_slot_money >=100 &&  water_count != 0
  puts "購入可能品：水"
else
  puts "購入可能品：なし"
end
