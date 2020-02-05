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
      # puts "#{money}を投入"
      @slot_money = @slot_money + money
    else
      # puts "無効なお金です"
      # puts "投入した#{money}円をそのまま返却"
      return @slot_money
    end
  end
  def return_money
    # puts "#{@slot_money}円を返却します"
    @slot_money = 0
    return @slot_money
  end
end

# ここからはクラスに出来なかった...
st = Stock.new
vm = VendingMachine.new
sales = 0
coke_count = st.coke_count
coke_price = st.coke_price
vm.slot_money(500)
p vm.current_slot_money
if vm.current_slot_money >= 120
  current_slot_money = vm.current_slot_money
  coke_count-=1
  st.drink_stock[:coke][:count] = coke_count
  sales += 120
  current_slot_money -= 120
  # puts "売上金額#{sales}"
  # puts "残高#{current_slot_money}"
else
  # puts "売上金額#{sales}"
  # puts "残高#{current_slot_money}"
end
st.drink_stock[:water] = {price:100, count:5}
st.drink_stock[:redbull] = {price:200, count:5}
drink_stock = st.drink_stock
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
