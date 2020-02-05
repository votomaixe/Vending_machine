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

class VendingMachine
  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize

    @slot_money = 0
  end

  def current_slot_money

    return @slot_money
  end

  def slot_money(money)
    if MONEY.include?(money) == true
      @slot_money = @slot_money + money
    else
      return @slot_money
    end
  end

  def return_money
    @slot_money = 0
    return @slot_money
  end

  def coke_buy
    st = Stock.new
    if current_slot_money >= 120
      @sales = 0
      coke_count = st.coke_count
      coke_price = st.coke_price

      coke_count-=1
      st.drink_stock[:coke][:count] = coke_count
      @sales += 120
      current_slot_money -= 120
    else
    end
  end
end








def add_stock
  st.drink_stock[:water] = {price:100, count:5}
  st.drink_stock[:redbull] = {price:200, count:5}
end


def judgement
  redbull_count = drink_stock[:redbull][:count]
  water_count = drink_stock[:water][:count]
  if vm.current_slot_money >=200 && redbull_count != 0 && coke_count != 0 && water_count != 0
    puts "購入可能品：レッドブル、コーラ、水"
  elsif vm.current_slot_money >=200 && redbull_count != 0 && coke_count != 0 && water_count == 0
    puts "購入可能品：レッドブル、コーラ"
  elsif vm.current_slot_money >=200 && redbull_count != 0 && coke_count == 0 && water_count != 0
    puts "購入可能品：レッドブル、水"
  elsif vm.current_slot_money >=200 && redbull_count != 0 && coke_count == 0 && water_count == 0
    puts "購入可能品：レッドブル"
  elsif vm.current_slot_money >= 120 && coke_count != 0 && water_count != 0
    puts "購入可能品：コーラ、水"
  elsif vm.current_slot_money >= 120 && coke_count != 0 && water_count == 0
    puts "購入可能品：コーラ"
  elsif vm.current_slot_money >=100 &&  water_count != 0
    puts "購入可能品：水"
  else
    puts "購入可能品：なし"
  end
end

# irb
# st = Stock.new
# vm = VendingMachine.new

# お金を入れる処理
# vm.slot_money(500)
# 金額の確認
# p vm.current_slot_money
