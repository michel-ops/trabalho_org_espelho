-- GIOVANNI BRANCHER E WELLIGTON LUZ
-- ORGANIZAÇÃO DE COMPUTADORES 2017/2
library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity unid_controle is
  Port (
    clk         : in std_logic;
    rst         : in std_logic;
    pc_en       : out std_logic;
    loD         : out std_logic;
    IREsc       : out std_logic;
    RegDst      : out std_logic;
    MemToReg    : out std_logic;
    EscReg      : out std_logic;
    UAL_fontA   : out std_logic;
    UAL_fontB   : out std_logic_vector(1 downto 0);
    UAL_Op      : out std_logic;
    FontePC     : out std_logic;
    opcode      : in std_logic_vector(5 downto 0)
  );
  
end unid_controle;

architecture Behavioral of unid_controle is

begin

UAL_fontB <= "10";
RegDst <= '1';
IREsc <= '1';
EscReg <= '1';

--pc_en <= '1';
--loD <= '0';
--IREsc <= '1';
--RegDst <= '1';

end Behavioral;
