library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity part2 is
	port
	(
		clock	: in std_logic;
		
		sec_up	: in std_logic;
		sec_down	: in std_logic;
		min_up	: in std_logic;
		min_down	: in std_logic;
		hour_up	: in std_logic;
		hour_down	: in std_logic;
		
		sec_ls : out unsigned (7 downto 0);
		sec_ms : out unsigned (7 downto 0);
		min_ls : out unsigned (7 downto 0);
		min_ms : out unsigned (7 downto 0);
		hour_ls : out unsigned (7 downto 0);
		hour_ms : out unsigned (7 downto 0);
	);
end part2;

architecture mainarch of part2 is

signal sec : unsigned (3 downto 0);

begin

	-- Process Statement (optional)

	-- Concurrent Procedure Call (optional)

	-- Concurrent Signal Assignment (optional)

	-- Conditional Signal Assignment (optional)

	-- Selected Signal Assignment (optional)

	-- Component Instantiation Statement (optional)

	-- Generate Statement (optional)

end mainarch;
