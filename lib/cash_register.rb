class CashRegister
  attr_accessor :total, :transactions

  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @cart=[]
    @transactions =[]
  end

  def discount
    @discount
  end

  def add_item(title, price, quantity=1)
      @total+=(price*quantity)

      quantity.times do
        @cart << title
      end
      @transactions << price * quantity
  end

  def apply_discount
    if @discount != nil
      @total=@total- (@total*(@discount*0.01))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @cart
  end

  def void_last_transaction
    @total -= @transactions.pop
  end
end
