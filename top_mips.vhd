-- GIOVANNI BRANCHER E WELLIGTON LUZ
-- ORGANIZAÇÃO DE COMPUTADORES 2017/2
library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity top_mips is
    Port (
        clk        : inout std_logic;
        rst        : inout std_logic;
        pc_en      : inout std_logic;
        loD        : inout std_logic;
        IREsc      : inout std_logic;
        RegDst     : inout std_logic;
        MemToReg   : inout std_logic;
        EscReg     : inout std_logic;
        UAL_fontA  : inout std_logic;
        UAL_fontB  : inout std_logic_vector(1 downto 0);
        UAL_Op     : inout std_logic;
        FontePC    : inout std_logic;
        LerMem     : inout std_logic;
        EscMem     : inout std_logic;
        opcode     : inout std_logic_vector(5 downto 0);
        end_req    : inout std_logic_vector(7 downto 0);
        end_qSai   : inout std_logic_vector(7 downto 0);
        entra_memoria : inout std_logic_vector(7 downto 0);
        dado       : inout std_logic_vector(7 downto 0)
    );
end top_mips;

architecture Behavioral of top_mips is

constant periodo: time := 10 ns;

component datapath
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
        LerMem      : in std_logic;
        EscMem      : out std_logic;
        opcode      : out std_logic_vector(5 downto 0);
        end_req     : out std_logic_vector(7 downto 0);
        end_qSai    : in std_logic_vector(7 downto 0);
        entra_memoria : out std_logic_vector(7 downto 0);
        dado        : in std_logic_vector(7 downto 0)
    );
end component;

component unid_controle
    Port (
        clk         : in  std_logic;
        rst         : in  std_logic;
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
end component;

component memoria
    Port (
        clk         : in std_logic;
        rst         : in std_logic;
        LerMem      : in std_logic;
        EscMem      : in std_logic;
        end_req     : in std_logic_vector(7 downto 0);
        end_qSai    : out std_logic_vector(7 downto 0);
        entra_memoria : in std_logic_vector(7 downto 0);
        dado        : out std_logic_vector(7 downto 0)
    );
end component;

begin

data_process: datapath
    port map (
        clk => clk,
        rst => rst,
        pc_en  => pc_en,
        loD => loD,
        IREsc  => IREsc,
        RegDst => RegDst,
        MemToReg => MemToReg,
        EscReg => EscReg,
        UAL_fontA => UAL_fontA,
        UAL_fontB => UAL_fontB,
        UAL_Op => UAL_Op,
        FontePC => FontePc,
        LerMem => LerMem,
        EscMem => EscMem,
        opcode => opcode,
        end_req => end_req,
        end_qSai => end_qSai,
        entra_memoria => entra_memoria,
        dado => dado
    );

unid_controle_process: unid_controle
    port map (
        clk => clk,
        rst => rst,
        pc_en  => pc_en,
        loD => loD,
        IREsc  => IREsc,
        RegDst => RegDst,
        MemToReg => MemToReg,
        EscReg => EscReg,
        UAL_fontA => UAL_fontA,
        UAL_fontB => UAL_fontB,
        UAL_Op => UAL_Op,
        FontePC => FontePc,
        opcode => opcode
    );
    
memoria_process: memoria
    port map (
        clk => clk,
        rst => rst,
        LerMem => LerMem,
        EscMem => EscMem,
        end_req => end_req,
        end_qSai => end_qSai,
        entra_memoria => entra_memoria,
        dado => dado
    );
    
clk_process: process -- eventos do clock
begin
    clk <= '0';
    wait for periodo/2;
    clk <= '1';
    wait for periodo/2;
end process;

rst_process: process -- espera de inicializacao
begin
    rst <= '1';
    wait for 10 ns;
    rst <= '0';
    wait;
end process;

end Behavioral;