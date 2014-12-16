
-- 
-- Definition of  filter
-- 
--      Tue Dec 16 10:44:02 2014
--      
--      LeonardoSpectrum Level 3, 2008b.3
-- 

library IEEE;
library adk;
use IEEE.STD_LOGIC_1164.all;
use adk.adk_components.all;

entity filter is
   port (
      T00 : IN std_logic_vector (7 DOWNTO 0) ;
      T01 : IN std_logic_vector (7 DOWNTO 0) ;
      T02 : IN std_logic_vector (7 DOWNTO 0) ;
      T10 : IN std_logic_vector (7 DOWNTO 0) ;
      T11 : IN std_logic_vector (7 DOWNTO 0) ;
      T12 : IN std_logic_vector (7 DOWNTO 0) ;
      T20 : IN std_logic_vector (7 DOWNTO 0) ;
      T21 : IN std_logic_vector (7 DOWNTO 0) ;
      T22 : IN std_logic_vector (7 DOWNTO 0) ;
      CLOCK : IN std_logic ;
      I_VALID : IN std_logic ;
      RESET : IN std_logic ;
      THRESHOLD : IN std_logic_vector (10 DOWNTO 0) ;
      READY : OUT std_logic ;
      O_VALID : OUT std_logic ;
      EDGE : OUT std_logic ;
      DIRECTION : OUT std_logic_vector (2 DOWNTO 0)) ;
end filter ;

architecture behavioral of filter is
   signal READY_dup0, O_VALID_dup0, nx580, fsm_inst_state_3, 
      fsm_inst_state_2, fsm_inst_state_0, nx8, nx12, nx18, nx34, nx38, nx42, 
      nx52, nx64, nx76, nx88, nx90, nx94, nx96, nx98, nx102, nx104, nx106, 
      nx110, nx112, nx114, nx118, nx130, nx142, nx154, nx164, nx168, nx172, 
      nx182, nx194, nx206, nx218, nx220, nx224, nx226, nx228, nx232, nx234, 
      nx236, nx240, nx242, nx244, nx248, nx260, nx272, nx284, nx292, nx294, 
      nx296, nx298, nx300, nx302, nx304, nx306, nx308, nx310, nx312, nx314, 
      nx316, nx318, nx320, nx322, nx324, nx326, nx328, nx330, nx332, nx334, 
      nx340, nx346, nx348, nx362, nx366, nx374, nx390, nx406, nx422, nx438, 
      nx454, nx470, nx486, nx502, nx512, nx524, nx540, nx556, nx572, nx582, 
      nx586, nx590, nx594, nx598, nx608, nx620, nx632, nx644, nx646, nx650, 
      nx652, nx654, nx658, nx660, nx662, nx666, nx668, nx670, nx674, nx686, 
      nx698, nx710, nx720, nx724, nx728, nx738, nx750, nx762, nx774, nx776, 
      nx780, nx782, nx784, nx788, nx790, nx792, nx796, nx798, nx800, nx804, 
      nx816, nx828, nx840, nx848, nx850, nx852, nx854, nx856, nx858, nx860, 
      nx862, nx864, nx866, nx868, nx870, nx872, nx874, nx876, nx878, nx880, 
      nx882, nx884, nx886, nx888, nx890, nx896, nx902, nx904, nx918, nx922, 
      nx930, nx946, nx962, nx978, nx994, nx1010, nx1026, nx1042, nx1058, 
      nx1068, nx1080, nx1096, nx1112, nx1128, nx1138, nx1156, nx1168, nx1172, 
      nx1178, nx1184, nx1190, nx1194, nx1208, nx1220, nx1224, nx1230, nx1236, 
      nx1242, nx1246, nx1260, nx1272, nx1276, nx1282, nx1288, nx1294, nx1298, 
      nx1312, nx1324, nx1328, nx1334, nx1340, nx1346, nx1366, nx1382, nx1398, 
      nx1414, nx1430, nx1438, nx1442, nx1446, nx1450, nx1460, nx1472, nx1484, 
      nx1496, nx1498, nx1502, nx1504, nx1506, nx1510, nx1512, nx1514, nx1518, 
      nx1520, nx1522, nx1526, nx1538, nx1550, nx1562, nx1572, nx1576, nx1580, 
      nx1590, nx1602, nx1614, nx1626, nx1628, nx1632, nx1634, nx1636, nx1640, 
      nx1642, nx1644, nx1648, nx1650, nx1652, nx1656, nx1668, nx1680, nx1692, 
      nx1700, nx1702, nx1704, nx1706, nx1708, nx1710, nx1712, nx1714, nx1716, 
      nx1718, nx1720, nx1722, nx1724, nx1726, nx1728, nx1730, nx1732, nx1734, 
      nx1736, nx1738, nx1740, nx1742, nx1748, nx1754, nx1756, nx1770, nx1774, 
      nx1782, nx1798, nx1814, nx1830, nx1846, nx1862, nx1878, nx1894, nx1910, 
      nx1920, nx1932, nx1948, nx1964, nx1980, nx1990, nx1998, nx2002, nx2006, 
      nx2016, nx2028, nx2040, nx2052, nx2054, nx2058, nx2060, nx2062, nx2066, 
      nx2068, nx2070, nx2074, nx2076, nx2078, nx2082, nx2094, nx2106, nx2118, 
      nx2128, nx2132, nx2136, nx2146, nx2158, nx2170, nx2182, nx2184, nx2188, 
      nx2190, nx2192, nx2196, nx2198, nx2200, nx2204, nx2206, nx2208, nx2212, 
      nx2224, nx2236, nx2248, nx2256, nx2258, nx2260, nx2262, nx2264, nx2266, 
      nx2268, nx2270, nx2272, nx2274, nx2276, nx2278, nx2280, nx2282, nx2284, 
      nx2286, nx2288, nx2290, nx2292, nx2294, nx2296, nx2298, nx2304, nx2310, 
      nx2312, nx2326, nx2330, nx2338, nx2354, nx2370, nx2386, nx2402, nx2418, 
      nx2434, nx2450, nx2466, nx2476, nx2488, nx2504, nx2520, nx2536, nx2546, 
      nx2550, nx2564, nx2576, nx2580, nx2586, nx2590, nx2592, nx2598, nx2616, 
      nx2628, nx2632, nx2638, nx2642, nx2644, nx2650, nx2668, nx2680, nx2684, 
      nx2690, nx2694, nx2696, nx2702, nx2720, nx2732, nx2736, nx2742, nx2748, 
      nx2754, nx2774, nx2790, nx2806, nx2822, nx2838, nx2846, nx2874, nx2882, 
      nx2910, nx2918, nx2946, nx2954, nx2982, nx2990, nx3004, nx3016, nx3020, 
      nx3036, nx3052, nx3068, nx3084, nx3092, nx3108, nx3124, nx3128, nx3134, 
      nx3140, nx3148, nx3152, nx3154, nx3156, nx3176, nx3188, nx3200, nx3202, 
      nx3204, nx3224, nx3236, nx3248, nx3250, nx3252, nx3272, nx3296, nx3300, 
      nx3306, nx3318, nx3330, nx3338, nx3342, nx3352, nx3358, nx3360, nx3368, 
      nx3370, nx3372, nx3376, nx3378, nx3380, nx3384, nx3386, nx3388, nx3390, 
      nx3392, nx3410, nx3426, nx3442, nx3458, nx3474, nx3502, nx677, nx679, 
      nx681, nx685, nx687, nx691, nx695, nx697, nx701, nx705, nx707, nx711, 
      nx715, nx717, nx719, nx721, nx723, nx725, nx727, nx729, nx731, nx733, 
      nx737, nx741, nx743, nx745, nx747, nx751, nx755, nx759, nx761, nx763, 
      nx765, nx769, nx773, nx777, nx779, nx781, nx783, nx787, nx791, nx797, 
      nx799, nx803, nx807, nx811, nx815, nx819, nx823, nx827, nx831, nx835, 
      nx839, nx847, nx851, nx853, nx859, nx861, nx867, nx871, nx875, nx877, 
      nx891, nx893, nx895, nx899, nx901, nx905, nx911, nx915, nx919, nx921, 
      nx925, nx927, nx937, nx939, nx941, nx945, nx947, nx951, nx957, nx961, 
      nx965, nx967, nx971, nx973, nx983, nx985, nx987, nx991, nx993, nx997, 
      nx1003, nx1007, nx1009, nx1013, nx1015, nx1019, nx1023, nx1029, nx1033, 
      nx1035, nx1037, nx1041, nx1043, nx1047, nx1051, nx1053, nx1057, nx1061, 
      nx1063, nx1067, nx1071, nx1073, nx1075, nx1077, nx1079, nx1081, nx1085, 
      nx1087, nx1089, nx1093, nx1099, nx1101, nx1103, nx1107, nx1113, nx1115, 
      nx1117, nx1121, nx1129, nx1133, nx1137, nx1139, nx1145, nx1147, nx1151, 
      nx1153, nx1159, nx1161, nx1163, nx1165, nx1167, nx1169, nx1173, nx1175, 
      nx1177, nx1179, nx1183, nx1189, nx1191, nx1193, nx1195, nx1199, nx1203, 
      nx1205, nx1207, nx1209, nx1213, nx1221, nx1225, nx1227, nx1229, nx1233, 
      nx1237, nx1239, nx1241, nx1245, nx1249, nx1253, nx1255, nx1259, nx1261, 
      nx1263, nx1267, nx1273, nx1277, nx1279, nx1281, nx1291, nx1297, nx1307, 
      nx1313, nx1321, nx1329, nx1333, nx1339, nx1341, nx1345, nx1347, nx1351, 
      nx1353, nx1357, nx1359, nx1363, nx1365, nx1367, nx1369, nx1373, nx1377, 
      nx1381, nx1385, nx1399, nx1403, nx1405, nx1409, nx1415, nx1419, nx1421, 
      nx1425, nx1431, nx1435, nx1437, nx1441, nx1447, nx1451, nx1453, nx1457, 
      nx1463, nx1465, nx1467, nx1469, nx1473, nx1475, nx1481, nx1485, nx1489, 
      nx1491, nx1493, nx1497, nx1499, nx1501, nx1505, nx1507, nx1511, nx1513, 
      nx1515, nx1519, nx1523, nx1525, nx1527, nx1531, nx1533, nx1537, nx1539, 
      nx1543, nx1545, nx1547, nx1551, nx1555, nx1557, nx1559, nx1563, nx1565, 
      nx1569, nx1571, nx1575, nx1577, nx1579, nx1583, nx1587, nx1589, nx1591, 
      nx1595, nx1597, nx1601, nx1603, nx1607, nx1609, nx1611, nx1617, nx1619, 
      nx1625, nx1627, nx1633, nx1635, nx1641, nx1643, nx1653, nx1655, nx1657, 
      nx1659, nx1663, nx1665, nx1667, nx1669, nx1673, nx1677, nx1679, nx1681, 
      nx1685, nx1687, nx1693, nx1695, nx1701, nx1703, nx1709, nx1713, nx1715, 
      nx1717, nx1721, nx1727, nx1729, nx1731, nx1735, nx1741, nx1743, nx1745, 
      nx1749, nx1757, nx1761, nx1765, nx1767, nx1773, nx1775, nx1781, nx1783, 
      nx1789, nx1793, nx1795, nx1797, nx1799, nx1803, nx1809, nx1811, nx1813, 
      nx1815, nx1819, nx1825, nx1827, nx1829, nx1831, nx1835, nx1843, nx1847, 
      nx1849, nx1851, nx1855, nx1859, nx1861, nx1863, nx1867, nx1871, nx1875, 
      nx1877, nx1879, nx1885, nx1891, nx1895, nx1897, nx1899, nx1909, nx1915, 
      nx1925, nx1931, nx1941, nx1949, nx1953, nx1959, nx1961, nx1965, nx1967, 
      nx1971, nx1973, nx1977, nx1979, nx1983, nx1985, nx1987, nx1989, nx1993, 
      nx1997, nx2001, nx2005, nx2019, nx2023, nx2025, nx2029, nx2035, nx2039, 
      nx2041, nx2045, nx2051, nx2055, nx2057, nx2061, nx2067, nx2071, nx2073, 
      nx2077, nx2083, nx2085, nx2087, nx2089, nx2093, nx2095, nx2101, nx2103, 
      nx2107, nx2109, nx2115, nx2119, nx2121, nx2127, nx2129, nx2135, nx2137, 
      nx2147, nx2149, nx2151, nx2153, nx2157, nx2163, nx2165, nx2167, nx2169, 
      nx2173, nx2179, nx2181, nx2183, nx2185, nx2189, nx2197, nx2201, nx2205, 
      nx2209, nx2213, nx2217, nx2221, nx2225, nx2229, nx2233, nx2237, nx2247, 
      nx2251, nx2267, nx2269, nx2271, nx2275, nx2283, nx2287, nx2293, nx2303, 
      nx2305, nx2307, nx2311, nx2319, nx2323, nx2329, nx2339, nx2341, nx2343, 
      nx2347, nx2355, nx2361, nx2365, nx2369, nx2373, nx2377, nx2379, nx2381, 
      nx2385, nx2387, nx2389, nx2393, nx2395, nx2399, nx2401, nx2403, nx2407, 
      nx2411, nx2413, nx2415, nx2419, nx2421, nx2425, nx2427, nx2431, nx2433, 
      nx2435, nx2439, nx2443, nx2445, nx2447, nx2451, nx2453, nx2457, nx2459, 
      nx2463, nx2465, nx2467, nx2471, nx2475, nx2477, nx2479, nx2483, nx2485, 
      nx2489, nx2491, nx2495, nx2497, nx2501, nx2505, nx2507, nx2509, nx2513, 
      nx2515, nx2517, nx2521, nx2523, nx2525, nx2529, nx2531, nx2533, nx2537, 
      nx2547, nx2549, nx2555, nx2557, nx2563, nx2565, nx2571, nx2587, nx2597, 
      nx2599, nx2601, nx2605, nx2619, nx2627, nx2629, nx2631, nx2635, nx2649, 
      nx2659, nx2661, nx2663, nx2667, nx2669, nx2671, nx2681, nx2683, nx2689, 
      nx2691, nx2697, nx2699, nx2705, nx2707, nx2715, nx2717, nx2723, nx2727, 
      nx2733, nx2739, nx2741, nx2747, nx2775, nx2777, nx2783, nx2785, nx2791, 
      nx2793, nx2795, nx2797, nx2799, nx2801, nx2803, nx2813, nx2815, nx2817, 
      nx2819: std_logic ;

