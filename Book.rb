class Book
    @@on_shelf=[]
    @@on_loan=[]

    def initialize(title,author,isbn)
        @title=title
        @author=author
        @isbn=isbn
        @due_date=nil
    end

    attr_accessor:due_date

    def self.create(title,author,isbn)
        new_book=Book.new(title,author,isbn)
        @@on_shelf<<new_book
        return new_book
    end

    def self.available
        return @@on_shelf
    end

    def self.borrowed
        return @@on_loan
    end

    def self.browse
        return @@on_shelf.sample
    end

    def current_due_date
        return Time.now+1814400
    end
    
    def lent_out?
        @@on_shelf.each do |n|
            if n==self
                return false
            end
        end
        return true
    end

    def borrow
        unless lent_out?
            @due_date=current_due_date
            @@on_shelf.delete(self)
            @@on_loan<<self
            return true
        else
            return false
        end
    end

    def return_to_library
        if lent_out?
            @due_date=nil
            @@on_loan.delete(self)
            @@on_shelf<<self
            return true
        else
            return false
        end
    end

    def self.overdue
        late=[]
        @@on_loan.each do |book|
            if book.due_date<Time.now
                late<<book
            end
        end
        return late
    end
end

sister_outsider = Book.create("A", "A", "1")
aint_i = Book.create("B", "B", "2")
if_they_come = Book.create("C", "C", "3")
puts Book.browse.inspect 
puts Book.browse.inspect 
puts Book.browse.inspect 
puts Book.available.inspect 
puts Book.borrowed.inspect 
puts sister_outsider.lent_out? 
puts sister_outsider.borrow 
puts sister_outsider.lent_out? 
puts sister_outsider.borrow
puts sister_outsider.due_date 
puts Book.available.inspect 
puts Book.borrowed.inspect 
puts Book.overdue.inspect 
puts sister_outsider.return_to_library 
puts sister_outsider.lent_out? 
puts Book.available.inspect
puts Book.borrowed.inspect