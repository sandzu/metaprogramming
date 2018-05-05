require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    if @columns.nil?
      db = DBConnection.execute2(<<-END)
        SELECT 
          * 
        FROM 
          #{self.table_name} 
      END
      
      @columns = db.first.dup 
    end 
    @columns.map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) do 
        
      end 
    end 
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end
    
  def self.table_name
  @table_name ||= self.convert_to_snake_case(self.to_s + 's')
    @table_name
  end
  
  def self.convert_to_snake_case(text)
    return_val = ""
    text.each_char.with_index do |char,idx|
      unless idx == 0
        return_val << "_" if char == char.upcase
      end
      return_val << char.downcase
    end  
    return_val
  end
  
  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    @attributes ||= Hash.new
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