begin
   READY <= READY_dup0 ;
   O_VALID <= O_VALID_dup0 ;
   ix581 : fake_gnd port map ( Y=>nx580);
   ix678 : aoi221 port map ( Y=>nx677, A0=>nx2817, A1=>nx2799, B0=>nx2819, 
      B1=>nx2801, C0=>nx3502);
   ix682 : aoi22 port map ( Y=>nx681, A0=>T01(7), A1=>nx1496, B0=>nx1498, B1
      =>nx1562);
   ix1497 : oai22 port map ( Y=>nx1496, A0=>nx685, A1=>nx687, B0=>nx731, B1
      =>nx733);
   ix686 : xnor2 port map ( Y=>nx685, A0=>T00(7), A1=>T02(7));
   ix688 : aoi22 port map ( Y=>nx687, A0=>T00(6), A1=>T02(6), B0=>nx1442, B1
      =>nx1484);
   ix692 : inv01 port map ( Y=>nx691, A=>T02(6));
   ix1485 : oai22 port map ( Y=>nx1484, A0=>nx695, A1=>nx697, B0=>nx727, B1
      =>nx729);
   ix696 : xnor2 port map ( Y=>nx695, A0=>T00(5), A1=>T02(5));
   ix698 : aoi22 port map ( Y=>nx697, A0=>T00(4), A1=>T02(4), B0=>nx1446, B1
      =>nx1472);
   ix702 : inv01 port map ( Y=>nx701, A=>T02(4));
   ix1473 : oai22 port map ( Y=>nx1472, A0=>nx705, A1=>nx707, B0=>nx723, B1
      =>nx725);
   ix706 : xnor2 port map ( Y=>nx705, A0=>T00(3), A1=>T02(3));
   ix708 : aoi22 port map ( Y=>nx707, A0=>T00(2), A1=>T02(2), B0=>nx1450, B1
      =>nx1460);
   ix712 : inv01 port map ( Y=>nx711, A=>T02(2));
   ix1461 : oai22 port map ( Y=>nx1460, A0=>nx715, A1=>nx717, B0=>nx719, B1
      =>nx721);
   ix716 : xnor2 port map ( Y=>nx715, A0=>T00(1), A1=>T02(1));
   ix718 : nand02 port map ( Y=>nx717, A0=>T00(0), A1=>T02(0));
   ix720 : inv01 port map ( Y=>nx719, A=>T00(1));
   ix722 : inv01 port map ( Y=>nx721, A=>T02(1));
   ix724 : inv01 port map ( Y=>nx723, A=>T00(3));
   ix726 : inv01 port map ( Y=>nx725, A=>T02(3));
   ix728 : inv01 port map ( Y=>nx727, A=>T00(5));
   ix730 : inv01 port map ( Y=>nx729, A=>T02(5));
   ix732 : inv01 port map ( Y=>nx731, A=>T00(7));
   ix734 : inv01 port map ( Y=>nx733, A=>T02(7));
   ix738 : inv01 port map ( Y=>nx737, A=>T01(7));
   ix1563 : oai22 port map ( Y=>nx1562, A0=>nx741, A1=>nx747, B0=>nx745, B1
      =>nx743);
   ix744 : xnor2 port map ( Y=>nx743, A0=>nx685, A1=>nx687);
   ix746 : inv01 port map ( Y=>nx745, A=>T01(6));
   ix748 : aoi22 port map ( Y=>nx747, A0=>T01(5), A1=>nx1504, B0=>nx1506, B1
      =>nx1550);
   ix1505 : xnor2 port map ( Y=>nx1504, A0=>nx751, A1=>nx1484);
   ix752 : xnor2 port map ( Y=>nx751, A0=>T00(6), A1=>T02(6));
   ix756 : inv01 port map ( Y=>nx755, A=>T01(5));
   ix1551 : oai22 port map ( Y=>nx1550, A0=>nx759, A1=>nx765, B0=>nx763, B1
      =>nx761);
   ix762 : xnor2 port map ( Y=>nx761, A0=>nx695, A1=>nx697);
   ix764 : inv01 port map ( Y=>nx763, A=>T01(4));
   ix766 : aoi22 port map ( Y=>nx765, A0=>T01(3), A1=>nx1512, B0=>nx1514, B1
      =>nx1538);
   ix1513 : xnor2 port map ( Y=>nx1512, A0=>nx769, A1=>nx1472);
   ix770 : xnor2 port map ( Y=>nx769, A0=>T00(4), A1=>T02(4));
   ix774 : inv01 port map ( Y=>nx773, A=>T01(3));
   ix1539 : oai22 port map ( Y=>nx1538, A0=>nx777, A1=>nx783, B0=>nx781, B1
      =>nx779);
   ix780 : xnor2 port map ( Y=>nx779, A0=>nx705, A1=>nx707);
   ix782 : inv01 port map ( Y=>nx781, A=>T01(2));
   ix784 : aoi22 port map ( Y=>nx783, A0=>T01(1), A1=>nx1520, B0=>nx1522, B1
      =>nx1526);
   ix1521 : xnor2 port map ( Y=>nx1520, A0=>nx787, A1=>nx1460);
   ix788 : xnor2 port map ( Y=>nx787, A0=>T00(2), A1=>T02(2));
   ix792 : inv01 port map ( Y=>nx791, A=>T01(1));
   ix798 : xnor2 port map ( Y=>nx797, A0=>nx715, A1=>nx717);
   ix800 : mux21 port map ( Y=>nx799, A0=>nx1702, A1=>nx1830, S0=>nx1706);
   ix1703 : xnor2 port map ( Y=>nx1702, A0=>nx803, A1=>nx1562);
   ix804 : xnor2 port map ( Y=>nx803, A0=>nx1496, A1=>T01(7));
   ix1831 : mux21 port map ( Y=>nx1830, A0=>nx807, A1=>nx811, S0=>nx1712);
   ix1503 : xnor2 port map ( Y=>nx1502, A0=>nx743, A1=>T01(6));
   ix812 : mux21 port map ( Y=>nx811, A0=>nx1714, A1=>nx1814, S0=>nx1718);
   ix1715 : xnor2 port map ( Y=>nx1714, A0=>nx815, A1=>nx1550);
   ix816 : xnor2 port map ( Y=>nx815, A0=>nx1504, A1=>T01(5));
   ix1815 : mux21 port map ( Y=>nx1814, A0=>nx819, A1=>nx823, S0=>nx1724);
   ix1511 : xnor2 port map ( Y=>nx1510, A0=>nx761, A1=>T01(4));
   ix824 : mux21 port map ( Y=>nx823, A0=>nx1726, A1=>nx1798, S0=>nx1730);
   ix1727 : xnor2 port map ( Y=>nx1726, A0=>nx827, A1=>nx1538);
   ix828 : xnor2 port map ( Y=>nx827, A0=>nx1512, A1=>T01(3));
   ix1799 : mux21 port map ( Y=>nx1798, A0=>nx831, A1=>nx835, S0=>nx1736);
   ix1519 : xnor2 port map ( Y=>nx1518, A0=>nx779, A1=>T01(2));
   ix836 : mux21 port map ( Y=>nx835, A0=>nx1738, A1=>nx1782, S0=>nx1742);
   ix1739 : xnor2 port map ( Y=>nx1738, A0=>nx839, A1=>nx1526);
   ix840 : xnor2 port map ( Y=>nx839, A0=>nx1520, A1=>T01(1));
   ix1783 : mux21_ni port map ( Y=>nx1782, A0=>nx1748, A1=>nx1774, S0=>
      nx1756);
   ix1749 : xnor2 port map ( Y=>nx1748, A0=>T01(0), A1=>nx797);
   ix1775 : nor02 port map ( Y=>nx1774, A0=>nx847, A1=>nx1770);
   ix848 : oai21 port map ( Y=>nx847, A0=>T02(0), A1=>T00(0), B0=>nx717);
   ix1771 : xnor2 port map ( Y=>nx1770, A0=>nx847, A1=>nx851);
   ix852 : oai21 port map ( Y=>nx851, A0=>T20(0), A1=>T22(0), B0=>nx853);
   ix854 : nand02 port map ( Y=>nx853, A0=>T22(0), A1=>T20(0));
   ix1757 : xnor2 port map ( Y=>nx1756, A0=>nx1748, A1=>nx1754);
   ix1755 : xnor2 port map ( Y=>nx1754, A0=>T21(0), A1=>nx859);
   ix860 : xnor2 port map ( Y=>nx859, A0=>nx861, A1=>nx853);
   ix862 : xnor2 port map ( Y=>nx861, A0=>T20(1), A1=>T22(1));
   ix1743 : xnor2 port map ( Y=>nx1742, A0=>nx1738, A1=>nx1740);
   ix1741 : xnor2 port map ( Y=>nx1740, A0=>nx867, A1=>nx1656);
   ix868 : xnor2 port map ( Y=>nx867, A0=>nx1650, A1=>T21(1));
   ix1651 : xnor2 port map ( Y=>nx1650, A0=>nx871, A1=>nx1590);
   ix872 : xnor2 port map ( Y=>nx871, A0=>T20(2), A1=>T22(2));
   ix1591 : oai22 port map ( Y=>nx1590, A0=>nx861, A1=>nx853, B0=>nx875, B1
      =>nx877);
   ix876 : inv01 port map ( Y=>nx875, A=>T22(1));
   ix878 : inv01 port map ( Y=>nx877, A=>T20(1));
   ix1737 : xnor2 port map ( Y=>nx1736, A0=>nx1732, A1=>nx1734);
   ix1733 : xnor2 port map ( Y=>nx1732, A0=>nx1518, A1=>nx783);
   ix1735 : xnor2 port map ( Y=>nx1734, A0=>nx1648, A1=>nx901);
   ix1649 : xnor2 port map ( Y=>nx1648, A0=>nx891, A1=>T21(2));
   ix892 : xnor2 port map ( Y=>nx891, A0=>nx893, A1=>nx895);
   ix894 : xnor2 port map ( Y=>nx893, A0=>T20(3), A1=>T22(3));
   ix896 : aoi22 port map ( Y=>nx895, A0=>T22(2), A1=>T20(2), B0=>nx1580, B1
      =>nx1590);
   ix900 : inv01 port map ( Y=>nx899, A=>T22(2));
   ix902 : aoi22 port map ( Y=>nx901, A0=>T21(1), A1=>nx1650, B0=>nx1652, B1
      =>nx1656);
   ix906 : inv01 port map ( Y=>nx905, A=>T21(1));
   ix1731 : xnor2 port map ( Y=>nx1730, A0=>nx1726, A1=>nx1728);
   ix1729 : xnor2 port map ( Y=>nx1728, A0=>nx911, A1=>nx1668);
   ix912 : xnor2 port map ( Y=>nx911, A0=>nx1642, A1=>T21(3));
   ix1643 : xnor2 port map ( Y=>nx1642, A0=>nx915, A1=>nx1602);
   ix916 : xnor2 port map ( Y=>nx915, A0=>T20(4), A1=>T22(4));
   ix1603 : oai22 port map ( Y=>nx1602, A0=>nx893, A1=>nx895, B0=>nx919, B1
      =>nx921);
   ix920 : inv01 port map ( Y=>nx919, A=>T22(3));
   ix922 : inv01 port map ( Y=>nx921, A=>T20(3));
   ix1669 : oai22 port map ( Y=>nx1668, A0=>nx925, A1=>nx901, B0=>nx927, B1
      =>nx891);
   ix928 : inv01 port map ( Y=>nx927, A=>T21(2));
   ix1725 : xnor2 port map ( Y=>nx1724, A0=>nx1720, A1=>nx1722);
   ix1721 : xnor2 port map ( Y=>nx1720, A0=>nx1510, A1=>nx765);
   ix1723 : xnor2 port map ( Y=>nx1722, A0=>nx1640, A1=>nx947);
   ix1641 : xnor2 port map ( Y=>nx1640, A0=>nx937, A1=>T21(4));
   ix938 : xnor2 port map ( Y=>nx937, A0=>nx939, A1=>nx941);
   ix940 : xnor2 port map ( Y=>nx939, A0=>T20(5), A1=>T22(5));
   ix942 : aoi22 port map ( Y=>nx941, A0=>T22(4), A1=>T20(4), B0=>nx1576, B1
      =>nx1602);
   ix946 : inv01 port map ( Y=>nx945, A=>T22(4));
   ix948 : aoi22 port map ( Y=>nx947, A0=>T21(3), A1=>nx1642, B0=>nx1644, B1
      =>nx1668);
   ix952 : inv01 port map ( Y=>nx951, A=>T21(3));
   ix1719 : xnor2 port map ( Y=>nx1718, A0=>nx1714, A1=>nx1716);
   ix1717 : xnor2 port map ( Y=>nx1716, A0=>nx957, A1=>nx1680);
   ix958 : xnor2 port map ( Y=>nx957, A0=>nx1634, A1=>T21(5));
   ix1635 : xnor2 port map ( Y=>nx1634, A0=>nx961, A1=>nx1614);
   ix962 : xnor2 port map ( Y=>nx961, A0=>T20(6), A1=>T22(6));
   ix1615 : oai22 port map ( Y=>nx1614, A0=>nx939, A1=>nx941, B0=>nx965, B1
      =>nx967);
   ix966 : inv01 port map ( Y=>nx965, A=>T22(5));
   ix968 : inv01 port map ( Y=>nx967, A=>T20(5));
   ix1681 : oai22 port map ( Y=>nx1680, A0=>nx971, A1=>nx947, B0=>nx973, B1
      =>nx937);
   ix974 : inv01 port map ( Y=>nx973, A=>T21(4));
   ix1713 : xnor2 port map ( Y=>nx1712, A0=>nx1708, A1=>nx1710);
   ix1709 : xnor2 port map ( Y=>nx1708, A0=>nx1502, A1=>nx747);
   ix1711 : xnor2 port map ( Y=>nx1710, A0=>nx1632, A1=>nx993);
   ix1633 : xnor2 port map ( Y=>nx1632, A0=>nx983, A1=>T21(6));
   ix984 : xnor2 port map ( Y=>nx983, A0=>nx985, A1=>nx987);
   ix986 : xnor2 port map ( Y=>nx985, A0=>T20(7), A1=>T22(7));
   ix988 : aoi22 port map ( Y=>nx987, A0=>T22(6), A1=>T20(6), B0=>nx1572, B1
      =>nx1614);
   ix992 : inv01 port map ( Y=>nx991, A=>T22(6));
   ix994 : aoi22 port map ( Y=>nx993, A0=>T21(5), A1=>nx1634, B0=>nx1636, B1
      =>nx1680);
   ix998 : inv01 port map ( Y=>nx997, A=>T21(5));
   ix1707 : xnor2 port map ( Y=>nx1706, A0=>nx1702, A1=>nx1704);
   ix1705 : xnor2 port map ( Y=>nx1704, A0=>nx1003, A1=>nx1692);
   ix1004 : xnor2 port map ( Y=>nx1003, A0=>nx1626, A1=>T21(7));
   ix1627 : oai22 port map ( Y=>nx1626, A0=>nx985, A1=>nx987, B0=>nx1007, B1
      =>nx1009);
   ix1008 : inv01 port map ( Y=>nx1007, A=>T22(7));
   ix1010 : inv01 port map ( Y=>nx1009, A=>T20(7));
   ix1693 : oai22 port map ( Y=>nx1692, A0=>nx1013, A1=>nx993, B0=>nx1015, 
      B1=>nx983);
   ix1016 : inv01 port map ( Y=>nx1015, A=>T21(6));
   ix1701 : xnor2 port map ( Y=>nx1700, A0=>nx681, A1=>nx1019);
   ix1020 : aoi22 port map ( Y=>nx1019, A0=>T21(7), A1=>nx1626, B0=>nx1628, 
      B1=>nx1692);
   ix1024 : inv01 port map ( Y=>nx1023, A=>T21(7));
   ix2839 : mux21 port map ( Y=>nx2838, A0=>nx1029, A1=>nx1399, S0=>nx1595);
   ix1030 : mux21 port map ( Y=>nx1029, A0=>nx2476, A1=>nx2546, S0=>nx2791);
   ix2477 : xnor2 port map ( Y=>nx2476, A0=>nx1033, A1=>nx2256);
   ix1034 : aoi22 port map ( Y=>nx1033, A0=>nx1035, A1=>nx2260, B0=>nx2466, 
      B1=>nx2262);
   ix1038 : xnor2 port map ( Y=>nx1037, A0=>nx2052, A1=>T02(7));
   ix2053 : oai22 port map ( Y=>nx2052, A0=>nx1041, A1=>nx1043, B0=>nx1081, 
      B1=>nx737);
   ix1042 : xnor2 port map ( Y=>nx1041, A0=>T01(7), A1=>T12(7));
   ix1044 : aoi22 port map ( Y=>nx1043, A0=>T12(6), A1=>T01(6), B0=>nx1998, 
      B1=>nx2040);
   ix1048 : inv01 port map ( Y=>nx1047, A=>T12(6));
   ix2041 : oai22 port map ( Y=>nx2040, A0=>nx1051, A1=>nx1053, B0=>nx1079, 
      B1=>nx755);
   ix1052 : xnor2 port map ( Y=>nx1051, A0=>T01(5), A1=>T12(5));
   ix1054 : aoi22 port map ( Y=>nx1053, A0=>T12(4), A1=>T01(4), B0=>nx2002, 
      B1=>nx2028);
   ix1058 : inv01 port map ( Y=>nx1057, A=>T12(4));
   ix2029 : oai22 port map ( Y=>nx2028, A0=>nx1061, A1=>nx1063, B0=>nx1077, 
      B1=>nx773);
   ix1062 : xnor2 port map ( Y=>nx1061, A0=>T01(3), A1=>T12(3));
   ix1064 : aoi22 port map ( Y=>nx1063, A0=>T12(2), A1=>T01(2), B0=>nx2006, 
      B1=>nx2016);
   ix1068 : inv01 port map ( Y=>nx1067, A=>T12(2));
   ix2017 : oai22 port map ( Y=>nx2016, A0=>nx1071, A1=>nx1073, B0=>nx1075, 
      B1=>nx791);
   ix1072 : xnor2 port map ( Y=>nx1071, A0=>T01(1), A1=>T12(1));
   ix1074 : nand02 port map ( Y=>nx1073, A0=>T12(0), A1=>T01(0));
   ix1076 : inv01 port map ( Y=>nx1075, A=>T12(1));
   ix1078 : inv01 port map ( Y=>nx1077, A=>T12(3));
   ix1080 : inv01 port map ( Y=>nx1079, A=>T12(5));
   ix1082 : inv01 port map ( Y=>nx1081, A=>T12(7));
   ix2119 : oai22 port map ( Y=>nx2118, A0=>nx1085, A1=>nx1089, B0=>nx691, 
      B1=>nx1087);
   ix1088 : xnor2 port map ( Y=>nx1087, A0=>nx1041, A1=>nx1043);
   ix1090 : aoi22 port map ( Y=>nx1089, A0=>T02(5), A1=>nx2060, B0=>nx2062, 
      B1=>nx2106);
   ix2061 : xnor2 port map ( Y=>nx2060, A0=>nx1093, A1=>nx2040);
   ix1094 : xnor2 port map ( Y=>nx1093, A0=>T01(6), A1=>T12(6));
   ix2107 : oai22 port map ( Y=>nx2106, A0=>nx1099, A1=>nx1103, B0=>nx701, 
      B1=>nx1101);
   ix1102 : xnor2 port map ( Y=>nx1101, A0=>nx1051, A1=>nx1053);
   ix1104 : aoi22 port map ( Y=>nx1103, A0=>T02(3), A1=>nx2068, B0=>nx2070, 
      B1=>nx2094);
   ix2069 : xnor2 port map ( Y=>nx2068, A0=>nx1107, A1=>nx2028);
   ix1108 : xnor2 port map ( Y=>nx1107, A0=>T01(4), A1=>T12(4));
   ix2095 : oai22 port map ( Y=>nx2094, A0=>nx1113, A1=>nx1117, B0=>nx711, 
      B1=>nx1115);
   ix1116 : xnor2 port map ( Y=>nx1115, A0=>nx1061, A1=>nx1063);
   ix1118 : aoi22 port map ( Y=>nx1117, A0=>T02(1), A1=>nx2076, B0=>nx2078, 
      B1=>nx2082);
   ix2077 : xnor2 port map ( Y=>nx2076, A0=>nx1121, A1=>nx2016);
   ix1122 : xnor2 port map ( Y=>nx1121, A0=>T01(2), A1=>T12(2));
   ix1130 : xnor2 port map ( Y=>nx1129, A0=>nx1071, A1=>nx1073);
   ix2261 : xnor2 port map ( Y=>nx2260, A0=>nx1133, A1=>nx2248);
   ix1134 : xnor2 port map ( Y=>nx1133, A0=>nx2182, A1=>T20(7));
   ix2183 : oai22 port map ( Y=>nx2182, A0=>nx1137, A1=>nx1139, B0=>nx1023, 
      B1=>nx1169);
   ix1138 : xnor2 port map ( Y=>nx1137, A0=>T10(7), A1=>T21(7));
   ix1140 : aoi22 port map ( Y=>nx1139, A0=>T21(6), A1=>T10(6), B0=>nx2128, 
      B1=>nx2170);
   ix2171 : oai22 port map ( Y=>nx2170, A0=>nx1145, A1=>nx1147, B0=>nx997, 
      B1=>nx1167);
   ix1146 : xnor2 port map ( Y=>nx1145, A0=>T10(5), A1=>T21(5));
   ix1148 : aoi22 port map ( Y=>nx1147, A0=>T21(4), A1=>T10(4), B0=>nx2132, 
      B1=>nx2158);
   ix2159 : oai22 port map ( Y=>nx2158, A0=>nx1151, A1=>nx1153, B0=>nx951, 
      B1=>nx1165);
   ix1152 : xnor2 port map ( Y=>nx1151, A0=>T10(3), A1=>T21(3));
   ix1154 : aoi22 port map ( Y=>nx1153, A0=>T21(2), A1=>T10(2), B0=>nx2136, 
      B1=>nx2146);
   ix2147 : oai22 port map ( Y=>nx2146, A0=>nx1159, A1=>nx1161, B0=>nx905, 
      B1=>nx1163);
   ix1160 : xnor2 port map ( Y=>nx1159, A0=>T10(1), A1=>T21(1));
   ix1162 : nand02 port map ( Y=>nx1161, A0=>T21(0), A1=>T10(0));
   ix1164 : inv01 port map ( Y=>nx1163, A=>T10(1));
   ix1166 : inv01 port map ( Y=>nx1165, A=>T10(3));
   ix1168 : inv01 port map ( Y=>nx1167, A=>T10(5));
   ix1170 : inv01 port map ( Y=>nx1169, A=>T10(7));
   ix2249 : oai22 port map ( Y=>nx2248, A0=>nx1173, A1=>nx1179, B0=>nx1177, 
      B1=>nx1175);
   ix1176 : xnor2 port map ( Y=>nx1175, A0=>nx1137, A1=>nx1139);
   ix1178 : inv01 port map ( Y=>nx1177, A=>T20(6));
   ix1180 : aoi22 port map ( Y=>nx1179, A0=>T20(5), A1=>nx2190, B0=>nx2192, 
      B1=>nx2236);
   ix2191 : xnor2 port map ( Y=>nx2190, A0=>nx1183, A1=>nx2170);
   ix1184 : xnor2 port map ( Y=>nx1183, A0=>T10(6), A1=>T21(6));
   ix2237 : oai22 port map ( Y=>nx2236, A0=>nx1189, A1=>nx1195, B0=>nx1193, 
      B1=>nx1191);
   ix1192 : xnor2 port map ( Y=>nx1191, A0=>nx1145, A1=>nx1147);
   ix1194 : inv01 port map ( Y=>nx1193, A=>T20(4));
   ix1196 : aoi22 port map ( Y=>nx1195, A0=>T20(3), A1=>nx2198, B0=>nx2200, 
      B1=>nx2224);
   ix2199 : xnor2 port map ( Y=>nx2198, A0=>nx1199, A1=>nx2158);
   ix1200 : xnor2 port map ( Y=>nx1199, A0=>T10(4), A1=>T21(4));
   ix2225 : oai22 port map ( Y=>nx2224, A0=>nx1203, A1=>nx1209, B0=>nx1207, 
      B1=>nx1205);
   ix1206 : xnor2 port map ( Y=>nx1205, A0=>nx1151, A1=>nx1153);
   ix1208 : inv01 port map ( Y=>nx1207, A=>T20(2));
   ix1210 : aoi22 port map ( Y=>nx1209, A0=>T20(1), A1=>nx2206, B0=>nx2208, 
      B1=>nx2212);
   ix2207 : xnor2 port map ( Y=>nx2206, A0=>nx1213, A1=>nx2146);
   ix1214 : xnor2 port map ( Y=>nx1213, A0=>T10(2), A1=>T21(2));
   ix1222 : xnor2 port map ( Y=>nx1221, A0=>nx1159, A1=>nx1161);
   ix2467 : oai22 port map ( Y=>nx2466, A0=>nx1225, A1=>nx1313, B0=>nx2264, 
      B1=>nx1321);
   ix1226 : aoi22 port map ( Y=>nx1225, A0=>nx1227, A1=>nx2272, B0=>nx2450, 
      B1=>nx2274);
   ix1230 : xnor2 port map ( Y=>nx1229, A0=>nx2060, A1=>T02(5));
   ix2273 : xnor2 port map ( Y=>nx2272, A0=>nx1233, A1=>nx2236);
   ix1234 : xnor2 port map ( Y=>nx1233, A0=>nx2190, A1=>T20(5));
   ix2451 : oai22 port map ( Y=>nx2450, A0=>nx1237, A1=>nx1297, B0=>nx2276, 
      B1=>nx1307);
   ix1238 : aoi22 port map ( Y=>nx1237, A0=>nx1239, A1=>nx2284, B0=>nx2434, 
      B1=>nx2286);
   ix1242 : xnor2 port map ( Y=>nx1241, A0=>nx2068, A1=>T02(3));
   ix2285 : xnor2 port map ( Y=>nx2284, A0=>nx1245, A1=>nx2224);
   ix1246 : xnor2 port map ( Y=>nx1245, A0=>nx2198, A1=>T20(3));
   ix2435 : oai22 port map ( Y=>nx2434, A0=>nx1249, A1=>nx1281, B0=>nx2288, 
      B1=>nx1291);
   ix1250 : aoi22 port map ( Y=>nx1249, A0=>nx2418, A1=>nx2298, B0=>nx1279, 
      B1=>nx2296);
   ix2419 : oai22 port map ( Y=>nx2418, A0=>nx1253, A1=>nx1263, B0=>nx2304, 
      B1=>nx1267);
   ix1254 : nor02 port map ( Y=>nx1253, A0=>nx1255, A1=>nx2326);
   ix1256 : nor02 port map ( Y=>nx1255, A0=>nx2326, A1=>nx1261);
   ix2327 : xnor2 port map ( Y=>nx2326, A0=>nx1259, A1=>nx1261);
   ix1260 : oai21 port map ( Y=>nx1259, A0=>T01(0), A1=>T12(0), B0=>nx1073);
   ix1262 : oai21 port map ( Y=>nx1261, A0=>T10(0), A1=>T21(0), B0=>nx1161);
   ix2305 : xnor2 port map ( Y=>nx2304, A0=>T02(0), A1=>nx1129);
   ix2311 : xnor2 port map ( Y=>nx2310, A0=>T20(0), A1=>nx1221);
   ix2299 : xnor2 port map ( Y=>nx2298, A0=>nx2294, A1=>nx2296);
   ix2295 : xnor2 port map ( Y=>nx2294, A0=>nx1273, A1=>nx2082);
   ix1274 : xnor2 port map ( Y=>nx1273, A0=>nx2076, A1=>T02(1));
   ix2297 : xnor2 port map ( Y=>nx2296, A0=>nx1277, A1=>nx2212);
   ix1278 : xnor2 port map ( Y=>nx1277, A0=>nx2206, A1=>T20(1));
   ix2289 : xnor2 port map ( Y=>nx2288, A0=>nx2074, A1=>nx1117);
   ix2075 : xnor2 port map ( Y=>nx2074, A0=>nx1115, A1=>T02(2));
   ix2291 : xnor2 port map ( Y=>nx2290, A0=>nx2204, A1=>nx1209);
   ix2205 : xnor2 port map ( Y=>nx2204, A0=>nx1205, A1=>T20(2));
   ix2287 : xnor2 port map ( Y=>nx2286, A0=>nx2282, A1=>nx2284);
   ix2283 : xnor2 port map ( Y=>nx2282, A0=>nx1241, A1=>nx2094);
   ix2277 : xnor2 port map ( Y=>nx2276, A0=>nx2066, A1=>nx1103);
   ix2067 : xnor2 port map ( Y=>nx2066, A0=>nx1101, A1=>T02(4));
   ix2279 : xnor2 port map ( Y=>nx2278, A0=>nx2196, A1=>nx1195);
   ix2197 : xnor2 port map ( Y=>nx2196, A0=>nx1191, A1=>T20(4));
   ix2275 : xnor2 port map ( Y=>nx2274, A0=>nx2270, A1=>nx2272);
   ix2271 : xnor2 port map ( Y=>nx2270, A0=>nx1229, A1=>nx2106);
   ix2265 : xnor2 port map ( Y=>nx2264, A0=>nx2058, A1=>nx1089);
   ix2059 : xnor2 port map ( Y=>nx2058, A0=>nx1087, A1=>T02(6));
   ix2267 : xnor2 port map ( Y=>nx2266, A0=>nx2188, A1=>nx1179);
   ix2189 : xnor2 port map ( Y=>nx2188, A0=>nx1175, A1=>T20(6));
   ix2263 : xnor2 port map ( Y=>nx2262, A0=>nx2258, A1=>nx2260);
   ix2259 : xnor2 port map ( Y=>nx2258, A0=>nx1037, A1=>nx2118);
   ix2257 : xnor2 port map ( Y=>nx2256, A0=>nx1329, A1=>nx1333);
   ix1330 : aoi22 port map ( Y=>nx1329, A0=>T02(7), A1=>nx2052, B0=>nx2054, 
      B1=>nx2118);
   ix1334 : aoi22 port map ( Y=>nx1333, A0=>T20(7), A1=>nx2182, B0=>nx2184, 
      B1=>nx2248);
   ix2547 : xnor2 port map ( Y=>nx2546, A0=>nx2256, A1=>nx1339);
   ix1340 : aoi22 port map ( Y=>nx1339, A0=>nx2258, A1=>nx1341, B0=>nx2262, 
      B1=>nx2536);
   ix2537 : oai22 port map ( Y=>nx2536, A0=>nx1313, A1=>nx1345, B0=>nx1369, 
      B1=>nx2266);
   ix1346 : aoi22 port map ( Y=>nx1345, A0=>nx2270, A1=>nx1347, B0=>nx2274, 
      B1=>nx2520);
   ix2521 : oai22 port map ( Y=>nx2520, A0=>nx1297, A1=>nx1351, B0=>nx1367, 
      B1=>nx2278);
   ix1352 : aoi22 port map ( Y=>nx1351, A0=>nx2282, A1=>nx1353, B0=>nx2286, 
      B1=>nx2504);
   ix2505 : oai22 port map ( Y=>nx2504, A0=>nx1281, A1=>nx1357, B0=>nx1365, 
      B1=>nx2290);
   ix1358 : aoi22 port map ( Y=>nx1357, A0=>nx2294, A1=>nx1359, B0=>nx2298, 
      B1=>nx2488);
   ix2489 : oai22 port map ( Y=>nx2488, A0=>nx1263, A1=>nx1255, B0=>nx1363, 
      B1=>nx2310);
   ix2403 : mux21 port map ( Y=>nx2402, A0=>nx1329, A1=>nx1373, S0=>nx2256);
   ix1374 : mux21 port map ( Y=>nx1373, A0=>nx2258, A1=>nx2386, S0=>nx2262);
   ix2387 : mux21 port map ( Y=>nx2386, A0=>nx1369, A1=>nx1377, S0=>nx2268);
   ix1378 : mux21 port map ( Y=>nx1377, A0=>nx2270, A1=>nx2370, S0=>nx2274);
   ix2371 : mux21 port map ( Y=>nx2370, A0=>nx1367, A1=>nx1381, S0=>nx2280);
   ix1382 : mux21 port map ( Y=>nx1381, A0=>nx2282, A1=>nx2354, S0=>nx2286);
   ix2355 : mux21 port map ( Y=>nx2354, A0=>nx1365, A1=>nx1385, S0=>nx2292);
   ix1386 : mux21 port map ( Y=>nx1385, A0=>nx2294, A1=>nx2338, S0=>nx2298);
   ix2339 : mux21_ni port map ( Y=>nx2338, A0=>nx2304, A1=>nx2330, S0=>
      nx2312);
   ix2331 : nor02 port map ( Y=>nx2330, A0=>nx1259, A1=>nx2326);
   ix2313 : xnor2 port map ( Y=>nx2312, A0=>nx2304, A1=>nx2310);
   ix2293 : xnor2 port map ( Y=>nx2292, A0=>nx2288, A1=>nx2290);
   ix2281 : xnor2 port map ( Y=>nx2280, A0=>nx2276, A1=>nx2278);
   ix2269 : xnor2 port map ( Y=>nx2268, A0=>nx2264, A1=>nx2266);
   ix1400 : mux21 port map ( Y=>nx1399, A0=>nx2564, A1=>nx2822, S0=>nx1579);
   ix2565 : mux21 port map ( Y=>nx2564, A0=>nx1403, A1=>nx1405, S0=>nx2791);
   ix1404 : xnor2 port map ( Y=>nx1403, A0=>nx2466, A1=>nx2262);
   ix1406 : xnor2 port map ( Y=>nx1405, A0=>nx2262, A1=>nx2536);
   ix2823 : mux21 port map ( Y=>nx2822, A0=>nx1409, A1=>nx1415, S0=>nx1563);
   ix1410 : mux21 port map ( Y=>nx1409, A0=>nx2580, A1=>nx2586, S0=>nx2791);
   ix2581 : xnor2 port map ( Y=>nx2580, A0=>nx1225, A1=>nx2268);
   ix2587 : xnor2 port map ( Y=>nx2586, A0=>nx2268, A1=>nx1345);
   ix1416 : mux21 port map ( Y=>nx1415, A0=>nx2616, A1=>nx2806, S0=>nx1547);
   ix2617 : mux21 port map ( Y=>nx2616, A0=>nx1419, A1=>nx1421, S0=>nx2791);
   ix1420 : xnor2 port map ( Y=>nx1419, A0=>nx2450, A1=>nx2274);
   ix1422 : xnor2 port map ( Y=>nx1421, A0=>nx2274, A1=>nx2520);
   ix2807 : mux21 port map ( Y=>nx2806, A0=>nx1425, A1=>nx1431, S0=>nx1531);
   ix1426 : mux21 port map ( Y=>nx1425, A0=>nx2632, A1=>nx2638, S0=>nx2791);
   ix2633 : xnor2 port map ( Y=>nx2632, A0=>nx1237, A1=>nx2280);
   ix2639 : xnor2 port map ( Y=>nx2638, A0=>nx2280, A1=>nx1351);
   ix1432 : mux21 port map ( Y=>nx1431, A0=>nx2668, A1=>nx2790, S0=>nx1515);
   ix2669 : mux21 port map ( Y=>nx2668, A0=>nx1435, A1=>nx1437, S0=>nx2791);
   ix1436 : xnor2 port map ( Y=>nx1435, A0=>nx2434, A1=>nx2286);
   ix1438 : xnor2 port map ( Y=>nx1437, A0=>nx2286, A1=>nx2504);
   ix2791 : mux21 port map ( Y=>nx2790, A0=>nx1441, A1=>nx1447, S0=>nx1499);
   ix1442 : mux21 port map ( Y=>nx1441, A0=>nx2684, A1=>nx2690, S0=>nx2793);
   ix2685 : xnor2 port map ( Y=>nx2684, A0=>nx1249, A1=>nx2292);
   ix2691 : xnor2 port map ( Y=>nx2690, A0=>nx2292, A1=>nx1357);
   ix1448 : mux21 port map ( Y=>nx1447, A0=>nx2720, A1=>nx2774, S0=>nx1481);
   ix2721 : mux21 port map ( Y=>nx2720, A0=>nx1451, A1=>nx1453, S0=>nx2793);
   ix1452 : xnor2 port map ( Y=>nx1451, A0=>nx2418, A1=>nx2298);
   ix1454 : xnor2 port map ( Y=>nx1453, A0=>nx2298, A1=>nx2488);
   ix2775 : mux21 port map ( Y=>nx2774, A0=>nx1457, A1=>nx1463, S0=>nx1467);
   ix1458 : mux21 port map ( Y=>nx1457, A0=>nx2736, A1=>nx2742, S0=>nx2793);
   ix2737 : xnor2 port map ( Y=>nx2736, A0=>nx1253, A1=>nx2312);
   ix2743 : xnor2 port map ( Y=>nx2742, A0=>nx2312, A1=>nx1255);
   ix1464 : nand02 port map ( Y=>nx1463, A0=>nx1465, A1=>nx1770);
   ix1468 : xnor2 port map ( Y=>nx1467, A0=>nx1457, A1=>nx1469);
   ix2749 : xnor2 port map ( Y=>nx2748, A0=>nx1473, A1=>nx1756);
   ix1474 : nor02 port map ( Y=>nx1473, A0=>nx1475, A1=>nx1770);
   ix1476 : nor02 port map ( Y=>nx1475, A0=>nx1770, A1=>nx851);
   ix2755 : xnor2 port map ( Y=>nx2754, A0=>nx1756, A1=>nx1475);
   ix1847 : mux21 port map ( Y=>nx1846, A0=>nx681, A1=>nx799, S0=>nx1700);
   ix1482 : xnor2 port map ( Y=>nx1481, A0=>nx2720, A1=>nx2732);
   ix1486 : xnor2 port map ( Y=>nx1485, A0=>nx1862, A1=>nx1742);
   ix1863 : oai22 port map ( Y=>nx1862, A0=>nx1473, A1=>nx1489, B0=>nx1748, 
      B1=>nx1491);
   ix1494 : xnor2 port map ( Y=>nx1493, A0=>nx1742, A1=>nx1932);
   ix1933 : oai22 port map ( Y=>nx1932, A0=>nx1489, A1=>nx1475, B0=>nx1497, 
      B1=>nx1754);
   ix1500 : xnor2 port map ( Y=>nx1499, A0=>nx1441, A1=>nx1501);
   ix2697 : xnor2 port map ( Y=>nx2696, A0=>nx1505, A1=>nx1736);
   ix1506 : aoi22 port map ( Y=>nx1505, A0=>nx1862, A1=>nx1742, B0=>nx1507, 
      B1=>nx1740);
   ix2703 : xnor2 port map ( Y=>nx2702, A0=>nx1736, A1=>nx1511);
   ix1512 : aoi22 port map ( Y=>nx1511, A0=>nx1738, A1=>nx1513, B0=>nx1742, 
      B1=>nx1932);
   ix1516 : xnor2 port map ( Y=>nx1515, A0=>nx2668, A1=>nx2680);
   ix1520 : xnor2 port map ( Y=>nx1519, A0=>nx1878, A1=>nx1730);
   ix1879 : oai22 port map ( Y=>nx1878, A0=>nx1505, A1=>nx1523, B0=>nx1732, 
      B1=>nx1525);
   ix1528 : xnor2 port map ( Y=>nx1527, A0=>nx1730, A1=>nx1948);
   ix1949 : oai22 port map ( Y=>nx1948, A0=>nx1523, A1=>nx1511, B0=>nx831, 
      B1=>nx1734);
   ix1532 : xnor2 port map ( Y=>nx1531, A0=>nx1425, A1=>nx1533);
   ix2645 : xnor2 port map ( Y=>nx2644, A0=>nx1537, A1=>nx1724);
   ix1538 : aoi22 port map ( Y=>nx1537, A0=>nx1539, A1=>nx1728, B0=>nx1878, 
      B1=>nx1730);
   ix2651 : xnor2 port map ( Y=>nx2650, A0=>nx1724, A1=>nx1543);
   ix1544 : aoi22 port map ( Y=>nx1543, A0=>nx1726, A1=>nx1545, B0=>nx1730, 
      B1=>nx1948);
   ix1548 : xnor2 port map ( Y=>nx1547, A0=>nx2616, A1=>nx2628);
   ix1552 : xnor2 port map ( Y=>nx1551, A0=>nx1894, A1=>nx1718);
   ix1895 : oai22 port map ( Y=>nx1894, A0=>nx1537, A1=>nx1555, B0=>nx1720, 
      B1=>nx1557);
   ix1560 : xnor2 port map ( Y=>nx1559, A0=>nx1718, A1=>nx1964);
   ix1965 : oai22 port map ( Y=>nx1964, A0=>nx1555, A1=>nx1543, B0=>nx819, 
      B1=>nx1722);
   ix1564 : xnor2 port map ( Y=>nx1563, A0=>nx1409, A1=>nx1565);
   ix2593 : xnor2 port map ( Y=>nx2592, A0=>nx1569, A1=>nx1712);
   ix1570 : aoi22 port map ( Y=>nx1569, A0=>nx1571, A1=>nx1716, B0=>nx1894, 
      B1=>nx1718);
   ix2599 : xnor2 port map ( Y=>nx2598, A0=>nx1712, A1=>nx1575);
   ix1576 : aoi22 port map ( Y=>nx1575, A0=>nx1714, A1=>nx1577, B0=>nx1718, 
      B1=>nx1964);
   ix1580 : xnor2 port map ( Y=>nx1579, A0=>nx2564, A1=>nx2576);
   ix1584 : xnor2 port map ( Y=>nx1583, A0=>nx1910, A1=>nx1706);
   ix1911 : oai22 port map ( Y=>nx1910, A0=>nx1569, A1=>nx1587, B0=>nx1708, 
      B1=>nx1589);
   ix1592 : xnor2 port map ( Y=>nx1591, A0=>nx1706, A1=>nx1980);
   ix1981 : oai22 port map ( Y=>nx1980, A0=>nx1587, A1=>nx1575, B0=>nx807, 
      B1=>nx1710);
   ix1596 : xnor2 port map ( Y=>nx1595, A0=>nx1029, A1=>nx1597);
   ix1921 : xnor2 port map ( Y=>nx1920, A0=>nx1601, A1=>nx1700);
   ix1602 : aoi22 port map ( Y=>nx1601, A0=>nx1603, A1=>nx1704, B0=>nx1910, 
      B1=>nx1706);
   ix1991 : xnor2 port map ( Y=>nx1990, A0=>nx1700, A1=>nx1607);
   ix1608 : aoi22 port map ( Y=>nx1607, A0=>nx1702, A1=>nx1609, B0=>nx1706, 
      B1=>nx1980);
   ix1612 : mux21 port map ( Y=>nx1611, A0=>nx2846, A1=>nx3084, S0=>nx2533);
   ix2847 : nand02 port map ( Y=>nx2846, A0=>nx1029, A1=>nx1597);
   ix3085 : mux21 port map ( Y=>nx3084, A0=>nx1617, A1=>nx1619, S0=>nx2529);
   ix1618 : mux21 port map ( Y=>nx1617, A0=>nx2576, A1=>nx2564, S0=>nx2795);
   ix1620 : mux21 port map ( Y=>nx1619, A0=>nx2874, A1=>nx3068, S0=>nx2525);
   ix2875 : mux21 port map ( Y=>nx2874, A0=>nx1565, A1=>nx1409, S0=>nx2795);
   ix3069 : mux21 port map ( Y=>nx3068, A0=>nx1625, A1=>nx1627, S0=>nx2521);
   ix1626 : mux21 port map ( Y=>nx1625, A0=>nx2628, A1=>nx2616, S0=>nx2795);
   ix1628 : mux21 port map ( Y=>nx1627, A0=>nx2910, A1=>nx3052, S0=>nx2517);
   ix2911 : mux21 port map ( Y=>nx2910, A0=>nx1533, A1=>nx1425, S0=>nx2795);
   ix3053 : mux21 port map ( Y=>nx3052, A0=>nx1633, A1=>nx1635, S0=>nx2513);
   ix1634 : mux21 port map ( Y=>nx1633, A0=>nx2680, A1=>nx2668, S0=>nx2795);
   ix1636 : mux21 port map ( Y=>nx1635, A0=>nx2946, A1=>nx3036, S0=>nx2509);
   ix2947 : mux21 port map ( Y=>nx2946, A0=>nx1501, A1=>nx1441, S0=>nx2797);
   ix3037 : mux21 port map ( Y=>nx3036, A0=>nx1641, A1=>nx1643, S0=>nx2505);
   ix1642 : mux21 port map ( Y=>nx1641, A0=>nx2732, A1=>nx2720, S0=>nx2797);
   ix1644 : mux21 port map ( Y=>nx1643, A0=>nx2982, A1=>nx3020, S0=>nx2501);
   ix2983 : mux21 port map ( Y=>nx2982, A0=>nx1469, A1=>nx1457, S0=>nx2797);
   ix3021 : nor02ii port map ( Y=>nx3020, A0=>nx3016, A1=>nx3004);
   ix3017 : mux21 port map ( Y=>nx3016, A0=>nx362, A1=>nx918, S0=>nx2783);
   ix363 : xnor2 port map ( Y=>nx362, A0=>nx1653, A1=>nx1657);
   ix1654 : oai21 port map ( Y=>nx1653, A0=>T01(0), A1=>T10(0), B0=>nx1655);
   ix1656 : nand02 port map ( Y=>nx1655, A0=>T10(0), A1=>T01(0));
   ix1658 : oai21 port map ( Y=>nx1657, A0=>T12(0), A1=>T21(0), B0=>nx1659);
   ix1660 : nand02 port map ( Y=>nx1659, A0=>T21(0), A1=>T12(0));
   ix919 : xnor2 port map ( Y=>nx918, A0=>nx1663, A1=>nx1667);
   ix1664 : oai21 port map ( Y=>nx1663, A0=>T02(0), A1=>T22(0), B0=>nx1665);
   ix1666 : nand02 port map ( Y=>nx1665, A0=>T22(0), A1=>T02(0));
   ix1668 : oai21 port map ( Y=>nx1667, A0=>T20(0), A1=>T00(0), B0=>nx1669);
   ix1670 : nand02 port map ( Y=>nx1669, A0=>T00(0), A1=>T20(0));
   ix1431 : mux21 port map ( Y=>nx1430, A0=>nx1673, A1=>nx2019, S0=>nx2483);
   ix1069 : xnor2 port map ( Y=>nx1068, A0=>nx1677, A1=>nx848);
   ix1678 : aoi22 port map ( Y=>nx1677, A0=>nx1679, A1=>nx852, B0=>nx1058, 
      B1=>nx854);
   ix1682 : xnor2 port map ( Y=>nx1681, A0=>nx644, A1=>T12(7));
   ix645 : oai22 port map ( Y=>nx644, A0=>nx1685, A1=>nx1687, B0=>nx1007, B1
      =>nx733);
   ix1686 : xnor2 port map ( Y=>nx1685, A0=>T02(7), A1=>T22(7));
   ix1688 : aoi22 port map ( Y=>nx1687, A0=>T22(6), A1=>T02(6), B0=>nx590, 
      B1=>nx632);
   ix633 : oai22 port map ( Y=>nx632, A0=>nx1693, A1=>nx1695, B0=>nx965, B1
      =>nx729);
   ix1694 : xnor2 port map ( Y=>nx1693, A0=>T02(5), A1=>T22(5));
   ix1696 : aoi22 port map ( Y=>nx1695, A0=>T22(4), A1=>T02(4), B0=>nx594, 
      B1=>nx620);
   ix621 : oai22 port map ( Y=>nx620, A0=>nx1701, A1=>nx1703, B0=>nx919, B1
      =>nx725);
   ix1702 : xnor2 port map ( Y=>nx1701, A0=>T02(3), A1=>T22(3));
   ix1704 : aoi22 port map ( Y=>nx1703, A0=>T22(2), A1=>T02(2), B0=>nx598, 
      B1=>nx608);
   ix609 : oai22 port map ( Y=>nx608, A0=>nx1709, A1=>nx1665, B0=>nx875, B1
      =>nx721);
   ix1710 : xnor2 port map ( Y=>nx1709, A0=>T02(1), A1=>T22(1));
   ix711 : oai22 port map ( Y=>nx710, A0=>nx1713, A1=>nx1717, B0=>nx1047, B1
      =>nx1715);
   ix1716 : xnor2 port map ( Y=>nx1715, A0=>nx1685, A1=>nx1687);
   ix1718 : aoi22 port map ( Y=>nx1717, A0=>T12(5), A1=>nx652, B0=>nx654, B1
      =>nx698);
   ix653 : xnor2 port map ( Y=>nx652, A0=>nx1721, A1=>nx632);
   ix1722 : xnor2 port map ( Y=>nx1721, A0=>T02(6), A1=>T22(6));
   ix699 : oai22 port map ( Y=>nx698, A0=>nx1727, A1=>nx1731, B0=>nx1057, B1
      =>nx1729);
   ix1730 : xnor2 port map ( Y=>nx1729, A0=>nx1693, A1=>nx1695);
   ix1732 : aoi22 port map ( Y=>nx1731, A0=>T12(3), A1=>nx660, B0=>nx662, B1
      =>nx686);
   ix661 : xnor2 port map ( Y=>nx660, A0=>nx1735, A1=>nx620);
   ix1736 : xnor2 port map ( Y=>nx1735, A0=>T02(4), A1=>T22(4));
   ix687 : oai22 port map ( Y=>nx686, A0=>nx1741, A1=>nx1745, B0=>nx1067, B1
      =>nx1743);
   ix1744 : xnor2 port map ( Y=>nx1743, A0=>nx1701, A1=>nx1703);
   ix1746 : aoi22 port map ( Y=>nx1745, A0=>T12(1), A1=>nx668, B0=>nx670, B1
      =>nx674);
   ix669 : xnor2 port map ( Y=>nx668, A0=>nx1749, A1=>nx608);
   ix1750 : xnor2 port map ( Y=>nx1749, A0=>T02(2), A1=>T22(2));
   ix1758 : xnor2 port map ( Y=>nx1757, A0=>nx1709, A1=>nx1665);
   ix853 : xnor2 port map ( Y=>nx852, A0=>nx1761, A1=>nx840);
   ix1762 : xnor2 port map ( Y=>nx1761, A0=>nx774, A1=>T10(7));
   ix775 : oai22 port map ( Y=>nx774, A0=>nx1765, A1=>nx1767, B0=>nx731, B1
      =>nx1009);
   ix1766 : xnor2 port map ( Y=>nx1765, A0=>T00(7), A1=>T20(7));
   ix1768 : aoi22 port map ( Y=>nx1767, A0=>T00(6), A1=>T20(6), B0=>nx720, 
      B1=>nx762);
   ix763 : oai22 port map ( Y=>nx762, A0=>nx1773, A1=>nx1775, B0=>nx727, B1
      =>nx967);
   ix1774 : xnor2 port map ( Y=>nx1773, A0=>T00(5), A1=>T20(5));
   ix1776 : aoi22 port map ( Y=>nx1775, A0=>T00(4), A1=>T20(4), B0=>nx724, 
      B1=>nx750);
   ix751 : oai22 port map ( Y=>nx750, A0=>nx1781, A1=>nx1783, B0=>nx723, B1
      =>nx921);
   ix1782 : xnor2 port map ( Y=>nx1781, A0=>T00(3), A1=>T20(3));
   ix1784 : aoi22 port map ( Y=>nx1783, A0=>T00(2), A1=>T20(2), B0=>nx728, 
      B1=>nx738);
   ix739 : oai22 port map ( Y=>nx738, A0=>nx1789, A1=>nx1669, B0=>nx719, B1
      =>nx877);
   ix1790 : xnor2 port map ( Y=>nx1789, A0=>T00(1), A1=>T20(1));
   ix841 : oai22 port map ( Y=>nx840, A0=>nx1793, A1=>nx1799, B0=>nx1797, B1
      =>nx1795);
   ix1796 : xnor2 port map ( Y=>nx1795, A0=>nx1765, A1=>nx1767);
   ix1798 : inv01 port map ( Y=>nx1797, A=>T10(6));
   ix1800 : aoi22 port map ( Y=>nx1799, A0=>T10(5), A1=>nx782, B0=>nx784, B1
      =>nx828);
   ix783 : xnor2 port map ( Y=>nx782, A0=>nx1803, A1=>nx762);
   ix1804 : xnor2 port map ( Y=>nx1803, A0=>T00(6), A1=>T20(6));
   ix829 : oai22 port map ( Y=>nx828, A0=>nx1809, A1=>nx1815, B0=>nx1813, B1
      =>nx1811);
   ix1812 : xnor2 port map ( Y=>nx1811, A0=>nx1773, A1=>nx1775);
   ix1814 : inv01 port map ( Y=>nx1813, A=>T10(4));
   ix1816 : aoi22 port map ( Y=>nx1815, A0=>T10(3), A1=>nx790, B0=>nx792, B1
      =>nx816);
   ix791 : xnor2 port map ( Y=>nx790, A0=>nx1819, A1=>nx750);
   ix1820 : xnor2 port map ( Y=>nx1819, A0=>T00(4), A1=>T20(4));
   ix817 : oai22 port map ( Y=>nx816, A0=>nx1825, A1=>nx1831, B0=>nx1829, B1
      =>nx1827);
   ix1828 : xnor2 port map ( Y=>nx1827, A0=>nx1781, A1=>nx1783);
   ix1830 : inv01 port map ( Y=>nx1829, A=>T10(2));
   ix1832 : aoi22 port map ( Y=>nx1831, A0=>T10(1), A1=>nx798, B0=>nx800, B1
      =>nx804);
   ix799 : xnor2 port map ( Y=>nx798, A0=>nx1835, A1=>nx738);
   ix1836 : xnor2 port map ( Y=>nx1835, A0=>T00(2), A1=>T20(2));
   ix1844 : xnor2 port map ( Y=>nx1843, A0=>nx1789, A1=>nx1669);
   ix1059 : oai22 port map ( Y=>nx1058, A0=>nx1847, A1=>nx1931, B0=>nx856, 
      B1=>nx1941);
   ix1848 : aoi22 port map ( Y=>nx1847, A0=>nx1849, A1=>nx864, B0=>nx1042, 
      B1=>nx866);
   ix1852 : xnor2 port map ( Y=>nx1851, A0=>nx652, A1=>T12(5));
   ix865 : xnor2 port map ( Y=>nx864, A0=>nx1855, A1=>nx828);
   ix1856 : xnor2 port map ( Y=>nx1855, A0=>nx782, A1=>T10(5));
   ix1043 : oai22 port map ( Y=>nx1042, A0=>nx1859, A1=>nx1915, B0=>nx868, 
      B1=>nx1925);
   ix1860 : aoi22 port map ( Y=>nx1859, A0=>nx1861, A1=>nx876, B0=>nx1026, 
      B1=>nx878);
   ix1864 : xnor2 port map ( Y=>nx1863, A0=>nx660, A1=>T12(3));
   ix877 : xnor2 port map ( Y=>nx876, A0=>nx1867, A1=>nx816);
   ix1868 : xnor2 port map ( Y=>nx1867, A0=>nx790, A1=>T10(3));
   ix1027 : oai22 port map ( Y=>nx1026, A0=>nx1871, A1=>nx1899, B0=>nx880, 
      B1=>nx1909);
   ix1872 : aoi22 port map ( Y=>nx1871, A0=>nx1010, A1=>nx890, B0=>nx1897, 
      B1=>nx888);
   ix1011 : oai22 port map ( Y=>nx1010, A0=>nx1875, A1=>nx1879, B0=>nx896, 
      B1=>nx1885);
   ix1876 : nor02 port map ( Y=>nx1875, A0=>nx1877, A1=>nx918);
   ix1878 : nor02 port map ( Y=>nx1877, A0=>nx918, A1=>nx1667);
   ix897 : xnor2 port map ( Y=>nx896, A0=>T12(0), A1=>nx1757);
   ix903 : xnor2 port map ( Y=>nx902, A0=>T10(0), A1=>nx1843);
   ix891 : xnor2 port map ( Y=>nx890, A0=>nx886, A1=>nx888);
   ix887 : xnor2 port map ( Y=>nx886, A0=>nx1891, A1=>nx674);
   ix1892 : xnor2 port map ( Y=>nx1891, A0=>nx668, A1=>T12(1));
   ix889 : xnor2 port map ( Y=>nx888, A0=>nx1895, A1=>nx804);
   ix1896 : xnor2 port map ( Y=>nx1895, A0=>nx798, A1=>T10(1));
   ix881 : xnor2 port map ( Y=>nx880, A0=>nx666, A1=>nx1745);
   ix667 : xnor2 port map ( Y=>nx666, A0=>nx1743, A1=>T12(2));
   ix883 : xnor2 port map ( Y=>nx882, A0=>nx796, A1=>nx1831);
   ix797 : xnor2 port map ( Y=>nx796, A0=>nx1827, A1=>T10(2));
   ix879 : xnor2 port map ( Y=>nx878, A0=>nx874, A1=>nx876);
   ix875 : xnor2 port map ( Y=>nx874, A0=>nx1863, A1=>nx686);
   ix869 : xnor2 port map ( Y=>nx868, A0=>nx658, A1=>nx1731);
   ix659 : xnor2 port map ( Y=>nx658, A0=>nx1729, A1=>T12(4));
   ix871 : xnor2 port map ( Y=>nx870, A0=>nx788, A1=>nx1815);
   ix789 : xnor2 port map ( Y=>nx788, A0=>nx1811, A1=>T10(4));
   ix867 : xnor2 port map ( Y=>nx866, A0=>nx862, A1=>nx864);
   ix863 : xnor2 port map ( Y=>nx862, A0=>nx1851, A1=>nx698);
   ix857 : xnor2 port map ( Y=>nx856, A0=>nx650, A1=>nx1717);
   ix651 : xnor2 port map ( Y=>nx650, A0=>nx1715, A1=>T12(6));
   ix859 : xnor2 port map ( Y=>nx858, A0=>nx780, A1=>nx1799);
   ix781 : xnor2 port map ( Y=>nx780, A0=>nx1795, A1=>T10(6));
   ix855 : xnor2 port map ( Y=>nx854, A0=>nx850, A1=>nx852);
   ix851 : xnor2 port map ( Y=>nx850, A0=>nx1681, A1=>nx710);
   ix849 : xnor2 port map ( Y=>nx848, A0=>nx1949, A1=>nx1953);
   ix1950 : aoi22 port map ( Y=>nx1949, A0=>T12(7), A1=>nx644, B0=>nx646, B1
      =>nx710);
   ix1954 : aoi22 port map ( Y=>nx1953, A0=>T10(7), A1=>nx774, B0=>nx776, B1
      =>nx840);
   ix1139 : xnor2 port map ( Y=>nx1138, A0=>nx848, A1=>nx1959);
   ix1960 : aoi22 port map ( Y=>nx1959, A0=>nx850, A1=>nx1961, B0=>nx854, B1
      =>nx1128);
   ix1129 : oai22 port map ( Y=>nx1128, A0=>nx1931, A1=>nx1965, B0=>nx1989, 
      B1=>nx858);
   ix1966 : aoi22 port map ( Y=>nx1965, A0=>nx862, A1=>nx1967, B0=>nx866, B1
      =>nx1112);
   ix1113 : oai22 port map ( Y=>nx1112, A0=>nx1915, A1=>nx1971, B0=>nx1987, 
      B1=>nx870);
   ix1972 : aoi22 port map ( Y=>nx1971, A0=>nx874, A1=>nx1973, B0=>nx878, B1
      =>nx1096);
   ix1097 : oai22 port map ( Y=>nx1096, A0=>nx1899, A1=>nx1977, B0=>nx1985, 
      B1=>nx882);
   ix1978 : aoi22 port map ( Y=>nx1977, A0=>nx886, A1=>nx1979, B0=>nx890, B1
      =>nx1080);
   ix1081 : oai22 port map ( Y=>nx1080, A0=>nx1879, A1=>nx1877, B0=>nx1983, 
      B1=>nx902);
   ix995 : mux21 port map ( Y=>nx994, A0=>nx1949, A1=>nx1993, S0=>nx848);
   ix1994 : mux21 port map ( Y=>nx1993, A0=>nx850, A1=>nx978, S0=>nx854);
   ix979 : mux21 port map ( Y=>nx978, A0=>nx1989, A1=>nx1997, S0=>nx860);
   ix1998 : mux21 port map ( Y=>nx1997, A0=>nx862, A1=>nx962, S0=>nx866);
   ix963 : mux21 port map ( Y=>nx962, A0=>nx1987, A1=>nx2001, S0=>nx872);
   ix2002 : mux21 port map ( Y=>nx2001, A0=>nx874, A1=>nx946, S0=>nx878);
   ix947 : mux21 port map ( Y=>nx946, A0=>nx1985, A1=>nx2005, S0=>nx884);
   ix2006 : mux21 port map ( Y=>nx2005, A0=>nx886, A1=>nx930, S0=>nx890);
   ix931 : mux21_ni port map ( Y=>nx930, A0=>nx896, A1=>nx922, S0=>nx904);
   ix923 : nor02 port map ( Y=>nx922, A0=>nx1663, A1=>nx918);
   ix905 : xnor2 port map ( Y=>nx904, A0=>nx896, A1=>nx902);
   ix885 : xnor2 port map ( Y=>nx884, A0=>nx880, A1=>nx882);
   ix873 : xnor2 port map ( Y=>nx872, A0=>nx868, A1=>nx870);
   ix861 : xnor2 port map ( Y=>nx860, A0=>nx856, A1=>nx858);
   ix2020 : mux21 port map ( Y=>nx2019, A0=>nx1156, A1=>nx1414, S0=>nx2467);
   ix2024 : xnor2 port map ( Y=>nx2023, A0=>nx1058, A1=>nx854);
   ix2026 : xnor2 port map ( Y=>nx2025, A0=>nx854, A1=>nx1128);
   ix1415 : mux21 port map ( Y=>nx1414, A0=>nx2029, A1=>nx2035, S0=>nx2451);
   ix1173 : xnor2 port map ( Y=>nx1172, A0=>nx1847, A1=>nx860);
   ix1179 : xnor2 port map ( Y=>nx1178, A0=>nx860, A1=>nx1965);
   ix2036 : mux21 port map ( Y=>nx2035, A0=>nx1208, A1=>nx1398, S0=>nx2435);
   ix2040 : xnor2 port map ( Y=>nx2039, A0=>nx1042, A1=>nx866);
   ix2042 : xnor2 port map ( Y=>nx2041, A0=>nx866, A1=>nx1112);
   ix1399 : mux21 port map ( Y=>nx1398, A0=>nx2045, A1=>nx2051, S0=>nx2419);
   ix1225 : xnor2 port map ( Y=>nx1224, A0=>nx1859, A1=>nx872);
   ix1231 : xnor2 port map ( Y=>nx1230, A0=>nx872, A1=>nx1971);
   ix2052 : mux21 port map ( Y=>nx2051, A0=>nx1260, A1=>nx1382, S0=>nx2403);
   ix2056 : xnor2 port map ( Y=>nx2055, A0=>nx1026, A1=>nx878);
   ix2058 : xnor2 port map ( Y=>nx2057, A0=>nx878, A1=>nx1096);
   ix1383 : mux21 port map ( Y=>nx1382, A0=>nx2061, A1=>nx2067, S0=>nx2387);
   ix1277 : xnor2 port map ( Y=>nx1276, A0=>nx1871, A1=>nx884);
   ix1283 : xnor2 port map ( Y=>nx1282, A0=>nx884, A1=>nx1977);
   ix2068 : mux21 port map ( Y=>nx2067, A0=>nx1312, A1=>nx1366, S0=>nx2369);
   ix2072 : xnor2 port map ( Y=>nx2071, A0=>nx1010, A1=>nx890);
   ix2074 : xnor2 port map ( Y=>nx2073, A0=>nx890, A1=>nx1080);
   ix1367 : mux21 port map ( Y=>nx1366, A0=>nx2077, A1=>nx2083, S0=>nx2087);
   ix1329 : xnor2 port map ( Y=>nx1328, A0=>nx1875, A1=>nx904);
   ix1335 : xnor2 port map ( Y=>nx1334, A0=>nx904, A1=>nx1877);
   ix2084 : nand02 port map ( Y=>nx2083, A0=>nx2085, A1=>nx362);
   ix2088 : xnor2 port map ( Y=>nx2087, A0=>nx2077, A1=>nx2089);
   ix2090 : mux21 port map ( Y=>nx2089, A0=>nx1340, A1=>nx1346, S0=>nx2775);
   ix1341 : xnor2 port map ( Y=>nx1340, A0=>nx2093, A1=>nx348);
   ix2094 : nor02 port map ( Y=>nx2093, A0=>nx2095, A1=>nx362);
   ix2096 : nor02 port map ( Y=>nx2095, A0=>nx362, A1=>nx1657);
   ix349 : xnor2 port map ( Y=>nx348, A0=>nx340, A1=>nx346);
   ix341 : xnor2 port map ( Y=>nx340, A0=>T00(0), A1=>nx2101);
   ix2102 : xnor2 port map ( Y=>nx2101, A0=>nx2103, A1=>nx1655);
   ix2104 : xnor2 port map ( Y=>nx2103, A0=>T10(1), A1=>T01(1));
   ix347 : xnor2 port map ( Y=>nx346, A0=>T22(0), A1=>nx2107);
   ix2108 : xnor2 port map ( Y=>nx2107, A0=>nx2109, A1=>nx1659);
   ix2110 : xnor2 port map ( Y=>nx2109, A0=>T21(1), A1=>T12(1));
   ix1347 : xnor2 port map ( Y=>nx1346, A0=>nx348, A1=>nx2095);
   ix439 : mux21 port map ( Y=>nx438, A0=>nx2115, A1=>nx2197, S0=>nx292);
   ix2116 : aoi22 port map ( Y=>nx2115, A0=>T00(7), A1=>nx88, B0=>nx90, B1=>
      nx154);
   ix89 : oai22 port map ( Y=>nx88, A0=>nx2119, A1=>nx2121, B0=>nx1169, B1=>
      nx737);
   ix2120 : xnor2 port map ( Y=>nx2119, A0=>T10(7), A1=>T01(7));
   ix2122 : aoi22 port map ( Y=>nx2121, A0=>T10(6), A1=>T01(6), B0=>nx34, B1
      =>nx76);
   ix77 : oai22 port map ( Y=>nx76, A0=>nx2127, A1=>nx2129, B0=>nx1167, B1=>
      nx755);
   ix2128 : xnor2 port map ( Y=>nx2127, A0=>T10(5), A1=>T01(5));
   ix2130 : aoi22 port map ( Y=>nx2129, A0=>T10(4), A1=>T01(4), B0=>nx38, B1
      =>nx64);
   ix65 : oai22 port map ( Y=>nx64, A0=>nx2135, A1=>nx2137, B0=>nx1165, B1=>
      nx773);
   ix2136 : xnor2 port map ( Y=>nx2135, A0=>T10(3), A1=>T01(3));
   ix2138 : aoi22 port map ( Y=>nx2137, A0=>T10(2), A1=>T01(2), B0=>nx42, B1
      =>nx52);
   ix53 : oai22 port map ( Y=>nx52, A0=>nx2103, A1=>nx1655, B0=>nx1163, B1=>
      nx791);
   ix155 : oai22 port map ( Y=>nx154, A0=>nx2147, A1=>nx2153, B0=>nx2151, B1
      =>nx2149);
   ix2150 : xnor2 port map ( Y=>nx2149, A0=>nx2119, A1=>nx2121);
   ix2152 : inv01 port map ( Y=>nx2151, A=>T00(6));
   ix2154 : aoi22 port map ( Y=>nx2153, A0=>T00(5), A1=>nx96, B0=>nx98, B1=>
      nx142);
   ix97 : xnor2 port map ( Y=>nx96, A0=>nx2157, A1=>nx76);
   ix2158 : xnor2 port map ( Y=>nx2157, A0=>T10(6), A1=>T01(6));
   ix143 : oai22 port map ( Y=>nx142, A0=>nx2163, A1=>nx2169, B0=>nx2167, B1
      =>nx2165);
   ix2166 : xnor2 port map ( Y=>nx2165, A0=>nx2127, A1=>nx2129);
   ix2168 : inv01 port map ( Y=>nx2167, A=>T00(4));
   ix2170 : aoi22 port map ( Y=>nx2169, A0=>T00(3), A1=>nx104, B0=>nx106, B1
      =>nx130);
   ix105 : xnor2 port map ( Y=>nx104, A0=>nx2173, A1=>nx64);
   ix2174 : xnor2 port map ( Y=>nx2173, A0=>T10(4), A1=>T01(4));
   ix131 : oai22 port map ( Y=>nx130, A0=>nx2179, A1=>nx2185, B0=>nx2183, B1
      =>nx2181);
   ix2182 : xnor2 port map ( Y=>nx2181, A0=>nx2135, A1=>nx2137);
   ix2184 : inv01 port map ( Y=>nx2183, A=>T00(2));
   ix2186 : aoi22 port map ( Y=>nx2185, A0=>T00(1), A1=>nx112, B0=>nx114, B1
      =>nx118);
   ix113 : xnor2 port map ( Y=>nx112, A0=>nx2189, A1=>nx52);
   ix2190 : xnor2 port map ( Y=>nx2189, A0=>T10(2), A1=>T01(2));
   ix2198 : mux21 port map ( Y=>nx2197, A0=>nx294, A1=>nx422, S0=>nx298);
   ix295 : xnor2 port map ( Y=>nx294, A0=>nx2201, A1=>nx154);
   ix2202 : xnor2 port map ( Y=>nx2201, A0=>nx88, A1=>T00(7));
   ix423 : mux21 port map ( Y=>nx422, A0=>nx2205, A1=>nx2209, S0=>nx304);
   ix95 : xnor2 port map ( Y=>nx94, A0=>nx2149, A1=>T00(6));
   ix2210 : mux21 port map ( Y=>nx2209, A0=>nx306, A1=>nx406, S0=>nx310);
   ix307 : xnor2 port map ( Y=>nx306, A0=>nx2213, A1=>nx142);
   ix2214 : xnor2 port map ( Y=>nx2213, A0=>nx96, A1=>T00(5));
   ix407 : mux21 port map ( Y=>nx406, A0=>nx2217, A1=>nx2221, S0=>nx316);
   ix103 : xnor2 port map ( Y=>nx102, A0=>nx2165, A1=>T00(4));
   ix2222 : mux21 port map ( Y=>nx2221, A0=>nx318, A1=>nx390, S0=>nx322);
   ix319 : xnor2 port map ( Y=>nx318, A0=>nx2225, A1=>nx130);
   ix2226 : xnor2 port map ( Y=>nx2225, A0=>nx104, A1=>T00(3));
   ix391 : mux21 port map ( Y=>nx390, A0=>nx2229, A1=>nx2233, S0=>nx328);
   ix111 : xnor2 port map ( Y=>nx110, A0=>nx2181, A1=>T00(2));
   ix2234 : mux21 port map ( Y=>nx2233, A0=>nx330, A1=>nx374, S0=>nx334);
   ix331 : xnor2 port map ( Y=>nx330, A0=>nx2237, A1=>nx118);
   ix2238 : xnor2 port map ( Y=>nx2237, A0=>nx112, A1=>T00(1));
   ix375 : mux21_ni port map ( Y=>nx374, A0=>nx340, A1=>nx366, S0=>nx348);
   ix367 : nor02 port map ( Y=>nx366, A0=>nx1653, A1=>nx362);
   ix335 : xnor2 port map ( Y=>nx334, A0=>nx330, A1=>nx332);
   ix333 : xnor2 port map ( Y=>nx332, A0=>nx2247, A1=>nx248);
   ix2248 : xnor2 port map ( Y=>nx2247, A0=>nx242, A1=>T22(1));
   ix243 : xnor2 port map ( Y=>nx242, A0=>nx2251, A1=>nx182);
   ix2252 : xnor2 port map ( Y=>nx2251, A0=>T21(2), A1=>T12(2));
   ix183 : oai22 port map ( Y=>nx182, A0=>nx2109, A1=>nx1659, B0=>nx905, B1
      =>nx1075);
   ix329 : xnor2 port map ( Y=>nx328, A0=>nx324, A1=>nx326);
   ix325 : xnor2 port map ( Y=>nx324, A0=>nx110, A1=>nx2185);
   ix327 : xnor2 port map ( Y=>nx326, A0=>nx240, A1=>nx2275);
   ix241 : xnor2 port map ( Y=>nx240, A0=>nx2267, A1=>T22(2));
   ix2268 : xnor2 port map ( Y=>nx2267, A0=>nx2269, A1=>nx2271);
   ix2270 : xnor2 port map ( Y=>nx2269, A0=>T21(3), A1=>T12(3));
   ix2272 : aoi22 port map ( Y=>nx2271, A0=>T21(2), A1=>T12(2), B0=>nx172, 
      B1=>nx182);
   ix2276 : aoi22 port map ( Y=>nx2275, A0=>T22(1), A1=>nx242, B0=>nx244, B1
      =>nx248);
   ix323 : xnor2 port map ( Y=>nx322, A0=>nx318, A1=>nx320);
   ix321 : xnor2 port map ( Y=>nx320, A0=>nx2283, A1=>nx260);
   ix2284 : xnor2 port map ( Y=>nx2283, A0=>nx234, A1=>T22(3));
   ix235 : xnor2 port map ( Y=>nx234, A0=>nx2287, A1=>nx194);
   ix2288 : xnor2 port map ( Y=>nx2287, A0=>T21(4), A1=>T12(4));
   ix195 : oai22 port map ( Y=>nx194, A0=>nx2269, A1=>nx2271, B0=>nx951, B1
      =>nx1077);
   ix261 : oai22 port map ( Y=>nx260, A0=>nx2293, A1=>nx2275, B0=>nx899, B1
      =>nx2267);
   ix317 : xnor2 port map ( Y=>nx316, A0=>nx312, A1=>nx314);
   ix313 : xnor2 port map ( Y=>nx312, A0=>nx102, A1=>nx2169);
   ix315 : xnor2 port map ( Y=>nx314, A0=>nx232, A1=>nx2311);
   ix233 : xnor2 port map ( Y=>nx232, A0=>nx2303, A1=>T22(4));
   ix2304 : xnor2 port map ( Y=>nx2303, A0=>nx2305, A1=>nx2307);
   ix2306 : xnor2 port map ( Y=>nx2305, A0=>T21(5), A1=>T12(5));
   ix2308 : aoi22 port map ( Y=>nx2307, A0=>T21(4), A1=>T12(4), B0=>nx168, 
      B1=>nx194);
   ix2312 : aoi22 port map ( Y=>nx2311, A0=>T22(3), A1=>nx234, B0=>nx236, B1
      =>nx260);
   ix311 : xnor2 port map ( Y=>nx310, A0=>nx306, A1=>nx308);
   ix309 : xnor2 port map ( Y=>nx308, A0=>nx2319, A1=>nx272);
   ix2320 : xnor2 port map ( Y=>nx2319, A0=>nx226, A1=>T22(5));
   ix227 : xnor2 port map ( Y=>nx226, A0=>nx2323, A1=>nx206);
   ix2324 : xnor2 port map ( Y=>nx2323, A0=>T21(6), A1=>T12(6));
   ix207 : oai22 port map ( Y=>nx206, A0=>nx2305, A1=>nx2307, B0=>nx997, B1
      =>nx1079);
   ix273 : oai22 port map ( Y=>nx272, A0=>nx2329, A1=>nx2311, B0=>nx945, B1
      =>nx2303);
   ix305 : xnor2 port map ( Y=>nx304, A0=>nx300, A1=>nx302);
   ix301 : xnor2 port map ( Y=>nx300, A0=>nx94, A1=>nx2153);
   ix303 : xnor2 port map ( Y=>nx302, A0=>nx224, A1=>nx2347);
   ix225 : xnor2 port map ( Y=>nx224, A0=>nx2339, A1=>T22(6));
   ix2340 : xnor2 port map ( Y=>nx2339, A0=>nx2341, A1=>nx2343);
   ix2342 : xnor2 port map ( Y=>nx2341, A0=>T21(7), A1=>T12(7));
   ix2344 : aoi22 port map ( Y=>nx2343, A0=>T21(6), A1=>T12(6), B0=>nx164, 
      B1=>nx206);
   ix2348 : aoi22 port map ( Y=>nx2347, A0=>T22(5), A1=>nx226, B0=>nx228, B1
      =>nx272);
   ix299 : xnor2 port map ( Y=>nx298, A0=>nx294, A1=>nx296);
   ix297 : xnor2 port map ( Y=>nx296, A0=>nx2355, A1=>nx284);
   ix2356 : xnor2 port map ( Y=>nx2355, A0=>nx218, A1=>T22(7));
   ix219 : oai22 port map ( Y=>nx218, A0=>nx2341, A1=>nx2343, B0=>nx1023, B1
      =>nx1081);
   ix285 : oai22 port map ( Y=>nx284, A0=>nx2361, A1=>nx2347, B0=>nx991, B1
      =>nx2339);
   ix293 : xnor2 port map ( Y=>nx292, A0=>nx2115, A1=>nx2365);
   ix2366 : aoi22 port map ( Y=>nx2365, A0=>T22(7), A1=>nx218, B0=>nx220, B1
      =>nx284);
   ix2370 : xnor2 port map ( Y=>nx2369, A0=>nx1312, A1=>nx1324);
   ix1325 : mux21 port map ( Y=>nx1324, A0=>nx2373, A1=>nx2381, S0=>nx2775);
   ix2374 : xnor2 port map ( Y=>nx2373, A0=>nx454, A1=>nx334);
   ix455 : oai22 port map ( Y=>nx454, A0=>nx2093, A1=>nx2377, B0=>nx340, B1
      =>nx2379);
   ix2382 : xnor2 port map ( Y=>nx2381, A0=>nx334, A1=>nx524);
   ix525 : oai22 port map ( Y=>nx524, A0=>nx2377, A1=>nx2095, B0=>nx2385, B1
      =>nx346);
   ix2388 : xnor2 port map ( Y=>nx2387, A0=>nx2061, A1=>nx2389);
   ix2390 : mux21 port map ( Y=>nx2389, A0=>nx1288, A1=>nx1294, S0=>nx2775);
   ix1289 : xnor2 port map ( Y=>nx1288, A0=>nx2393, A1=>nx328);
   ix2394 : aoi22 port map ( Y=>nx2393, A0=>nx454, A1=>nx334, B0=>nx2395, B1
      =>nx332);
   ix1295 : xnor2 port map ( Y=>nx1294, A0=>nx328, A1=>nx2399);
   ix2400 : aoi22 port map ( Y=>nx2399, A0=>nx330, A1=>nx2401, B0=>nx334, B1
      =>nx524);
   ix2404 : xnor2 port map ( Y=>nx2403, A0=>nx1260, A1=>nx1272);
   ix1273 : mux21 port map ( Y=>nx1272, A0=>nx2407, A1=>nx2415, S0=>nx2775);
   ix2408 : xnor2 port map ( Y=>nx2407, A0=>nx470, A1=>nx322);
   ix471 : oai22 port map ( Y=>nx470, A0=>nx2393, A1=>nx2411, B0=>nx324, B1
      =>nx2413);
   ix2416 : xnor2 port map ( Y=>nx2415, A0=>nx322, A1=>nx540);
   ix541 : oai22 port map ( Y=>nx540, A0=>nx2411, A1=>nx2399, B0=>nx2229, B1
      =>nx326);
   ix2420 : xnor2 port map ( Y=>nx2419, A0=>nx2045, A1=>nx2421);
   ix2422 : mux21 port map ( Y=>nx2421, A0=>nx1236, A1=>nx1242, S0=>nx2775);
   ix1237 : xnor2 port map ( Y=>nx1236, A0=>nx2425, A1=>nx316);
   ix2426 : aoi22 port map ( Y=>nx2425, A0=>nx2427, A1=>nx320, B0=>nx470, B1
      =>nx322);
   ix1243 : xnor2 port map ( Y=>nx1242, A0=>nx316, A1=>nx2431);
   ix2432 : aoi22 port map ( Y=>nx2431, A0=>nx318, A1=>nx2433, B0=>nx322, B1
      =>nx540);
   ix2436 : xnor2 port map ( Y=>nx2435, A0=>nx1208, A1=>nx1220);
   ix1221 : mux21 port map ( Y=>nx1220, A0=>nx2439, A1=>nx2447, S0=>nx2775);
   ix2440 : xnor2 port map ( Y=>nx2439, A0=>nx486, A1=>nx310);
   ix487 : oai22 port map ( Y=>nx486, A0=>nx2425, A1=>nx2443, B0=>nx312, B1
      =>nx2445);
   ix2448 : xnor2 port map ( Y=>nx2447, A0=>nx310, A1=>nx556);
   ix557 : oai22 port map ( Y=>nx556, A0=>nx2443, A1=>nx2431, B0=>nx2217, B1
      =>nx314);
   ix2452 : xnor2 port map ( Y=>nx2451, A0=>nx2029, A1=>nx2453);
   ix2454 : mux21 port map ( Y=>nx2453, A0=>nx1184, A1=>nx1190, S0=>nx2777);
   ix1185 : xnor2 port map ( Y=>nx1184, A0=>nx2457, A1=>nx304);
   ix2458 : aoi22 port map ( Y=>nx2457, A0=>nx2459, A1=>nx308, B0=>nx486, B1
      =>nx310);
   ix1191 : xnor2 port map ( Y=>nx1190, A0=>nx304, A1=>nx2463);
   ix2464 : aoi22 port map ( Y=>nx2463, A0=>nx306, A1=>nx2465, B0=>nx310, B1
      =>nx556);
   ix2468 : xnor2 port map ( Y=>nx2467, A0=>nx1156, A1=>nx1168);
   ix1169 : mux21 port map ( Y=>nx1168, A0=>nx2471, A1=>nx2479, S0=>nx2777);
   ix2472 : xnor2 port map ( Y=>nx2471, A0=>nx502, A1=>nx298);
   ix503 : oai22 port map ( Y=>nx502, A0=>nx2457, A1=>nx2475, B0=>nx300, B1
      =>nx2477);
   ix2480 : xnor2 port map ( Y=>nx2479, A0=>nx298, A1=>nx572);
   ix573 : oai22 port map ( Y=>nx572, A0=>nx2475, A1=>nx2463, B0=>nx2205, B1
      =>nx302);
   ix2484 : xnor2 port map ( Y=>nx2483, A0=>nx1673, A1=>nx2485);
   ix2486 : mux21 port map ( Y=>nx2485, A0=>nx512, A1=>nx582, S0=>nx2777);
   ix513 : xnor2 port map ( Y=>nx512, A0=>nx2489, A1=>nx292);
   ix2490 : aoi22 port map ( Y=>nx2489, A0=>nx2491, A1=>nx296, B0=>nx502, B1
      =>nx298);
   ix584 : xnor2 port map ( Y=>nx582, A0=>nx292, A1=>nx2495);
   ix2496 : aoi22 port map ( Y=>nx2495, A0=>nx294, A1=>nx2497, B0=>nx298, B1
      =>nx572);
   ix3005 : mux21 port map ( Y=>nx3004, A0=>nx1770, A1=>nx2326, S0=>nx2797);
   ix2502 : xnor2 port map ( Y=>nx2501, A0=>nx2982, A1=>nx2990);
   ix2991 : mux21 port map ( Y=>nx2990, A0=>nx2089, A1=>nx2077, S0=>nx2783);
   ix2506 : xnor2 port map ( Y=>nx2505, A0=>nx1641, A1=>nx2507);
   ix2508 : mux21 port map ( Y=>nx2507, A0=>nx1324, A1=>nx1312, S0=>nx2783);
   ix2510 : xnor2 port map ( Y=>nx2509, A0=>nx2946, A1=>nx2954);
   ix2955 : mux21 port map ( Y=>nx2954, A0=>nx2389, A1=>nx2061, S0=>nx2783);
   ix2514 : xnor2 port map ( Y=>nx2513, A0=>nx1633, A1=>nx2515);
   ix2516 : mux21 port map ( Y=>nx2515, A0=>nx1272, A1=>nx1260, S0=>nx2783);
   ix2518 : xnor2 port map ( Y=>nx2517, A0=>nx2910, A1=>nx2918);
   ix2919 : mux21 port map ( Y=>nx2918, A0=>nx2421, A1=>nx2045, S0=>nx2783);
   ix2522 : xnor2 port map ( Y=>nx2521, A0=>nx1625, A1=>nx2523);
   ix2524 : mux21 port map ( Y=>nx2523, A0=>nx1220, A1=>nx1208, S0=>nx2785);
   ix2526 : xnor2 port map ( Y=>nx2525, A0=>nx2874, A1=>nx2882);
   ix2883 : mux21 port map ( Y=>nx2882, A0=>nx2453, A1=>nx2029, S0=>nx2785);
   ix2530 : xnor2 port map ( Y=>nx2529, A0=>nx1617, A1=>nx2531);
   ix2532 : mux21 port map ( Y=>nx2531, A0=>nx1168, A1=>nx1156, S0=>nx2785);
   ix2534 : xnor2 port map ( Y=>nx2533, A0=>nx2846, A1=>nx1438);
   ix1439 : nand02 port map ( Y=>nx1438, A0=>nx1673, A1=>nx2485);
   ix3503 : oai22 port map ( Y=>nx3502, A0=>nx2793, A1=>nx2547, B0=>nx2777, 
      B1=>nx2549);
   ix2548 : nand02 port map ( Y=>nx2547, A0=>nx2797, A1=>nx2813);
   ix3343 : nor02 port map ( Y=>nx3342, A0=>nx2555, A1=>nx2557);
   ix2556 : nor02 port map ( Y=>nx2555, A0=>nx2846, A1=>nx1438);
   ix2558 : nand02 port map ( Y=>nx2557, A0=>nx3108, A1=>nx3338);
   ix3339 : nor02 port map ( Y=>nx3338, A0=>nx2563, A1=>nx2565);
   ix2566 : aoi22 port map ( Y=>nx2565, A0=>nx3124, A1=>nx3154, B0=>nx3156, 
      B1=>nx3330);
   ix2572 : nand02 port map ( Y=>nx2571, A0=>nx2785, A1=>nx2803);
   ix3157 : xnor2 port map ( Y=>nx3156, A0=>nx3124, A1=>nx2587);
   ix2588 : aoi221 port map ( Y=>nx2587, A0=>nx2550, A1=>nx2799, B0=>nx586, 
      B1=>nx2801, C0=>nx3152);
   ix3153 : oai22 port map ( Y=>nx3152, A0=>nx1597, A1=>nx2547, B0=>nx1673, 
      B1=>nx2549);
   ix3331 : oai22 port map ( Y=>nx3330, A0=>nx2597, A1=>nx2605, B0=>nx2599, 
      B1=>nx2601);
   ix2598 : xnor2 port map ( Y=>nx2597, A0=>nx2599, A1=>nx2601);
   ix2602 : aoi221 port map ( Y=>nx2601, A0=>nx1168, A1=>nx2801, B0=>nx2564, 
      B1=>nx2799, C0=>nx3176);
   ix3177 : ao22 port map ( Y=>nx3176, A0=>nx2576, A1=>nx3140, B0=>nx1156, 
      B1=>nx3148);
   ix2606 : aoi22 port map ( Y=>nx2605, A0=>nx3188, A1=>nx3202, B0=>nx3204, 
      B1=>nx3318);
   ix3205 : xnor2 port map ( Y=>nx3204, A0=>nx3188, A1=>nx2619);
   ix2620 : aoi221 port map ( Y=>nx2619, A0=>nx2590, A1=>nx2799, B0=>nx1194, 
      B1=>nx2801, C0=>nx3200);
   ix3201 : oai22 port map ( Y=>nx3200, A0=>nx1565, A1=>nx2547, B0=>nx2029, 
      B1=>nx2549);
   ix3319 : oai22 port map ( Y=>nx3318, A0=>nx2627, A1=>nx2635, B0=>nx2629, 
      B1=>nx2631);
   ix2628 : xnor2 port map ( Y=>nx2627, A0=>nx2629, A1=>nx2631);
   ix2632 : aoi221 port map ( Y=>nx2631, A0=>nx1220, A1=>nx2801, B0=>nx2616, 
      B1=>nx2799, C0=>nx3224);
   ix3225 : ao22 port map ( Y=>nx3224, A0=>nx2628, A1=>nx3140, B0=>nx1208, 
      B1=>nx3148);
   ix2636 : aoi22 port map ( Y=>nx2635, A0=>nx3236, A1=>nx3250, B0=>nx3252, 
      B1=>nx3306);
   ix3253 : xnor2 port map ( Y=>nx3252, A0=>nx3236, A1=>nx2649);
   ix2650 : aoi221 port map ( Y=>nx2649, A0=>nx2642, A1=>nx2799, B0=>nx1246, 
      B1=>nx2801, C0=>nx3248);
   ix3249 : oai22 port map ( Y=>nx3248, A0=>nx1533, A1=>nx2547, B0=>nx2045, 
      B1=>nx2549);
   ix3307 : oai22 port map ( Y=>nx3306, A0=>nx2659, A1=>nx2667, B0=>nx2661, 
      B1=>nx2663);
   ix2660 : xnor2 port map ( Y=>nx2659, A0=>nx2661, A1=>nx2663);
   ix2664 : aoi221 port map ( Y=>nx2663, A0=>nx1272, A1=>nx3134, B0=>nx2668, 
      B1=>nx3128, C0=>nx3272);
   ix3273 : ao22 port map ( Y=>nx3272, A0=>nx2680, A1=>nx3140, B0=>nx1260, 
      B1=>nx3148);
   ix2672 : aoi221 port map ( Y=>nx2671, A0=>nx2694, A1=>nx3128, B0=>nx1298, 
      B1=>nx3134, C0=>nx3296);
   ix3297 : oai22 port map ( Y=>nx3296, A0=>nx1501, A1=>nx2547, B0=>nx2061, 
      B1=>nx2549);
   ix3475 : oai22 port map ( Y=>nx3474, A0=>nx3352, A1=>nx2683, B0=>nx2681, 
      B1=>THRESHOLD(9));
   ix3353 : xnor2 port map ( Y=>nx3352, A0=>nx2681, A1=>THRESHOLD(9));
   ix2682 : xnor2 port map ( Y=>nx2681, A0=>nx2555, A1=>nx2557);
   ix2684 : mux21 port map ( Y=>nx2683, A0=>nx3458, A1=>nx3358, S0=>nx3360);
   ix3459 : oai22 port map ( Y=>nx3458, A0=>nx3368, A1=>nx2691, B0=>nx2689, 
      B1=>THRESHOLD(7));
   ix3369 : xnor2 port map ( Y=>nx3368, A0=>nx2689, A1=>THRESHOLD(7));
   ix2690 : xnor2 port map ( Y=>nx2689, A0=>nx2563, A1=>nx2565);
   ix2692 : mux21 port map ( Y=>nx2691, A0=>nx3442, A1=>nx3370, S0=>nx3372);
   ix3443 : oai22 port map ( Y=>nx3442, A0=>nx3376, A1=>nx2699, B0=>nx2697, 
      B1=>THRESHOLD(5));
   ix3377 : xnor2 port map ( Y=>nx3376, A0=>nx2697, A1=>THRESHOLD(5));
   ix2698 : xnor2 port map ( Y=>nx2697, A0=>nx2597, A1=>nx2605);
   ix2700 : mux21 port map ( Y=>nx2699, A0=>nx3426, A1=>nx3378, S0=>nx3380);
   ix3427 : oai22 port map ( Y=>nx3426, A0=>nx3384, A1=>nx2707, B0=>nx2705, 
      B1=>THRESHOLD(3));
   ix3385 : xnor2 port map ( Y=>nx3384, A0=>nx2705, A1=>THRESHOLD(3));
   ix2706 : xnor2 port map ( Y=>nx2705, A0=>nx2627, A1=>nx2635);
   ix2708 : mux21 port map ( Y=>nx2707, A0=>nx3410, A1=>nx3386, S0=>nx3388);
   ix3411 : oai32 port map ( Y=>nx3410, A0=>nx3392, A1=>nx2715, A2=>
      THRESHOLD(0), B0=>nx2717, B1=>THRESHOLD(1));
   ix3393 : xor2 port map ( Y=>nx3392, A0=>nx3390, A1=>THRESHOLD(1));
   ix3391 : xnor2 port map ( Y=>nx3390, A0=>nx2659, A1=>nx3300);
   ix3301 : nor02 port map ( Y=>nx3300, A0=>nx2669, A1=>nx2671);
   ix2716 : xnor2 port map ( Y=>nx2715, A0=>nx2669, A1=>nx2671);
   ix3389 : xnor2 port map ( Y=>nx3388, A0=>nx2723, A1=>THRESHOLD(2));
   ix2724 : xnor2 port map ( Y=>nx2723, A0=>nx3252, A1=>nx3306);
   ix3381 : xnor2 port map ( Y=>nx3380, A0=>nx2727, A1=>THRESHOLD(4));
   ix2728 : xnor2 port map ( Y=>nx2727, A0=>nx3204, A1=>nx3318);
   ix3373 : xnor2 port map ( Y=>nx3372, A0=>nx2733, A1=>THRESHOLD(6));
   ix2734 : xnor2 port map ( Y=>nx2733, A0=>nx3156, A1=>nx3330);
   ix3361 : xnor2 port map ( Y=>nx3360, A0=>nx2739, A1=>THRESHOLD(8));
   ix2740 : xnor2 port map ( Y=>nx2739, A0=>nx3108, A1=>nx3338);
   ix2742 : xnor2 port map ( Y=>nx2741, A0=>nx3342, A1=>THRESHOLD(10));
   ix3513 : aoi21 port map ( Y=>DIRECTION(2), A0=>nx2547, A1=>nx2549, B0=>
      nx2747);
   ix2748 : mux21 port map ( Y=>nx2747, A0=>nx3342, A1=>nx3474, S0=>nx2741);
   fsm_inst_reg_state_4 : dffr port map ( Q=>O_VALID_dup0, QB=>OPEN, D=>
      fsm_inst_state_3, CLK=>CLOCK, R=>RESET);
   fsm_inst_reg_state_3 : dffr port map ( Q=>fsm_inst_state_3, QB=>OPEN, D=>
      fsm_inst_state_2, CLK=>CLOCK, R=>RESET);
   fsm_inst_reg_state_2 : dffr port map ( Q=>fsm_inst_state_2, QB=>OPEN, D=>
      nx18, CLK=>CLOCK, R=>RESET);
   ix19 : and02 port map ( Y=>nx18, A0=>I_VALID, A1=>READY_dup0);
   fsm_inst_reg_state_1 : dffr port map ( Q=>READY_dup0, QB=>OPEN, D=>nx12, 
      CLK=>CLOCK, R=>RESET);
   ix13 : or03 port map ( Y=>nx12, A0=>nx8, A1=>fsm_inst_state_0, A2=>
      O_VALID_dup0);
   ix9 : nor02ii port map ( Y=>nx8, A0=>I_VALID, A1=>READY_dup0);
   fsm_inst_reg_state_0 : dffs_ni port map ( Q=>fsm_inst_state_0, QB=>OPEN, 
      D=>nx580, CLK=>CLOCK, S=>RESET);
   ix2718 : inv01 port map ( Y=>nx2717, A=>nx3390);
   ix3387 : inv01 port map ( Y=>nx3386, A=>nx2723);
   ix3379 : inv01 port map ( Y=>nx3378, A=>nx2727);
   ix3371 : inv01 port map ( Y=>nx3370, A=>nx2733);
   ix3359 : inv01 port map ( Y=>nx3358, A=>nx2739);
   ix2668 : inv01 port map ( Y=>nx2667, A=>nx3300);
   ix3251 : inv01 port map ( Y=>nx3250, A=>nx2649);
   ix3203 : inv01 port map ( Y=>nx3202, A=>nx2619);
   ix3155 : inv01 port map ( Y=>nx3154, A=>nx2587);
   ix2550 : inv01 port map ( Y=>nx2549, A=>nx3148);
   ix3141 : inv01 port map ( Y=>nx3140, A=>nx2547);
   ix3135 : inv01 port map ( Y=>nx3134, A=>nx2571);
   ix3093 : inv01 port map ( Y=>nx3092, A=>nx1611);
   ix2695 : inv01 port map ( Y=>nx2694, A=>nx1441);
   ix2643 : inv01 port map ( Y=>nx2642, A=>nx1425);
   ix2591 : inv01 port map ( Y=>nx2590, A=>nx1409);
   ix2551 : inv01 port map ( Y=>nx2550, A=>nx1029);
   ix1466 : inv01 port map ( Y=>nx1465, A=>nx2326);
   ix1264 : inv01 port map ( Y=>nx1263, A=>nx2312);
   ix1268 : inv01 port map ( Y=>nx1267, A=>nx2310);
   ix1364 : inv01 port map ( Y=>nx1363, A=>nx2304);
   ix1360 : inv01 port map ( Y=>nx1359, A=>nx2296);
   ix1280 : inv01 port map ( Y=>nx1279, A=>nx2294);
   ix1282 : inv01 port map ( Y=>nx1281, A=>nx2292);
   ix1292 : inv01 port map ( Y=>nx1291, A=>nx2290);
   ix1366 : inv01 port map ( Y=>nx1365, A=>nx2288);
   ix1354 : inv01 port map ( Y=>nx1353, A=>nx2284);
   ix1240 : inv01 port map ( Y=>nx1239, A=>nx2282);
   ix1298 : inv01 port map ( Y=>nx1297, A=>nx2280);
   ix1308 : inv01 port map ( Y=>nx1307, A=>nx2278);
   ix1368 : inv01 port map ( Y=>nx1367, A=>nx2276);
   ix1348 : inv01 port map ( Y=>nx1347, A=>nx2272);
   ix1228 : inv01 port map ( Y=>nx1227, A=>nx2270);
   ix1314 : inv01 port map ( Y=>nx1313, A=>nx2268);
   ix1322 : inv01 port map ( Y=>nx1321, A=>nx2266);
   ix1370 : inv01 port map ( Y=>nx1369, A=>nx2264);
   ix1342 : inv01 port map ( Y=>nx1341, A=>nx2260);
   ix1036 : inv01 port map ( Y=>nx1035, A=>nx2258);
   ix2209 : inv01 port map ( Y=>nx2208, A=>nx1277);
   ix1204 : inv01 port map ( Y=>nx1203, A=>nx2204);
   ix2201 : inv01 port map ( Y=>nx2200, A=>nx1245);
   ix1190 : inv01 port map ( Y=>nx1189, A=>nx2196);
   ix2193 : inv01 port map ( Y=>nx2192, A=>nx1233);
   ix1174 : inv01 port map ( Y=>nx1173, A=>nx2188);
   ix2185 : inv01 port map ( Y=>nx2184, A=>nx1133);
   ix2137 : inv01 port map ( Y=>nx2136, A=>nx1213);
   ix2133 : inv01 port map ( Y=>nx2132, A=>nx1199);
   ix2129 : inv01 port map ( Y=>nx2128, A=>nx1183);
   ix2079 : inv01 port map ( Y=>nx2078, A=>nx1273);
   ix1114 : inv01 port map ( Y=>nx1113, A=>nx2074);
   ix2071 : inv01 port map ( Y=>nx2070, A=>nx1241);
   ix1100 : inv01 port map ( Y=>nx1099, A=>nx2066);
   ix2063 : inv01 port map ( Y=>nx2062, A=>nx1229);
   ix1086 : inv01 port map ( Y=>nx1085, A=>nx2058);
   ix2055 : inv01 port map ( Y=>nx2054, A=>nx1037);
   ix2007 : inv01 port map ( Y=>nx2006, A=>nx1121);
   ix2003 : inv01 port map ( Y=>nx2002, A=>nx1107);
   ix1999 : inv01 port map ( Y=>nx1998, A=>nx1093);
   ix680 : inv01 port map ( Y=>nx679, A=>nx1846);
   ix1490 : inv01 port map ( Y=>nx1489, A=>nx1756);
   ix1492 : inv01 port map ( Y=>nx1491, A=>nx1754);
   ix1498 : inv01 port map ( Y=>nx1497, A=>nx1748);
   ix1514 : inv01 port map ( Y=>nx1513, A=>nx1740);
   ix1508 : inv01 port map ( Y=>nx1507, A=>nx1738);
   ix1524 : inv01 port map ( Y=>nx1523, A=>nx1736);
   ix1526 : inv01 port map ( Y=>nx1525, A=>nx1734);
   ix832 : inv01 port map ( Y=>nx831, A=>nx1732);
   ix1546 : inv01 port map ( Y=>nx1545, A=>nx1728);
   ix1540 : inv01 port map ( Y=>nx1539, A=>nx1726);
   ix1556 : inv01 port map ( Y=>nx1555, A=>nx1724);
   ix1558 : inv01 port map ( Y=>nx1557, A=>nx1722);
   ix820 : inv01 port map ( Y=>nx819, A=>nx1720);
   ix1578 : inv01 port map ( Y=>nx1577, A=>nx1716);
   ix1572 : inv01 port map ( Y=>nx1571, A=>nx1714);
   ix1588 : inv01 port map ( Y=>nx1587, A=>nx1712);
   ix1590 : inv01 port map ( Y=>nx1589, A=>nx1710);
   ix808 : inv01 port map ( Y=>nx807, A=>nx1708);
   ix1610 : inv01 port map ( Y=>nx1609, A=>nx1704);
   ix1604 : inv01 port map ( Y=>nx1603, A=>nx1702);
   ix1653 : inv01 port map ( Y=>nx1652, A=>nx867);
   ix926 : inv01 port map ( Y=>nx925, A=>nx1648);
   ix1645 : inv01 port map ( Y=>nx1644, A=>nx911);
   ix972 : inv01 port map ( Y=>nx971, A=>nx1640);
   ix1637 : inv01 port map ( Y=>nx1636, A=>nx957);
   ix1014 : inv01 port map ( Y=>nx1013, A=>nx1632);
   ix1629 : inv01 port map ( Y=>nx1628, A=>nx1003);
   ix1581 : inv01 port map ( Y=>nx1580, A=>nx871);
   ix1577 : inv01 port map ( Y=>nx1576, A=>nx915);
   ix1573 : inv01 port map ( Y=>nx1572, A=>nx961);
   ix1523 : inv01 port map ( Y=>nx1522, A=>nx839);
   ix778 : inv01 port map ( Y=>nx777, A=>nx1518);
   ix1515 : inv01 port map ( Y=>nx1514, A=>nx827);
   ix760 : inv01 port map ( Y=>nx759, A=>nx1510);
   ix1507 : inv01 port map ( Y=>nx1506, A=>nx815);
   ix742 : inv01 port map ( Y=>nx741, A=>nx1502);
   ix1499 : inv01 port map ( Y=>nx1498, A=>nx803);
   ix1451 : inv01 port map ( Y=>nx1450, A=>nx787);
   ix1447 : inv01 port map ( Y=>nx1446, A=>nx769);
   ix1443 : inv01 port map ( Y=>nx1442, A=>nx751);
   ix1299 : inv01 port map ( Y=>nx1298, A=>nx2389);
   ix1247 : inv01 port map ( Y=>nx1246, A=>nx2421);
   ix1195 : inv01 port map ( Y=>nx1194, A=>nx2453);
   ix2538 : inv01 port map ( Y=>nx2537, A=>nx994);
   ix2086 : inv01 port map ( Y=>nx2085, A=>nx918);
   ix1880 : inv01 port map ( Y=>nx1879, A=>nx904);
   ix1886 : inv01 port map ( Y=>nx1885, A=>nx902);
   ix1984 : inv01 port map ( Y=>nx1983, A=>nx896);
   ix1980 : inv01 port map ( Y=>nx1979, A=>nx888);
   ix1898 : inv01 port map ( Y=>nx1897, A=>nx886);
   ix1900 : inv01 port map ( Y=>nx1899, A=>nx884);
   ix1910 : inv01 port map ( Y=>nx1909, A=>nx882);
   ix1986 : inv01 port map ( Y=>nx1985, A=>nx880);
   ix1974 : inv01 port map ( Y=>nx1973, A=>nx876);
   ix1862 : inv01 port map ( Y=>nx1861, A=>nx874);
   ix1916 : inv01 port map ( Y=>nx1915, A=>nx872);
   ix1926 : inv01 port map ( Y=>nx1925, A=>nx870);
   ix1988 : inv01 port map ( Y=>nx1987, A=>nx868);
   ix1968 : inv01 port map ( Y=>nx1967, A=>nx864);
   ix1850 : inv01 port map ( Y=>nx1849, A=>nx862);
   ix1932 : inv01 port map ( Y=>nx1931, A=>nx860);
   ix1942 : inv01 port map ( Y=>nx1941, A=>nx858);
   ix1990 : inv01 port map ( Y=>nx1989, A=>nx856);
   ix1962 : inv01 port map ( Y=>nx1961, A=>nx852);
   ix1680 : inv01 port map ( Y=>nx1679, A=>nx850);
   ix801 : inv01 port map ( Y=>nx800, A=>nx1895);
   ix1826 : inv01 port map ( Y=>nx1825, A=>nx796);
   ix793 : inv01 port map ( Y=>nx792, A=>nx1867);
   ix1810 : inv01 port map ( Y=>nx1809, A=>nx788);
   ix785 : inv01 port map ( Y=>nx784, A=>nx1855);
   ix1794 : inv01 port map ( Y=>nx1793, A=>nx780);
   ix777 : inv01 port map ( Y=>nx776, A=>nx1761);
   ix729 : inv01 port map ( Y=>nx728, A=>nx1835);
   ix725 : inv01 port map ( Y=>nx724, A=>nx1819);
   ix721 : inv01 port map ( Y=>nx720, A=>nx1803);
   ix671 : inv01 port map ( Y=>nx670, A=>nx1891);
   ix1742 : inv01 port map ( Y=>nx1741, A=>nx666);
   ix663 : inv01 port map ( Y=>nx662, A=>nx1863);
   ix1728 : inv01 port map ( Y=>nx1727, A=>nx658);
   ix655 : inv01 port map ( Y=>nx654, A=>nx1851);
   ix1714 : inv01 port map ( Y=>nx1713, A=>nx650);
   ix647 : inv01 port map ( Y=>nx646, A=>nx1681);
   ix599 : inv01 port map ( Y=>nx598, A=>nx1749);
   ix595 : inv01 port map ( Y=>nx594, A=>nx1735);
   ix591 : inv01 port map ( Y=>nx590, A=>nx1721);
   ix587 : inv01 port map ( Y=>nx586, A=>nx2485);
   ix2378 : inv01 port map ( Y=>nx2377, A=>nx348);
   ix2380 : inv01 port map ( Y=>nx2379, A=>nx346);
   ix2386 : inv01 port map ( Y=>nx2385, A=>nx340);
   ix2402 : inv01 port map ( Y=>nx2401, A=>nx332);
   ix2396 : inv01 port map ( Y=>nx2395, A=>nx330);
   ix2412 : inv01 port map ( Y=>nx2411, A=>nx328);
   ix2414 : inv01 port map ( Y=>nx2413, A=>nx326);
   ix2230 : inv01 port map ( Y=>nx2229, A=>nx324);
   ix2434 : inv01 port map ( Y=>nx2433, A=>nx320);
   ix2428 : inv01 port map ( Y=>nx2427, A=>nx318);
   ix2444 : inv01 port map ( Y=>nx2443, A=>nx316);
   ix2446 : inv01 port map ( Y=>nx2445, A=>nx314);
   ix2218 : inv01 port map ( Y=>nx2217, A=>nx312);
   ix2466 : inv01 port map ( Y=>nx2465, A=>nx308);
   ix2460 : inv01 port map ( Y=>nx2459, A=>nx306);
   ix2476 : inv01 port map ( Y=>nx2475, A=>nx304);
   ix2478 : inv01 port map ( Y=>nx2477, A=>nx302);
   ix2206 : inv01 port map ( Y=>nx2205, A=>nx300);
   ix2498 : inv01 port map ( Y=>nx2497, A=>nx296);
   ix2492 : inv01 port map ( Y=>nx2491, A=>nx294);
   ix245 : inv01 port map ( Y=>nx244, A=>nx2247);
   ix2294 : inv01 port map ( Y=>nx2293, A=>nx240);
   ix237 : inv01 port map ( Y=>nx236, A=>nx2283);
   ix2330 : inv01 port map ( Y=>nx2329, A=>nx232);
   ix229 : inv01 port map ( Y=>nx228, A=>nx2319);
   ix2362 : inv01 port map ( Y=>nx2361, A=>nx224);
   ix221 : inv01 port map ( Y=>nx220, A=>nx2355);
   ix173 : inv01 port map ( Y=>nx172, A=>nx2251);
   ix169 : inv01 port map ( Y=>nx168, A=>nx2287);
   ix165 : inv01 port map ( Y=>nx164, A=>nx2323);
   ix115 : inv01 port map ( Y=>nx114, A=>nx2237);
   ix2180 : inv01 port map ( Y=>nx2179, A=>nx110);
   ix107 : inv01 port map ( Y=>nx106, A=>nx2225);
   ix2164 : inv01 port map ( Y=>nx2163, A=>nx102);
   ix99 : inv01 port map ( Y=>nx98, A=>nx2213);
   ix2148 : inv01 port map ( Y=>nx2147, A=>nx94);
   ix91 : inv01 port map ( Y=>nx90, A=>nx2201);
   ix43 : inv01 port map ( Y=>nx42, A=>nx2189);
   ix39 : inv01 port map ( Y=>nx38, A=>nx2173);
   ix35 : inv01 port map ( Y=>nx34, A=>nx2157);
   ix3483 : inv01 port map ( Y=>EDGE, A=>nx2747);
   ix2773 : buf02 port map ( Y=>nx2775, A=>nx438);
   ix2776 : buf02 port map ( Y=>nx2777, A=>nx438);
   ix2782 : buf02 port map ( Y=>nx2783, A=>nx1430);
   ix2784 : buf02 port map ( Y=>nx2785, A=>nx1430);
   ix2790 : buf02 port map ( Y=>nx2791, A=>nx2402);
   ix2792 : buf02 port map ( Y=>nx2793, A=>nx2402);
   ix2794 : buf02 port map ( Y=>nx2795, A=>nx2838);
   ix2796 : buf02 port map ( Y=>nx2797, A=>nx2838);
   ix2800 : inv01 port map ( Y=>nx2801, A=>nx2571);
   ix2802 : inv01 port map ( Y=>nx2803, A=>nx2813);
   ix3507 : nor02 port map ( Y=>DIRECTION(0), A0=>nx677, A1=>nx2747);
   ix1527 : nor02ii port map ( Y=>nx1526, A0=>nx797, A1=>T01(0));
   ix1657 : nor02ii port map ( Y=>nx1656, A0=>nx859, A1=>T21(0));
   ix3129 : nor02ii port map ( Y=>nx3128, A0=>nx2795, A1=>nx2813);
   ix2083 : nor02ii port map ( Y=>nx2082, A0=>nx1129, A1=>T02(0));
   ix2213 : nor02ii port map ( Y=>nx2212, A0=>nx1221, A1=>T20(0));
   ix1470 : mux21 port map ( Y=>nx1469, A0=>nx2754, A1=>nx2748, S0=>nx2817);
   ix2733 : mux21 port map ( Y=>nx2732, A0=>nx1493, A1=>nx1485, S0=>nx2817);
   ix1502 : mux21 port map ( Y=>nx1501, A0=>nx2702, A1=>nx2696, S0=>nx2817);
   ix2681 : mux21 port map ( Y=>nx2680, A0=>nx1527, A1=>nx1519, S0=>nx2817);
   ix1534 : mux21 port map ( Y=>nx1533, A0=>nx2650, A1=>nx2644, S0=>nx2817);
   ix2629 : mux21 port map ( Y=>nx2628, A0=>nx1559, A1=>nx1551, S0=>nx679);
   ix1566 : mux21 port map ( Y=>nx1565, A0=>nx2598, A1=>nx2592, S0=>nx679);
   ix2577 : mux21 port map ( Y=>nx2576, A0=>nx1591, A1=>nx1583, S0=>nx679);
   ix1598 : mux21 port map ( Y=>nx1597, A0=>nx1990, A1=>nx1920, S0=>nx679);
   ix1674 : mux21 port map ( Y=>nx1673, A0=>nx1138, A1=>nx1068, S0=>nx2819);
   ix675 : nor02ii port map ( Y=>nx674, A0=>nx1757, A1=>T12(0));
   ix805 : nor02ii port map ( Y=>nx804, A0=>nx1843, A1=>T10(0));
   ix1157 : mux21 port map ( Y=>nx1156, A0=>nx2025, A1=>nx2023, S0=>nx2819);
   ix2030 : mux21 port map ( Y=>nx2029, A0=>nx1178, A1=>nx1172, S0=>nx2819);
   ix1209 : mux21 port map ( Y=>nx1208, A0=>nx2041, A1=>nx2039, S0=>nx2819);
   ix2046 : mux21 port map ( Y=>nx2045, A0=>nx1230, A1=>nx1224, S0=>nx2819);
   ix1261 : mux21 port map ( Y=>nx1260, A0=>nx2057, A1=>nx2055, S0=>nx2537);
   ix2062 : mux21 port map ( Y=>nx2061, A0=>nx1282, A1=>nx1276, S0=>nx2537);
   ix1313 : mux21 port map ( Y=>nx1312, A0=>nx2073, A1=>nx2071, S0=>nx2537);
   ix2078 : mux21 port map ( Y=>nx2077, A0=>nx1334, A1=>nx1328, S0=>nx2537);
   ix119 : nor02ii port map ( Y=>nx118, A0=>nx2101, A1=>T00(0));
   ix249 : nor02ii port map ( Y=>nx248, A0=>nx2107, A1=>T22(0));
   ix3109 : mux21 port map ( Y=>nx3108, A0=>nx2531, A1=>nx1617, S0=>nx2813);
   ix2564 : mux21 port map ( Y=>nx2563, A0=>nx2882, A1=>nx2874, S0=>nx2813);
   ix3125 : mux21 port map ( Y=>nx3124, A0=>nx2523, A1=>nx1625, S0=>nx2813);
   ix3149 : nor02ii port map ( Y=>nx3148, A0=>nx2785, A1=>nx1611);
   ix2600 : mux21 port map ( Y=>nx2599, A0=>nx2918, A1=>nx2910, S0=>nx2815);
   ix3189 : mux21 port map ( Y=>nx3188, A0=>nx2515, A1=>nx1633, S0=>nx2815);
   ix2630 : mux21 port map ( Y=>nx2629, A0=>nx2954, A1=>nx2946, S0=>nx2815);
   ix3237 : mux21 port map ( Y=>nx3236, A0=>nx2507, A1=>nx1641, S0=>nx2815);
   ix2662 : mux21 port map ( Y=>nx2661, A0=>nx2990, A1=>nx2982, S0=>nx2815);
   ix2670 : mux21 port map ( Y=>nx2669, A0=>nx3016, A1=>nx3004, S0=>nx2815);
   ix3509 : nor02ii port map ( Y=>DIRECTION(1), A0=>nx2747, A1=>nx3092);
   ix2798 : nor02ii port map ( Y=>nx2799, A0=>nx2795, A1=>nx3092);
   ix2812 : inv01 port map ( Y=>nx2813, A=>nx1611);
   ix2814 : inv01 port map ( Y=>nx2815, A=>nx1611);
   ix2816 : inv01 port map ( Y=>nx2817, A=>nx1846);
   ix2818 : inv01 port map ( Y=>nx2819, A=>nx994);
end behavioral ;

