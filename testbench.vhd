
library IEEE; 
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;
 entity Testbench is
 
 end Testbench;



architecture BEHAVIOR of  Testbench is
component Int_SQRT_Calculator
port( CLK, RESET, S : in std_logic; 
      X : in std_logic_vector(7 downto 0):= (others => '0'); 
   Sqrt : out std_logic_vector(7 downto 0));

	end component;

signal CLK, RESET, S :std_logic := '0';

signal x,Sqrt :std_logic_vector ( 7 downto 0 ) := (others => '0');


constant clk_period: time := 4 ns;


begin
  modul:Int_SQRT_Calculator 
  port map(CLK,RESET,S,x,sqrt);
	process
	begin
		clk <= '1';
		wait for clk_period;
		clk <= '0';
		wait for clk_period;
	end process;



    process
	begin
		reset<='1';


		   for i in 1 to 200 loop
           wait for clk_period *2  ;
           x <= x+'1';
           
           
            S <= '1';
            wait for  clk_period *2 ;
            S <= '0';
            
            
            
          wait for  clk_period *20 ;
            
           end loop;
           
            

    end process;
    
end BEHAVIOR;
  
