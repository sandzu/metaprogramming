class AttrAccessorObject
   
  def self.my_attr_accessor(*names)
     names.each do |name|
        define_method name do
          instance_variable_get("@"+name.to_s)
        end
        
        define_method "#{name}=" do |var|
           instance_variable_set("@"+name.to_s,var) 
        end
  
      end 
  end 
  
  
  # def self.my_attr_accessor(*names)
  #    names.each do |name|
  #      here_doc = <<-END 
  #        def #{name} 
  #          @#{name}
  #        end 
  # 
  #        def #{name}=(var)
  #          @#{name} = var
  #        end 
  #      END
  #       class_eval(here_doc)
  #     end 
  # end 

  
  
end


