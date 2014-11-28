#!/usr/bin/ruby

# Set access levels of named methods

class MyClass
  def method1  # default is public
    #...
  end

protected      # subsequent methods will be protected
  def method2  # will be protected
    #...
  end

private        # subsequent methods will be private
  def method3  # will be private
    #...
  end

public         # subsequent methods will be public
  def method4
    #...       # will be public
  end
end

# Alternatively, you can set access levels of named methods by listing them
# as arguments to the access control functions:

class MyClass
  def method1
  end
  def method2
  end
  def method3
  end
  def method4
  end

  public    :method1, :method4
  protected :method2
  private   :method3
end
