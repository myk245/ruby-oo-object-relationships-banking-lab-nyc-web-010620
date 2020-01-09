class Transfer
  attr_reader :sender, :receiver, :status, :amount
  attr_writer :status

  def initialize(sender, receiver, amount) 
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @executed = false
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    unless @executed 
      @executed = true 
      if self.valid? && @sender.balance >= self.amount 
        @sender.balance -= self.amount 
        @receiver.balance += self.amount 
        @status = "complete"
      else 
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end 
    end 
  end

  def reverse_transfer
    if @status == "complete" 
 
    @sender.balance += self.amount 
    @receiver.balance -= self.amount 
    @status = "reversed"
    end 
  end 

end
