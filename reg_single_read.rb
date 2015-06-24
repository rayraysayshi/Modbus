#Demo script - BOILER LOOPS
#Reads the COMB_GAS PV, SP, OUT values

require 'rmodbus'

ModBus::TCPClient.connect('192.168.2.254', 502) do |cl|
  
  cl.with_slave(1) do |slave|
    test = slave.holding_registers[3135..3136]
    puts test.to_32f
  end
  
  #COMB_GAS
  
  #PV
  cl.with_slave(1) do |slave|
    test = slave.holding_registers[3137..3138]
    puts test.to_32f
  end
  
  #SP
  cl.with_slave(1) do |slave|
    test2 = slave.holding_registers[3139..3140]
    puts test2.to_32f
  end
  
  #OUT
  cl.with_slave(1) do |slave|
    test3 = slave.holding_registers[3141..3142]
    puts test3.to_32f
  end
  
  cl.with_slave(1) do |slave|
    test4 = slave.holding_registers[3143..3144]
    puts test4.to_32f
  end
  
  cl.with_slave(1) do |slave|
    test5 = slave.holding_registers[3145..3146]
    puts test5.to_32f
  end
  
  cl.with_slave(1) do |slave|
    test6 = slave.holding_registers[3147..3148]
    puts test6.to_32f
  end
  
end

#Two registers make up the 32 bit value to be concatenated to float!
