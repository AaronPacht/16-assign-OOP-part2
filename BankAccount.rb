class BankAccount
    @@interest_rate=0.01
    @@accounts=[]
    
    def initialize
        @balance=0
    end
    
    attr_accessor:balance
    
    def self.create
        new_account=BankAccount.new
        @@accounts<<new_account
        return new_account
    end

    def self.total_funds
        total=0
        @@accounts.each do |account|
            total+=account.balance
        end
        return total
    end

    def self.interest_time
        @@accounts.each do |account|
            account.deposit(account.balance*(@@interest_rate))
        end
    end
    
    def deposit(num)
        @balance+=num
    end

    def withdraw(num)
        @balance-=num
    end
end

my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance
puts BankAccount.total_funds
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance 
puts your_account.balance 
puts BankAccount.total_funds 
BankAccount.interest_time
puts my_account.balance
puts your_account.balance 
puts BankAccount.total_funds 
my_account.withdraw(50)
puts my_account.balance
puts BankAccount.total_funds 