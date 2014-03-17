module CardsHelper

  def to_roman(d)
    one = %W(#{nil} I II III IV V VI VII VIII IX)
    ten = %W(#{nil} X XX XXX XL L LX LXX LXXX XC)
    hundred = %W(#{nil} C CC CCC CD D DC DCC DCCC CM)
    d= d.to_i
    hundred[kurai(d,100)] + ten[kurai(d,10)] + one[kurai(d,1)]
  end

  def kurai(d, n)
    d % (n*10) / n
  end

end
