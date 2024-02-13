
library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.std_logic_unsigned.all;


entity Int_SQRT_Calculator is 
 port( CLK, RESET, S : in std_logic; 
                   X : in std_logic_vector(7 downto 0); 
                Sqrt : out std_logic_vector(7 downto 0));
end Int_SQRT_Calculator;


architecture BEHAVIOR of Int_SQRT_Calculator is
type State is (T0,T1,T2,T3,T4);
signal currentState,nextState: State;
signal a:std_logic_vector(7 downto 0) := (others => '0');
signal q:std_logic_vector(7 downto 0);
signal d:std_logic_vector(7 downto 0);
begin 


process(CLK,RESET)
	begin
		if(Reset = '0') then
			currentState <= T0;
           
		elsif(CLK'event and CLK ='1') then
          
		    	currentState <= nextState;
		end if;
	end process;
    
    
    

process(currentState,s)
	begin
		CASE currentState is
			when T0 =>
				if ( s = '1' ) then
					nextState <= T1;
				end if;
			when T1 =>
				nextState <= T2;
			when T2 =>
				if(q>a) then
					nextState <= T3;
				else
					nextState <= T1;
				end if;
			when T3 =>
				nextState <= T4;
			when T4 =>
				nextState <= T0;
		end CASE;
	end process;
    
    
    
    process(currentState,s,CLK)
	begin
    	if (CLK'event and CLK ='1') then
			CASE currentState is
				when T0 =>
                    if(s='1')then 
                    a<=x;
                    q<="00000001";
                    d<= "00000011";
                  
                    end if;
                
                
                
				when T1 =>
                    q<=q+d;
                
                
                
				when T2 =>
                   d<=d+2;
                
                
                
                
					
				when T3 =>
                   d<=d SRL 1;
                   
                
                
                
                
                
				when T4 =>
                
                     sqrt<=d-1;
                
					
                    
                    
                    
                    
			end CASE;
            end if;
	end process;
end BEHAVIOR;
    
