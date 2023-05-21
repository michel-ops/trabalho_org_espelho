-- GIOVANNI BRANCHER E WELLIGTON LUZ
-- ORGANIZAÇÃO DE COMPUTADORES 2017/2
library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity datapath is
  Port (
    clk         : in std_logic;
    rst         : in std_logic;
    pc_en       : in std_logic;
    loD         : in std_logic;
    IREsc       : in std_logic;
    RegDst      : in std_logic;
    MemToReg    : in std_logic;
    EscReg      : in std_logic;
    UAL_fontA   : in std_logic;
    UAL_fontB   : in std_logic_vector(1 downto 0);
    UAL_Op      : in std_logic;
    FontePC     : in std_logic;
    opcode      : out std_logic_vector(5 downto 0);
    LerMem      : in std_logic;
    EscMem      : out std_logic;
    end_req     : out std_logic_vector(7 downto 0);
    end_qSai    : in std_logic_vector(7 downto 0);
    entra_memoria : out std_logic_vector(7 downto 0);
    dado        : in std_logic_vector(7 downto 0)
  );
end datapath;

architecture Behavioral of datapath is

signal reg1     : std_logic_vector(4 downto 0);
signal reg2     : std_logic_vector(4 downto 0);
signal regEsc   : std_logic_vector(4 downto 0);
signal dadoEsc  : std_logic_vector(4 downto 0);
signal regInst  : std_logic_vector(15 downto 0); -- necessário?
signal rA, rB   : std_logic_vector(4 downto 0); -- talvez desnecessário, pois daria pra usar reg1 e reg2

signal tes : bit_vector(7 downto 0);

signal num : unsigned(7 downto 0);
signal numV : natural range 0 to 255;

begin

--process(clk, rst) -- PC -> Memória [Não terminado]
--begin
--if(clk'event and clk='1') then
--    if(pc_en = '1') then
       
--    end if;
--end if;
--end process;

--process(clk, rst) -- ULA, a saida é de quantos bits? organizar tamanho dos vetores
--begin
--if(rst = '1') then
--    UAL_saida <= "0";
--elsif(clk'event and clk='1') then

--end if;
--end process;

-- [divisao dos bits e tal]
--process(clk, rst) -- Registradores de instruções -> Registradores
--begin

--if(rst = '1') then
--    opcode <= "000000";
--    reg1 <= "00000";
--    reg2 <= "00000";
--    regEsc <= "00000";

--elsif(clk'event and clk='1') then
--    if(IREsc = '1') then
--        opcode <= instrucao(31 downto 26);
--        reg1 <= instrucao(25 downto 21);
--        reg2 <= instrucao(20 downto 16);
--        if (RegDst = '1') then
--            regEsc <= instrucao(15 downto 11);
--        elsif(RegDst = '0') then
--            regEsc <= instrucao(20 downto 16);
--        end if;
----      dadoEsc <= saida da ula [REVISAR DEPOIS]
--    end if;
--end if;
--end process;

end_req <= "00000110";
--numV <= to_integer(x"FF");

process(clk, rst) -- Registradores -> A e B [REVISAR, pode ser redundância]
begin
if(rst = '1') then
    rA <= "00000";
    rB <= "00000";
elsif(clk'event and clk='1') then
    if(EscReg = '1') then
        rA <= reg1;
        rB <= reg2;
    end if;
end if;
end process;

end Behavioral;
