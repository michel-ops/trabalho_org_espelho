-- GIOVANNI BRANCHER E WELLIGTON LUZ
-- ORGANIZA��O DE COMPUTADORES 2017/2
library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity memoria is
  Port (
    clk         : in std_logic;
    rst         : in std_logic;
    LerMem      : in std_logic; -- enable
    EscMem      : in std_logic;   -- enable
    end_req     : in std_logic_vector(7 downto 0);
    end_qSai    : out std_logic_vector(7 downto 0);
    entra_memoria : in std_logic_vector(7 downto 0);
    dado        : out std_logic_vector(7 downto 0)
  ); -- troquei o tamanho de end_mem e instrucao
end memoria;

architecture Behavioral of memoria is

type memoria is array (0 to 255) of std_logic_vector(7 downto 0);
signal mem : memoria;
signal teste_mem : std_logic_vector(7 downto 0);
signal indice : natural range 0 to 255;
signal a : std_logic_vector(7 downto 0);

begin

process(rst)	
begin
			-- SE O RESET ESTIVER ATIVADO
	if(rst = '1') then
			--  RESETA MEM�RIA 
			mem(0)    <= "00110000"; -- add "add acc 2" -- acc = (mem 128) + acc = 2 + 0 = acc = 2 
			mem(1)    <= "10000000"; -- 128
			mem(2)    <= "01000000"; -- or "or acc 3" -- acc = (mem 129) or acc   =  3 or 2 = acc = 3
			mem(3)    <= "10000001"; -- 129
			mem(4)    <= "01010000"; -- and "and acc 4" -- acc = (mem 130) and acc  = 4 and 3 = acc = 0
			mem(5)    <= "10000010"; -- 130 
			mem(6)    <= "01100000"; -- not-1byte "not acc" -- acc = 0 ->  0 = 00000000  -> 255 = 11111111   acc = 255
			mem(7)    <= "00000000"; -- 
			mem(8)    <= "10000000"; -- jmp 12  -- programcounter = 12
			mem(9)    <= "00001100"; -- 12
			mem(10)   <= "00000000"; -- nop-1byte nop -- nada acontece
			mem(11)   <= "00000000"; --
			mem(12)   <= "10010000"; -- jn 16 -- NAO PULA SE N == 0
			mem(13)   <= "00010000"; -- 16
			mem(14)   <= "00000000"; -- nop -- nada acontece
			mem(15)   <= "00000000"; --
			mem(16)   <= "10100000"; -- jz -- NAO PULA SE Z == 0
			mem(17)   <= "00010100"; -- 20
			mem(18)   <= "00000000"; -- nop
			mem(19)   <= "00000000"; --
			mem(20)   <= "00000000"; -- nop
			mem(21)   <= "00000000"; --
			mem(22)   <= "00000000"; -- nop 
			mem(23)   <= "00000000"; --
			mem(24)   <= "00000000"; -- nop
			mem(25)   <= "00000000"; --         programa do cleber
			mem(26)   <= "00100000"; -- lda  	"lda 128" -- acc = (mem 128)  =  acc = 2 
			mem(27)   <= "10000000"; -- 128     
			mem(28)   <= "00110000"; -- add 		"add acc 3" -- acc = (mem 129) + acc  =  3 + 2 = acc = 5
			mem(29)   <= "10000001"; -- 129
			mem(30)   <= "00110000"; -- add     "add acc 4" -- acc = (mem 130) + acc  =  4 + 5 = acc = 9
			mem(31)   <= "10000010"; -- 130
			mem(32)   <= "00010000"; -- sta     "sta 131" -- (mem 131) = acc ou seja o valor 9 
			mem(33)   <= "10000011"; -- 131
			mem(34)   <= "11110000"; -- hlt-1byte   PC = 255, FLAG HLT = 1 E NAO FAZ MAIS NADA
			mem(35)   <= "00000000";
			mem(36)   <= "00000000";
			mem(37)   <= "00000000";
			mem(38)   <= "00000000";
			mem(39)   <= "00000000";
			mem(40)   <= "00000000";
			mem(41)   <= "00000000";
			mem(42)   <= "00000000";
			mem(43)   <= "00000000";
			mem(44)   <= "00000000";
			mem(45)   <= "00000000";
			mem(46)   <= "00000000";
			mem(47)   <= "00000000";
			mem(48)   <= "00000000";
			mem(49)   <= "00000000";
			mem(50)   <= "00000000";
			mem(51)   <= "00000000";
			mem(52)   <= "00000000";
			mem(53)   <= "00000000";
			mem(54)   <= "00000000";
			mem(55)   <= "00000000";
			mem(56)   <= "00000000";
			mem(57)   <= "00000000";
			mem(58)   <= "00000000";
			mem(59)   <= "00000000";
			mem(60)   <= "00000000";
			mem(61)   <= "00000000";
			mem(62)   <= "00000000";
			mem(63)   <= "00000000";
			mem(64)   <= "00000000";
			mem(65)   <= "00000000";
			mem(66)   <= "00000000";
			mem(67)   <= "00000000";
			mem(68)   <= "00000000";
			mem(69)   <= "00000000";
			mem(70)   <= "00000000";
			mem(71)   <= "00000000";
			mem(72)   <= "00000000";
			mem(73)   <= "00000000";
			mem(74)   <= "00000000";
			mem(75)   <= "00000000";
			mem(76)   <= "00000000";
			mem(77)   <= "00000000";
			mem(78)   <= "00000000";
			mem(79)   <= "00000000";
			mem(80)   <= "00000000";
			mem(81)   <= "00000000";
			mem(82)   <= "00000000";
			mem(83)   <= "00000000";
			mem(84)   <= "00000000";
			mem(85)   <= "00000000";
			mem(86)   <= "00000000";
			mem(87)   <= "00000000";
			mem(88)   <= "00000000";
			mem(89)   <= "00000000";
			mem(90)   <= "00000000";
			mem(91)   <= "00000000";
			mem(92)   <= "00000000";
			mem(93)   <= "00000000";
			mem(94)   <= "00000000";
			mem(95)   <= "00000000";
			mem(96)   <= "00000000";
			mem(97)   <= "00000000";
			mem(98)   <= "00000000";
			mem(99)   <= "00000000";
			mem(100)   <= "00000000";
			mem(101)   <= "00000000";
			mem(102)   <= "00000000";
			mem(103)   <= "00000000";
			mem(104)   <= "00000000";
			mem(105)   <= "00000000";
			mem(106)   <= "00000000";
			mem(107)   <= "00000000";
			mem(108)   <= "00000000";
			mem(109)   <= "00000000";
			mem(110)   <= "00000000";
			mem(111)   <= "00000000";
			mem(112)   <= "00000000";
			mem(113)   <= "00000000";
			mem(114)   <= "00000000";
			mem(115)   <= "00000000";
			mem(116)   <= "00000000";
			mem(117)   <= "00000000";
			mem(118)   <= "00000000";
			mem(119)   <= "00000000";
			mem(120)   <= "00000000";
			mem(121)   <= "00000000";
			mem(122)   <= "00000000";
			mem(123)   <= "00000000";
			mem(124)   <= "00000000";
			mem(125)   <= "00000000";
			mem(126)   <= "00000000";
			mem(127)   <= "00000000";
			mem(128)   <= "00000010"; -- VALOR 2 -- VARIAVEL X
			mem(129)   <= "00000011"; -- VALOR 3 -- VARIAVEL Y
			mem(130)   <= "00000100"; -- VALOR 4 -- VARIAVEL Z
			mem(131)   <= "00000101";
			mem(132)   <= "00000000";
			mem(133)   <= "00000000";
			mem(134)   <= "00000000";
			mem(135)   <= "00000000";
			mem(136)   <= "00000000";
			mem(137)   <= "00000000";
			mem(138)   <= "00000000";
			mem(139)   <= "00000000";
			mem(140)   <= "00000000";
			mem(141)   <= "00000000";
			mem(142)   <= "00000000";
			mem(143)   <= "00000000";
			mem(144)   <= "00000000";
			mem(145)   <= "00000000";
			mem(146)   <= "00000000";
			mem(147)   <= "00000000";
			mem(148)   <= "00000000";
			mem(149)   <= "00000000";
			mem(150)   <= "00000000";
			mem(151)   <= "00000000";
			mem(152)   <= "00000000";
			mem(153)   <= "00000000";
			mem(154)   <= "00000000";
			mem(155)   <= "00000000";
			mem(156)   <= "00000000";
			mem(157)   <= "00000000";
			mem(158)   <= "00000000";
			mem(159)   <= "00000000";
			mem(160)   <= "00000000";
			mem(161)   <= "00000000";
			mem(162)   <= "00000000";
			mem(163)   <= "00000000";
			mem(164)   <= "00000000";
			mem(165)   <= "00000000";
			mem(166)   <= "00000000";
			mem(167)   <= "00000000";
			mem(168)   <= "00000000";
			mem(169)   <= "00000000";
			mem(170)   <= "00000000";
			mem(171)   <= "00000000";
			mem(172)   <= "00000000";
			mem(173)   <= "00000000";
			mem(174)   <= "00000000";
			mem(175)   <= "00000000";
			mem(176)   <= "00000000";
			mem(177)   <= "00000000";
			mem(178)   <= "00000000";
			mem(179)   <= "00000000";
			mem(180)   <= "00000000";
			mem(181)   <= "00000000";
			mem(182)   <= "00000000";
			mem(183)   <= "00000000";
			mem(184)   <= "00000000";
			mem(185)   <= "00000000";
			mem(186)   <= "00000000";
			mem(187)   <= "00000000";
			mem(188)   <= "00000000";
			mem(189)   <= "00000000";
			mem(190)   <= "00000000";
			mem(191)   <= "00000000";
			mem(192)   <= "00000000";
			mem(193)   <= "00000000";
			mem(194)   <= "00000000";
			mem(195)   <= "00000000";
			mem(196)   <= "00000000";
			mem(197)   <= "00000000";
			mem(198)   <= "00000000";
			mem(199)   <= "00000000";
			mem(200)   <= "00000000";
			mem(201)   <= "00000000";
			mem(202)   <= "00000000";
			mem(203)   <= "00000000";
			mem(204)   <= "00000000";
			mem(205)   <= "00000000";
			mem(206)   <= "00000000";
			mem(207)   <= "00000000";
			mem(208)   <= "00000000";
			mem(209)   <= "00000000";
			mem(210)   <= "00000000";
			mem(211)   <= "00000000";
			mem(212)   <= "00000000";
			mem(213)   <= "00000000";
			mem(214)   <= "00000000";
			mem(215)   <= "00000000";
			mem(216)   <= "00000000";
			mem(217)   <= "00000000";
			mem(218)   <= "00000000";
			mem(219)   <= "00000000";
			mem(220)   <= "00000000";
			mem(221)   <= "00000000";
			mem(222)   <= "00000000";
			mem(223)   <= "00000000";
			mem(224)   <= "00000000";
			mem(225)   <= "00000000";
			mem(226)   <= "00000000";
			mem(227)   <= "00000000";
			mem(228)   <= "00000000";
			mem(229)   <= "00000000";
			mem(230)   <= "00000000";
			mem(231)   <= "00000000";
			mem(232)   <= "00000000";
			mem(233)   <= "00000000";
			mem(234)   <= "00000000";
			mem(235)   <= "00000000";
			mem(236)   <= "00000000";
			mem(237)   <= "00000000";
			mem(238)   <= "00000000";
			mem(239)   <= "00000000";
			mem(240)   <= "00000000";
			mem(241)   <= "00000000";
			mem(242)   <= "00000000";
			mem(243)   <= "00000000";
			mem(244)   <= "00000000";
			mem(245)   <= "00000000";
			mem(246)   <= "00000000";
			mem(247)   <= "00000000";
			mem(248)   <= "00000000";
			mem(249)   <= "00000000";
			mem(250)   <= "00000000";
			mem(251)   <= "00000000";
			mem(252)   <= "00000000";
			mem(253)   <= "00000000";
			mem(254)   <= "00000000";
			mem(255)   <= "00000000";
	end if;		
	-- tentar passar numero do negocio
	
--	a  <= unsigned(end_req);    -- this is a typecast
	indice <= conv_integer(end_req);
	dado <= mem(indice);
	
--    if (LerMem = '0') then
--    end_qSai <= mem(to_integer(unsigned(end_req)));
--    elsif (LerMem = '1') then
--    mem(to_integer(unsigned(end_req))) <= entra_memoria;
--end if;
end process;

end Behavioral;