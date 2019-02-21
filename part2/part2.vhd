library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity part2 is
	port
	(
		clock	: in std_logic;
		
		sec_up	: in std_logic;
		min_up	: in std_logic;
		hour_up	: in std_logic;
		
		sec_ls : out unsigned (6 downto 0);
		sec_ms : out unsigned (6 downto 0);
		min_ls : out unsigned (6 downto 0);
		min_ms : out unsigned (6 downto 0);
		hour_ls : out unsigned (6 downto 0);
		hour_ms : out unsigned (6 downto 0)
	);
end part2;

architecture mainarch of part2 is

signal sec, min: unsigned (7 downto 0);
signal hour : unsigned (7 downto 0):= "00000001";
signal sec_bcd_ls, sec_bcd_ms, min_bcd_ls, min_bcd_ms, hour_bcd_ls, hour_bcd_ms: unsigned (3 downto 0);
signal sec_bf, min_bf, hour_bf: unsigned (7 downto 0);
signal sec_bi, min_bi, hour_bi: unsigned (7 downto 0);
signal count: integer:=1;

begin
   -- Make basic clock functionality here
	process(clock)
	begin
		if rising_edge(clock) then
			count <= count + 1;
			if (count > 50000000) then
				sec <= sec + "00000001";
				count <= 0;
				
				if (sec_up = '1') then
					sec <= sec + "00000010";
				end if;
				if (min_up = '1') then
					min <= min + "00000001";
				end if;
				if (hour_up = '1') then
					hour <= hour + "00000001";
				end if;
				
			end if;
				if (sec >= "00111100") then
					sec <= "00000000";
					min <= min + "00000001";
				end if;
				if (min >= "00111100") then
					min <= "00000000";
					hour <= hour + "00000001";
				end if;
				if (hour >= "00001101") then
					hour <= "00000001";
				end if;
		end if;
	end process;
	
	
	
	-- Set clock to output to displays
	
	sec_bf <= sec mod 10;
	sec_bcd_ls <= sec_bf(3 downto 0);
	min_bf <= min mod 10;
	min_bcd_ls <= min_bf(3 downto 0);
	hour_bf <= hour mod 10;
	hour_bcd_ls <= hour_bf(3 downto 0);
	
	sec_bi <= (sec - sec_bf) / 10;
	sec_bcd_ms <= sec_bi(3 downto 0);
	min_bi <= (min - min_bf) / 10;
	min_bcd_ms <= min_bi(3 downto 0);
	hour_bi <= (hour - hour_bf) / 10;
	hour_bcd_ms <= hour_bi(3 downto 0);
	
	
	DISPLAY0: entity work.BCDto7Seg port map(sec_bcd_ls, sec_ls);
	DISPLAY1: entity work.BCDto7Seg port map(sec_bcd_ms, sec_ms);
	DISPLAY2: entity work.BCDto7Seg port map(min_bcd_ls, min_ls);
	DISPLAY3: entity work.BCDto7Seg port map(min_bcd_ms, min_ms);
	DISPLAY4: entity work.BCDto7Seg port map(hour_bcd_ls, hour_ls);
	DISPLAY5: entity work.BCDto7Seg port map(hour_bcd_ms, hour_ms);

	
end mainarch;
