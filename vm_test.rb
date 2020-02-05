# class Stock
#
#   def initialize
#     @drinks = {coke:{price: 120, count: 5}}
#   end
#
#   def drink_stock
#     @drinks
#   end
#
#   def coke_price
#     @drinks[:coke][:price]
#   end
#
#   def coke_count
#     @drinks[:coke][:count]
#   end
#
# end


class VendingMachine

  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @slot_money = 0
    @sale = 0
    @drinks = {coke:{price: 120, count: 5}}
  end

  def self.drink_stock
    @drinks
  end

  def coke_price
    @drinks[:coke][:price]
  end

  def coke_count
    @drinks[:coke][:count]
  end

  def current_slot_money
    @slot_money
  end

  def current_sale
    return @sale
  end

  def slot_money(money)
    if MONEY.include?(money) == true
      @slot_money = @slot_money + money
    else
      @slot_money
    end
  end

  def return_money
    @return_money = @slot_money
    @slot_money = 0
    return @return_money
  end

  def coke_buy
    if current_slot_money >= 120
      coke_count -=1
      drink_stock[:coke][:count] = coke_count
      @sale += 120
      @slot_money -= 120
    else
    end
  end
end

# irb
vm =VendingMachine.new
vm.slot_money(500)
p vm.current_slot_money
vm.coke_buy
p vm.current_sale
p vm.current_slot_money












# st.drink_stock[:water] = {price:100, count:5}
# st.drink_stock[:redbull] = {price:200, count:5}
# drink_stock = st.drink_stock
#
# redbull_count = drink_stock[:redbull][:count]
# water_count = drink_stock[:water][:count]
#
# if vm.current_slot_money >=200 && redbull_count != 0 && coke_count != 0 && water_count != 0
#   puts "購入可能品：レッドブル、コーラ、水"
# elsif vm.current_slot_money >=200 && redbull_count != 0 && coke_count != 0 && water_count == 0
#   puts "購入可能品：レッドブル、コーラ"
# elsif vm.current_slot_money >=200 && redbull_count != 0 && coke_count == 0 && water_count != 0
#   puts "購入可能品：レッドブル、水"
# elsif vm.current_slot_money >=200 && redbull_count != 0 && coke_count == 0 && water_count == 0
#   puts "購入可能品：レッドブル"
# elsif vm.current_slot_money >= 120 && coke_count != 0 && water_count != 0
#   puts "購入可能品：コーラ、水"
# elsif vm.current_slot_money >= 120 && coke_count != 0 && water_count == 0
#   puts "購入可能品：コーラ"
# elsif vm.current_slot_money >=100 &&  water_count != 0
#   puts "購入可能品：水"
# else
#   puts "購入可能品：なし"
# end
