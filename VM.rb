#require '/Users/workspace/pair
# 継承やファイル分割の構想は断念したのでrequireは省略
class VendingMachine
  attr_accessor :slot_money
  MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize
    @slot_money = 0
    @inputmoney = 0
  end
  def opening1
    puts "お金を入れてください。#{MONEY}円が使えます。"
    @inputmoney = gets.chomp
      if @inputmoney == "10" || @inputmoney == "50" || @inputmoney == "100" ||@inputmoney =="500" || @inputmoney == "1000"
        @slot_money +=@inputmoney.to_i
        self.opening2
      else
        puts "そのお金は扱えません。"
        puts "------------------"
        return self.return_money
      end
  end
  def opening2
    puts "0: 続けてお金を入れる", "1: 売り物を見る", "2: ジュースを買う", "3: 投入金額の合計を見る", "4: お金を払い戻す"
    select = gets.chomp
      if select == "0"
        self.opening1
      elsif select == "1"
        puts "投入金額:#{@slot_money}円, 商品：#{stock.nedan}円、在庫#{stock.zaiko}本"
        puts "------------------"
        return self.opening2
      elsif select == "2"
        self.purchase
      elsif select == "3"
        self.current_slot_money
        puts "------------------"
        return self.opening2
      elsif select == "4"
        self.return_money
      else "0から4の数字を入力して下さい。"
        return self.opening2
      end
  end
# 以下、計算関係のメソッド
  def current_slot_money
    puts "現在の投入金額: #{@slot_money}円"
    puts "------------------"
    return self.opening2
  end
  def purchase
    if @slot_money> stock.nedan
      @slot_money -=stock.nedan
      stock.shukko
      puts "#{drinks[0]{"コーラ"}}を1本買いました。投入金額: #{@slot_money}円"
      puts "------------------"
      return self.opening2
    else
      puts "お金が足りません。投入金額: #{@slot_money}円"
      puts "------------------"
      return self.opening2
    end
  end
# 書いているうちに他の機能と組み合わせづらくなったのでボツにした
  # def slot_money(money)
  #   return false unless MONEY.include?(money)
  #   @slot_money += money
  # end
  def return_money
    puts "#{@inputmoney}円を返却します。"
    @inputmoney = 0
    puts "残額: #{@slot_money}円"
    puts "------------------"
    return self.opening1
    end
end
# drinksは配列内ハッシュじゃないほうが管理しやすいかった
class Stock
  def shukko
   drinks.delete[0]{:"コーラ"}
     if false == drinks.delete[0]{"コーラ"} || nil == drinks.delete[0]{:"コーラ"}
       puts "売り切れです。"
       return vm.opening2
     else
       return vm.opening2
     end
  end
  # def nyuko
  #
  #   end
  def nedan
    kakaku = drinks[0]{:"コーラ"}
    return kakaku
  end
  def zaiko
    nokori = drinks.count[0]{:"コーラ"}
    return nokori
  end
end
drinks = [ {"コーラ": 120},
           {"コーラ": 120},
           {"コーラ": 120},
           {"コーラ": 120},
           {"コーラ": 120} ]
# redbull, water はこのハッシュに後ろから追加する予定（暫定）
vm = VendingMachine.new
stock = Stock.new
puts vm.opening1
