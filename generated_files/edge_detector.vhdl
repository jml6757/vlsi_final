
-- 
-- Definition of  filter
-- 
--      Mon Dec 15 19:41:04 2014
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
      THRESHOLD : IN std_logic_vector (12 DOWNTO 0) ;
      READY : OUT std_logic ;
      O_VALID : OUT std_logic ;
      EDGE : OUT std_logic ;
      DIRECTION : OUT std_logic_vector (2 DOWNTO 0)) ;
end filter ;

architecture behavioral of filter is
   signal READY_dup0, O_VALID_dup0, EDGE_dup0, nx679, fsm_inst_state_3, 
      fsm_inst_state_2, fsm_inst_state_0, nx8, nx12, nx18, nx32, nx36, nx40, 
      nx50, nx62, nx74, nx82, nx88, nx90, nx92, nx96, nx98, nx100, nx104, 
      nx106, nx108, nx112, nx118, nx120, nx134, nx146, nx158, nx166, nx170, 
      nx174, nx178, nx188, nx200, nx212, nx220, nx226, nx228, nx230, nx234, 
      nx236, nx238, nx242, nx244, nx246, nx250, nx256, nx258, nx272, nx284, 
      nx296, nx304, nx310, nx316, nx322, nx328, nx334, nx336, nx338, nx340, 
      nx342, nx344, nx346, nx348, nx350, nx352, nx354, nx356, nx358, nx360, 
      nx362, nx364, nx366, nx368, nx370, nx372, nx374, nx376, nx378, nx392, 
      nx396, nx412, nx428, nx444, nx460, nx468, nx492, nx508, nx524, nx540, 
      nx556, nx570, nx586, nx602, nx618, nx634, nx640, nx642, nx646, nx650, 
      nx660, nx672, nx684, nx692, nx698, nx700, nx702, nx706, nx708, nx710, 
      nx714, nx716, nx718, nx722, nx728, nx730, nx744, nx756, nx768, nx776, 
      nx780, nx784, nx788, nx798, nx810, nx822, nx830, nx836, nx838, nx840, 
      nx844, nx846, nx848, nx852, nx854, nx856, nx860, nx866, nx868, nx882, 
      nx894, nx906, nx914, nx920, nx926, nx932, nx938, nx944, nx946, nx948, 
      nx950, nx952, nx954, nx956, nx958, nx960, nx962, nx964, nx966, nx968, 
      nx970, nx972, nx974, nx976, nx978, nx980, nx982, nx984, nx986, nx988, 
      nx1002, nx1006, nx1022, nx1038, nx1054, nx1070, nx1102, nx1118, nx1134, 
      nx1150, nx1166, nx1180, nx1196, nx1212, nx1228, nx1244, nx1250, nx1254, 
      nx1260, nx1266, nx1272, nx1276, nx1290, nx1302, nx1306, nx1312, nx1318, 
      nx1324, nx1328, nx1342, nx1354, nx1358, nx1364, nx1370, nx1376, nx1380, 
      nx1394, nx1406, nx1410, nx1416, nx1422, nx1428, nx1432, nx1446, nx1458, 
      nx1462, nx1468, nx1474, nx1480, nx1500, nx1516, nx1532, nx1548, nx1564, 
      nx1582, nx1586, nx1590, nx1600, nx1612, nx1624, nx1632, nx1638, nx1640, 
      nx1642, nx1646, nx1648, nx1650, nx1654, nx1656, nx1658, nx1662, nx1668, 
      nx1670, nx1684, nx1696, nx1708, nx1716, nx1720, nx1724, nx1728, nx1738, 
      nx1750, nx1762, nx1770, nx1776, nx1778, nx1780, nx1784, nx1786, nx1788, 
      nx1792, nx1794, nx1796, nx1800, nx1806, nx1808, nx1822, nx1834, nx1846, 
      nx1854, nx1860, nx1866, nx1872, nx1878, nx1884, nx1886, nx1888, nx1890, 
      nx1892, nx1894, nx1896, nx1898, nx1900, nx1902, nx1904, nx1906, nx1908, 
      nx1910, nx1912, nx1914, nx1916, nx1918, nx1920, nx1922, nx1924, nx1926, 
      nx1928, nx1942, nx1946, nx1962, nx1978, nx1994, nx2010, nx2042, nx2058, 
      nx2074, nx2090, nx2106, nx2120, nx2136, nx2152, nx2168, nx2184, nx2190, 
      nx2192, nx2196, nx2200, nx2210, nx2222, nx2234, nx2242, nx2248, nx2250, 
      nx2252, nx2256, nx2258, nx2260, nx2264, nx2266, nx2268, nx2272, nx2278, 
      nx2280, nx2294, nx2306, nx2318, nx2326, nx2330, nx2334, nx2338, nx2348, 
      nx2360, nx2372, nx2380, nx2386, nx2388, nx2390, nx2394, nx2396, nx2398, 
      nx2402, nx2404, nx2406, nx2410, nx2416, nx2418, nx2432, nx2444, nx2456, 
      nx2464, nx2470, nx2476, nx2482, nx2488, nx2494, nx2496, nx2498, nx2500, 
      nx2502, nx2504, nx2506, nx2508, nx2510, nx2512, nx2514, nx2516, nx2518, 
      nx2520, nx2522, nx2524, nx2526, nx2528, nx2530, nx2532, nx2534, nx2536, 
      nx2538, nx2552, nx2556, nx2572, nx2588, nx2604, nx2620, nx2628, nx2652, 
      nx2668, nx2684, nx2700, nx2716, nx2730, nx2746, nx2762, nx2778, nx2794, 
      nx2800, nx2804, nx2810, nx2814, nx2816, nx2822, nx2840, nx2852, nx2856, 
      nx2862, nx2866, nx2868, nx2874, nx2892, nx2904, nx2908, nx2914, nx2918, 
      nx2920, nx2926, nx2944, nx2956, nx2960, nx2966, nx2970, nx2972, nx2978, 
      nx2996, nx3008, nx3012, nx3018, nx3024, nx3030, nx3050, nx3066, nx3082, 
      nx3098, nx3114, nx3140, nx3148, nx3176, nx3184, nx3212, nx3220, nx3248, 
      nx3256, nx3284, nx3292, nx3306, nx3318, nx3322, nx3338, nx3354, nx3370, 
      nx3386, nx3402, nx3410, nx3426, nx3438, nx3444, nx3450, nx3458, nx3462, 
      nx3474, nx3486, nx3488, nx3490, nx3510, nx3522, nx3534, nx3536, nx3538, 
      nx3558, nx3570, nx3582, nx3584, nx3586, nx3606, nx3630, nx3634, nx3640, 
      nx3652, nx3664, nx3676, nx3680, nx3682, nx3684, nx3692, nx3698, nx3700, 
      nx3708, nx3710, nx3712, nx3716, nx3718, nx3720, nx3724, nx3726, nx3728, 
      nx3732, nx3734, nx3746, nx3762, nx3778, nx3794, nx3810, nx3826, nx3858, 
      nx773, nx775, nx785, nx789, nx793, nx795, nx799, nx803, nx805, nx809, 
      nx813, nx815, nx817, nx819, nx821, nx823, nx825, nx827, nx835, nx837, 
      nx839, nx841, nx845, nx849, nx853, nx855, nx857, nx859, nx863, nx867, 
      nx871, nx873, nx875, nx877, nx881, nx885, nx889, nx893, nx901, nx903, 
      nx907, nx911, nx915, nx919, nx923, nx927, nx931, nx935, nx939, nx943, 
      nx947, nx951, nx953, nx961, nx963, nx973, nx975, nx977, nx987, nx991, 
      nx995, nx997, nx1001, nx1003, nx1013, nx1015, nx1017, nx1021, nx1023, 
      nx1027, nx1033, nx1037, nx1041, nx1043, nx1047, nx1049, nx1059, nx1061, 
      nx1063, nx1067, nx1069, nx1073, nx1079, nx1083, nx1087, nx1089, nx1093, 
      nx1095, nx1105, nx1109, nx1111, nx1119, nx1123, nx1135, nx1141, nx1145, 
      nx1147, nx1151, nx1153, nx1155, nx1159, nx1161, nx1163, nx1167, nx1169, 
      nx1171, nx1175, nx1177, nx1179, nx1181, nx1183, nx1185, nx1189, nx1193, 
      nx1197, nx1201, nx1205, nx1207, nx1209, nx1211, nx1213, nx1217, nx1223, 
      nx1227, nx1229, nx1233, nx1239, nx1243, nx1245, nx1249, nx1255, nx1259, 
      nx1261, nx1265, nx1271, nx1275, nx1277, nx1281, nx1285, nx1287, nx1291, 
      nx1293, nx1295, nx1297, nx1299, nx1301, nx1311, nx1313, nx1319, nx1321, 
      nx1323, nx1327, nx1337, nx1341, nx1345, nx1347, nx1353, nx1355, nx1361, 
      nx1363, nx1365, nx1367, nx1375, nx1377, nx1379, nx1381, nx1385, nx1389, 
      nx1393, nx1395, nx1397, nx1399, nx1403, nx1407, nx1411, nx1413, nx1415, 
      nx1417, nx1423, nx1431, nx1433, nx1437, nx1441, nx1445, nx1449, nx1453, 
      nx1457, nx1461, nx1465, nx1469, nx1479, nx1481, nx1483, nx1487, nx1493, 
      nx1497, nx1501, nx1503, nx1507, nx1517, nx1519, nx1521, nx1525, nx1533, 
      nx1537, nx1541, nx1545, nx1555, nx1557, nx1559, nx1563, nx1571, nx1575, 
      nx1579, nx1583, nx1593, nx1597, nx1603, nx1607, nx1615, nx1619, nx1623, 
      nx1625, nx1627, nx1631, nx1633, nx1635, nx1639, nx1641, nx1645, nx1647, 
      nx1651, nx1655, nx1657, nx1659, nx1663, nx1665, nx1667, nx1671, nx1673, 
      nx1677, nx1679, nx1683, nx1687, nx1689, nx1691, nx1695, nx1697, nx1699, 
      nx1703, nx1705, nx1709, nx1711, nx1715, nx1719, nx1721, nx1723, nx1727, 
      nx1729, nx1731, nx1735, nx1737, nx1741, nx1743, nx1749, nx1757, nx1763, 
      nx1765, nx1771, nx1775, nx1779, nx1781, nx1787, nx1789, nx1795, nx1797, 
      nx1799, nx1801, nx1807, nx1809, nx1811, nx1815, nx1821, nx1823, nx1825, 
      nx1829, nx1835, nx1837, nx1839, nx1843, nx1847, nx1851, nx1863, nx1867, 
      nx1871, nx1873, nx1879, nx1881, nx1887, nx1889, nx1891, nx1899, nx1901, 
      nx1903, nx1907, nx1911, nx1915, nx1917, nx1919, nx1923, nx1927, nx1931, 
      nx1933, nx1935, nx1939, nx1945, nx1951, nx1955, nx1963, nx1967, nx1971, 
      nx1973, nx1979, nx1989, nx1993, nx1997, nx1999, nx2005, nx2015, nx2019, 
      nx2023, nx2025, nx2031, nx2041, nx2045, nx2049, nx2051, nx2055, nx2057, 
      nx2059, nx2061, nx2063, nx2065, nx2069, nx2071, nx2075, nx2077, nx2081, 
      nx2083, nx2087, nx2089, nx2093, nx2095, nx2097, nx2099, nx2101, nx2105, 
      nx2115, nx2119, nx2123, nx2127, nx2145, nx2147, nx2153, nx2157, nx2161, 
      nx2163, nx2169, nx2171, nx2177, nx2179, nx2185, nx2187, nx2189, nx2193, 
      nx2199, nx2201, nx2203, nx2207, nx2213, nx2215, nx2217, nx2221, nx2229, 
      nx2239, nx2243, nx2247, nx2249, nx2255, nx2257, nx2263, nx2265, nx2271, 
      nx2273, nx2275, nx2279, nx2285, nx2287, nx2289, nx2293, nx2299, nx2301, 
      nx2303, nx2307, nx2313, nx2319, nx2323, nx2331, nx2335, nx2339, nx2341, 
      nx2347, nx2357, nx2361, nx2365, nx2367, nx2373, nx2383, nx2387, nx2391, 
      nx2393, nx2399, nx2409, nx2413, nx2417, nx2419, nx2423, nx2425, nx2427, 
      nx2429, nx2431, nx2433, nx2437, nx2439, nx2443, nx2445, nx2449, nx2451, 
      nx2455, nx2457, nx2461, nx2463, nx2465, nx2467, nx2469, nx2473, nx2477, 
      nx2483, nx2487, nx2491, nx2495, nx2509, nx2513, nx2519, nx2525, nx2529, 
      nx2533, nx2535, nx2539, nx2545, nx2549, nx2551, nx2555, nx2561, nx2565, 
      nx2567, nx2571, nx2577, nx2581, nx2583, nx2587, nx2593, nx2595, nx2597, 
      nx2599, nx2605, nx2609, nx2611, nx2613, nx2615, nx2621, nx2625, nx2627, 
      nx2629, nx2631, nx2637, nx2641, nx2643, nx2645, nx2647, nx2653, nx2657, 
      nx2659, nx2661, nx2663, nx2667, nx2669, nx2675, nx2677, nx2683, nx2685, 
      nx2691, nx2693, nx2703, nx2707, nx2709, nx2711, nx2715, nx2717, nx2719, 
      nx2723, nx2725, nx2727, nx2731, nx2733, nx2735, nx2739, nx2741, nx2747, 
      nx2757, nx2765, nx2769, nx2775, nx2781, nx2783, nx2789, nx2791, nx2793, 
      nx2803, nx2811, nx2821, nx2831, nx2833, nx2835, nx2839, nx2853, nx2861, 
      nx2863, nx2865, nx2869, nx2881, nx2889, nx2891, nx2893, nx2897, nx2899, 
      nx2901, nx2909, nx2913, nx2915, nx2921, nx2923, nx2929, nx2931, nx2937, 
      nx2939, nx2947, nx2949, nx2955, nx2961, nx2965, nx2971, nx2977, nx2983, 
      nx3013, nx3019, nx3021, nx3023, nx3025, nx3027, nx3043, nx3045, nx3047, 
      nx3049, nx3056, nx3058, nx3060, nx3062, nx3064, nx3067, nx3069, nx3071
   : std_logic ;

begin
   READY <= READY_dup0 ;
   O_VALID <= O_VALID_dup0 ;
   EDGE <= EDGE_dup0 ;
   ix680 : fake_gnd port map ( Y=>nx679);
   ix3863 : nor02ii port map ( Y=>DIRECTION(0), A0=>nx773, A1=>EDGE_dup0);
   ix774 : aoi221 port map ( Y=>nx773, A0=>nx3023, A1=>nx3021, B0=>nx3045, 
      B1=>nx3019, C0=>nx3858);
   ix780 : mux21 port map ( Y=>nx775, A0=>nx920, A1=>nx1070, S0=>nx932);
   ix777 : nor02ii port map ( Y=>nx776, A0=>nx785, A1=>nx698);
   ix786 : aoi22 port map ( Y=>nx785, A0=>T22(7), A1=>nx700, B0=>nx702, B1=>
      nx768);
   ix701 : xnor2 port map ( Y=>nx700, A0=>nx789, A1=>nx684);
   ix790 : xnor2 port map ( Y=>nx789, A0=>T02(7), A1=>T12(6));
   ix685 : oai22 port map ( Y=>nx684, A0=>nx793, A1=>nx795, B0=>nx825, B1=>
      nx827);
   ix794 : xnor2 port map ( Y=>nx793, A0=>T02(6), A1=>T12(5));
   ix796 : aoi22 port map ( Y=>nx795, A0=>T12(4), A1=>T02(5), B0=>nx646, B1
      =>nx672);
   ix800 : inv01 port map ( Y=>nx799, A=>T12(4));
   ix673 : oai22 port map ( Y=>nx672, A0=>nx803, A1=>nx805, B0=>nx821, B1=>
      nx823);
   ix804 : xnor2 port map ( Y=>nx803, A0=>T02(4), A1=>T12(3));
   ix806 : aoi22 port map ( Y=>nx805, A0=>T12(2), A1=>T02(3), B0=>nx650, B1
      =>nx660);
   ix810 : inv01 port map ( Y=>nx809, A=>T12(2));
   ix661 : oai22 port map ( Y=>nx660, A0=>nx813, A1=>nx815, B0=>nx817, B1=>
      nx819);
   ix814 : xnor2 port map ( Y=>nx813, A0=>T02(2), A1=>T12(1));
   ix816 : nand02 port map ( Y=>nx815, A0=>T12(0), A1=>T02(1));
   ix818 : inv01 port map ( Y=>nx817, A=>T12(1));
   ix820 : inv01 port map ( Y=>nx819, A=>T02(2));
   ix822 : inv01 port map ( Y=>nx821, A=>T12(3));
   ix824 : inv01 port map ( Y=>nx823, A=>T02(4));
   ix826 : inv01 port map ( Y=>nx825, A=>T12(5));
   ix828 : inv01 port map ( Y=>nx827, A=>T02(6));
   ix769 : oai22 port map ( Y=>nx768, A0=>nx835, A1=>nx841, B0=>nx839, B1=>
      nx837);
   ix838 : xnor2 port map ( Y=>nx837, A0=>nx793, A1=>nx795);
   ix840 : inv01 port map ( Y=>nx839, A=>T22(6));
   ix842 : aoi22 port map ( Y=>nx841, A0=>T22(5), A1=>nx708, B0=>nx710, B1=>
      nx756);
   ix709 : xnor2 port map ( Y=>nx708, A0=>nx845, A1=>nx672);
   ix846 : xnor2 port map ( Y=>nx845, A0=>T02(5), A1=>T12(4));
   ix850 : inv01 port map ( Y=>nx849, A=>T22(5));
   ix757 : oai22 port map ( Y=>nx756, A0=>nx853, A1=>nx859, B0=>nx857, B1=>
      nx855);
   ix856 : xnor2 port map ( Y=>nx855, A0=>nx803, A1=>nx805);
   ix858 : inv01 port map ( Y=>nx857, A=>T22(4));
   ix860 : aoi22 port map ( Y=>nx859, A0=>T22(3), A1=>nx716, B0=>nx718, B1=>
      nx744);
   ix717 : xnor2 port map ( Y=>nx716, A0=>nx863, A1=>nx660);
   ix864 : xnor2 port map ( Y=>nx863, A0=>T02(3), A1=>T12(2));
   ix868 : inv01 port map ( Y=>nx867, A=>T22(3));
   ix745 : oai22 port map ( Y=>nx744, A0=>nx871, A1=>nx877, B0=>nx875, B1=>
      nx873);
   ix874 : xnor2 port map ( Y=>nx873, A0=>nx813, A1=>nx815);
   ix876 : inv01 port map ( Y=>nx875, A=>T22(2));
   ix878 : aoi32 port map ( Y=>nx877, A0=>nx730, A1=>T22(0), A2=>T02(0), B0
      =>T22(1), B1=>nx728);
   ix731 : xnor2 port map ( Y=>nx730, A0=>nx881, A1=>T22(1));
   ix882 : oai21 port map ( Y=>nx881, A0=>T02(1), A1=>T12(0), B0=>nx815);
   ix886 : inv01 port map ( Y=>nx885, A=>T02(1));
   ix699 : xnor2 port map ( Y=>nx698, A0=>T12(7), A1=>nx889);
   ix890 : aoi22 port map ( Y=>nx889, A0=>T12(6), A1=>T02(7), B0=>nx642, B1
      =>nx684);
   ix894 : inv01 port map ( Y=>nx893, A=>T12(6));
   ix1071 : mux21 port map ( Y=>nx1070, A0=>nx901, A1=>nx903, S0=>nx946);
   ix904 : mux21 port map ( Y=>nx903, A0=>nx948, A1=>nx1054, S0=>nx952);
   ix949 : xnor2 port map ( Y=>nx948, A0=>nx907, A1=>nx768);
   ix908 : xnor2 port map ( Y=>nx907, A0=>nx700, A1=>T22(7));
   ix1055 : mux21 port map ( Y=>nx1054, A0=>nx911, A1=>nx915, S0=>nx958);
   ix707 : xnor2 port map ( Y=>nx706, A0=>nx837, A1=>T22(6));
   ix916 : mux21 port map ( Y=>nx915, A0=>nx960, A1=>nx1038, S0=>nx964);
   ix961 : xnor2 port map ( Y=>nx960, A0=>nx919, A1=>nx756);
   ix920 : xnor2 port map ( Y=>nx919, A0=>nx708, A1=>T22(5));
   ix1039 : mux21 port map ( Y=>nx1038, A0=>nx923, A1=>nx927, S0=>nx970);
   ix715 : xnor2 port map ( Y=>nx714, A0=>nx855, A1=>T22(4));
   ix928 : mux21 port map ( Y=>nx927, A0=>nx972, A1=>nx1022, S0=>nx976);
   ix973 : xnor2 port map ( Y=>nx972, A0=>nx931, A1=>nx744);
   ix932 : xnor2 port map ( Y=>nx931, A0=>nx716, A1=>T22(3));
   ix1023 : mux21 port map ( Y=>nx1022, A0=>nx935, A1=>nx939, S0=>nx982);
   ix723 : xnor2 port map ( Y=>nx722, A0=>nx873, A1=>T22(2));
   ix940 : mux21 port map ( Y=>nx939, A0=>nx984, A1=>nx1006, S0=>nx988);
   ix985 : xnor2 port map ( Y=>nx984, A0=>nx730, A1=>nx943);
   ix944 : nand02 port map ( Y=>nx943, A0=>T22(0), A1=>T02(0));
   ix1007 : nor02 port map ( Y=>nx1006, A0=>nx947, A1=>nx1002);
   ix948 : oai21 port map ( Y=>nx947, A0=>T02(0), A1=>T22(0), B0=>nx943);
   ix1003 : xnor2 port map ( Y=>nx1002, A0=>nx947, A1=>nx951);
   ix952 : oai21 port map ( Y=>nx951, A0=>T20(0), A1=>T00(0), B0=>nx953);
   ix954 : nand02 port map ( Y=>nx953, A0=>T00(0), A1=>T20(0));
   ix989 : xnor2 port map ( Y=>nx988, A0=>nx984, A1=>nx986);
   ix987 : xnor2 port map ( Y=>nx986, A0=>nx868, A1=>nx953);
   ix869 : xnor2 port map ( Y=>nx868, A0=>nx961, A1=>T20(1));
   ix962 : oai21 port map ( Y=>nx961, A0=>T10(0), A1=>T00(1), B0=>nx963);
   ix964 : nand02 port map ( Y=>nx963, A0=>T00(1), A1=>T10(0));
   ix983 : xnor2 port map ( Y=>nx982, A0=>nx978, A1=>nx980);
   ix979 : xnor2 port map ( Y=>nx978, A0=>nx722, A1=>nx877);
   ix981 : xnor2 port map ( Y=>nx980, A0=>nx860, A1=>nx977);
   ix861 : xnor2 port map ( Y=>nx860, A0=>nx973, A1=>T20(2));
   ix974 : xnor2 port map ( Y=>nx973, A0=>nx975, A1=>nx963);
   ix976 : xnor2 port map ( Y=>nx975, A0=>T00(2), A1=>T10(1));
   ix978 : aoi32 port map ( Y=>nx977, A0=>nx868, A1=>T00(0), A2=>T20(0), B0
      =>T20(1), B1=>nx866);
   ix977 : xnor2 port map ( Y=>nx976, A0=>nx972, A1=>nx974);
   ix975 : xnor2 port map ( Y=>nx974, A0=>nx987, A1=>nx882);
   ix988 : xnor2 port map ( Y=>nx987, A0=>nx854, A1=>T20(3));
   ix855 : xnor2 port map ( Y=>nx854, A0=>nx991, A1=>nx798);
   ix992 : xnor2 port map ( Y=>nx991, A0=>T00(3), A1=>T10(2));
   ix799 : oai22 port map ( Y=>nx798, A0=>nx975, A1=>nx963, B0=>nx995, B1=>
      nx997);
   ix996 : inv01 port map ( Y=>nx995, A=>T00(2));
   ix998 : inv01 port map ( Y=>nx997, A=>T10(1));
   ix883 : oai22 port map ( Y=>nx882, A0=>nx1001, A1=>nx977, B0=>nx1003, B1
      =>nx973);
   ix1004 : inv01 port map ( Y=>nx1003, A=>T20(2));
   ix971 : xnor2 port map ( Y=>nx970, A0=>nx966, A1=>nx968);
   ix967 : xnor2 port map ( Y=>nx966, A0=>nx714, A1=>nx859);
   ix969 : xnor2 port map ( Y=>nx968, A0=>nx852, A1=>nx1023);
   ix853 : xnor2 port map ( Y=>nx852, A0=>nx1013, A1=>T20(4));
   ix1014 : xnor2 port map ( Y=>nx1013, A0=>nx1015, A1=>nx1017);
   ix1016 : xnor2 port map ( Y=>nx1015, A0=>T00(4), A1=>T10(3));
   ix1018 : aoi22 port map ( Y=>nx1017, A0=>T00(3), A1=>T10(2), B0=>nx788, 
      B1=>nx798);
   ix1022 : inv01 port map ( Y=>nx1021, A=>T10(2));
   ix1024 : aoi22 port map ( Y=>nx1023, A0=>T20(3), A1=>nx854, B0=>nx856, B1
      =>nx882);
   ix1028 : inv01 port map ( Y=>nx1027, A=>T20(3));
   ix965 : xnor2 port map ( Y=>nx964, A0=>nx960, A1=>nx962);
   ix963 : xnor2 port map ( Y=>nx962, A0=>nx1033, A1=>nx894);
   ix1034 : xnor2 port map ( Y=>nx1033, A0=>nx846, A1=>T20(5));
   ix847 : xnor2 port map ( Y=>nx846, A0=>nx1037, A1=>nx810);
   ix1038 : xnor2 port map ( Y=>nx1037, A0=>T00(5), A1=>T10(4));
   ix811 : oai22 port map ( Y=>nx810, A0=>nx1015, A1=>nx1017, B0=>nx1041, B1
      =>nx1043);
   ix1042 : inv01 port map ( Y=>nx1041, A=>T00(4));
   ix1044 : inv01 port map ( Y=>nx1043, A=>T10(3));
   ix895 : oai22 port map ( Y=>nx894, A0=>nx1047, A1=>nx1023, B0=>nx1049, B1
      =>nx1013);
   ix1050 : inv01 port map ( Y=>nx1049, A=>T20(4));
   ix959 : xnor2 port map ( Y=>nx958, A0=>nx954, A1=>nx956);
   ix955 : xnor2 port map ( Y=>nx954, A0=>nx706, A1=>nx841);
   ix957 : xnor2 port map ( Y=>nx956, A0=>nx844, A1=>nx1069);
   ix845 : xnor2 port map ( Y=>nx844, A0=>nx1059, A1=>T20(6));
   ix1060 : xnor2 port map ( Y=>nx1059, A0=>nx1061, A1=>nx1063);
   ix1062 : xnor2 port map ( Y=>nx1061, A0=>T00(6), A1=>T10(5));
   ix1064 : aoi22 port map ( Y=>nx1063, A0=>T00(5), A1=>T10(4), B0=>nx784, 
      B1=>nx810);
   ix1068 : inv01 port map ( Y=>nx1067, A=>T10(4));
   ix1070 : aoi22 port map ( Y=>nx1069, A0=>T20(5), A1=>nx846, B0=>nx848, B1
      =>nx894);
   ix1074 : inv01 port map ( Y=>nx1073, A=>T20(5));
   ix953 : xnor2 port map ( Y=>nx952, A0=>nx948, A1=>nx950);
   ix951 : xnor2 port map ( Y=>nx950, A0=>nx1079, A1=>nx906);
   ix1080 : xnor2 port map ( Y=>nx1079, A0=>nx838, A1=>T20(7));
   ix839 : xnor2 port map ( Y=>nx838, A0=>nx1083, A1=>nx822);
   ix1084 : xnor2 port map ( Y=>nx1083, A0=>T00(7), A1=>T10(6));
   ix823 : oai22 port map ( Y=>nx822, A0=>nx1061, A1=>nx1063, B0=>nx1087, B1
      =>nx1089);
   ix1088 : inv01 port map ( Y=>nx1087, A=>T00(6));
   ix1090 : inv01 port map ( Y=>nx1089, A=>T10(5));
   ix907 : oai22 port map ( Y=>nx906, A0=>nx1093, A1=>nx1069, B0=>nx1095, B1
      =>nx1059);
   ix1096 : inv01 port map ( Y=>nx1095, A=>T20(6));
   ix947 : xnor2 port map ( Y=>nx946, A0=>nx938, A1=>nx944);
   ix939 : xnor2 port map ( Y=>nx938, A0=>nx698, A1=>nx785);
   ix945 : xnor2 port map ( Y=>nx944, A0=>nx836, A1=>nx1111);
   ix837 : xnor2 port map ( Y=>nx836, A0=>T10(7), A1=>nx1105);
   ix1106 : aoi22 port map ( Y=>nx1105, A0=>T00(7), A1=>T10(6), B0=>nx780, 
      B1=>nx822);
   ix1110 : inv01 port map ( Y=>nx1109, A=>T10(6));
   ix1112 : aoi22 port map ( Y=>nx1111, A0=>T20(7), A1=>nx838, B0=>nx840, B1
      =>nx906);
   ix933 : xnor2 port map ( Y=>nx932, A0=>nx1119, A1=>nx1123);
   ix1122 : nor02 port map ( Y=>nx1119, A0=>nx776, A1=>nx692);
   ix1126 : nor02 port map ( Y=>nx1123, A0=>nx914, A1=>nx830);
   ix915 : nor02ii port map ( Y=>nx914, A0=>nx1111, A1=>nx836);
   ix1136 : mux21 port map ( Y=>nx1135, A0=>nx1250, A1=>nx1564, S0=>nx1743);
   ix1251 : mux21 port map ( Y=>nx1250, A0=>nx1244, A1=>nx1166, S0=>nx3023);
   ix1245 : oai22 port map ( Y=>nx1244, A0=>nx1141, A1=>nx1145, B0=>nx1119, 
      B1=>nx926);
   ix1146 : aoi22 port map ( Y=>nx1145, A0=>nx938, A1=>nx1147, B0=>nx946, B1
      =>nx1228);
   ix1229 : oai22 port map ( Y=>nx1228, A0=>nx1151, A1=>nx1153, B0=>nx1185, 
      B1=>nx950);
   ix1154 : aoi22 port map ( Y=>nx1153, A0=>nx954, A1=>nx1155, B0=>nx958, B1
      =>nx1212);
   ix1213 : oai22 port map ( Y=>nx1212, A0=>nx1159, A1=>nx1161, B0=>nx1183, 
      B1=>nx962);
   ix1162 : aoi22 port map ( Y=>nx1161, A0=>nx966, A1=>nx1163, B0=>nx970, B1
      =>nx1196);
   ix1197 : oai22 port map ( Y=>nx1196, A0=>nx1167, A1=>nx1169, B0=>nx1181, 
      B1=>nx974);
   ix1170 : aoi22 port map ( Y=>nx1169, A0=>nx978, A1=>nx1171, B0=>nx982, B1
      =>nx1180);
   ix1181 : oai22 port map ( Y=>nx1180, A0=>nx1175, A1=>nx1177, B0=>nx1179, 
      B1=>nx986);
   ix1178 : nor02 port map ( Y=>nx1177, A0=>nx1002, A1=>nx951);
   ix1167 : oai22 port map ( Y=>nx1166, A0=>nx1189, A1=>nx1141, B0=>nx920, 
      B1=>nx1123);
   ix1190 : aoi22 port map ( Y=>nx1189, A0=>nx901, A1=>nx944, B0=>nx1150, B1
      =>nx946);
   ix1151 : oai22 port map ( Y=>nx1150, A0=>nx1193, A1=>nx1151, B0=>nx948, 
      B1=>nx1213);
   ix1194 : aoi22 port map ( Y=>nx1193, A0=>nx911, A1=>nx956, B0=>nx1134, B1
      =>nx958);
   ix1135 : oai22 port map ( Y=>nx1134, A0=>nx1197, A1=>nx1159, B0=>nx960, 
      B1=>nx1211);
   ix1198 : aoi22 port map ( Y=>nx1197, A0=>nx923, A1=>nx968, B0=>nx1118, B1
      =>nx970);
   ix1119 : oai22 port map ( Y=>nx1118, A0=>nx1201, A1=>nx1167, B0=>nx972, 
      B1=>nx1209);
   ix1202 : aoi22 port map ( Y=>nx1201, A0=>nx935, A1=>nx980, B0=>nx1102, B1
      =>nx982);
   ix1103 : oai22 port map ( Y=>nx1102, A0=>nx1205, A1=>nx1175, B0=>nx984, 
      B1=>nx1207);
   ix1206 : nor02 port map ( Y=>nx1205, A0=>nx1177, A1=>nx1002);
   ix1565 : mux21 port map ( Y=>nx1564, A0=>nx1217, A1=>nx1223, S0=>nx1729);
   ix1218 : mux21 port map ( Y=>nx1217, A0=>nx1260, A1=>nx1254, S0=>nx3023);
   ix1261 : xnor2 port map ( Y=>nx1260, A0=>nx932, A1=>nx1145);
   ix1255 : xnor2 port map ( Y=>nx1254, A0=>nx1189, A1=>nx932);
   ix1224 : mux21 port map ( Y=>nx1223, A0=>nx1290, A1=>nx1548, S0=>nx1711);
   ix1291 : mux21 port map ( Y=>nx1290, A0=>nx1227, A1=>nx1229, S0=>nx3023);
   ix1228 : xnor2 port map ( Y=>nx1227, A0=>nx946, A1=>nx1228);
   ix1230 : xnor2 port map ( Y=>nx1229, A0=>nx1150, A1=>nx946);
   ix1549 : mux21 port map ( Y=>nx1548, A0=>nx1233, A1=>nx1239, S0=>nx1697);
   ix1234 : mux21 port map ( Y=>nx1233, A0=>nx1312, A1=>nx1306, S0=>nx3023);
   ix1313 : xnor2 port map ( Y=>nx1312, A0=>nx952, A1=>nx1153);
   ix1307 : xnor2 port map ( Y=>nx1306, A0=>nx1193, A1=>nx952);
   ix1240 : mux21 port map ( Y=>nx1239, A0=>nx1342, A1=>nx1532, S0=>nx1679);
   ix1343 : mux21 port map ( Y=>nx1342, A0=>nx1243, A1=>nx1245, S0=>nx3023);
   ix1244 : xnor2 port map ( Y=>nx1243, A0=>nx958, A1=>nx1212);
   ix1246 : xnor2 port map ( Y=>nx1245, A0=>nx1134, A1=>nx958);
   ix1533 : mux21 port map ( Y=>nx1532, A0=>nx1249, A1=>nx1255, S0=>nx1665);
   ix1250 : mux21 port map ( Y=>nx1249, A0=>nx1364, A1=>nx1358, S0=>nx3025);
   ix1365 : xnor2 port map ( Y=>nx1364, A0=>nx964, A1=>nx1161);
   ix1359 : xnor2 port map ( Y=>nx1358, A0=>nx1197, A1=>nx964);
   ix1256 : mux21 port map ( Y=>nx1255, A0=>nx1394, A1=>nx1516, S0=>nx1647);
   ix1395 : mux21 port map ( Y=>nx1394, A0=>nx1259, A1=>nx1261, S0=>nx3025);
   ix1260 : xnor2 port map ( Y=>nx1259, A0=>nx970, A1=>nx1196);
   ix1262 : xnor2 port map ( Y=>nx1261, A0=>nx1118, A1=>nx970);
   ix1517 : mux21 port map ( Y=>nx1516, A0=>nx1265, A1=>nx1271, S0=>nx1633);
   ix1266 : mux21 port map ( Y=>nx1265, A0=>nx1416, A1=>nx1410, S0=>nx3025);
   ix1417 : xnor2 port map ( Y=>nx1416, A0=>nx976, A1=>nx1169);
   ix1411 : xnor2 port map ( Y=>nx1410, A0=>nx1201, A1=>nx976);
   ix1272 : mux21 port map ( Y=>nx1271, A0=>nx1446, A1=>nx1500, S0=>nx1615);
   ix1447 : mux21 port map ( Y=>nx1446, A0=>nx1275, A1=>nx1277, S0=>nx3025);
   ix1276 : xnor2 port map ( Y=>nx1275, A0=>nx982, A1=>nx1180);
   ix1278 : xnor2 port map ( Y=>nx1277, A0=>nx1102, A1=>nx982);
   ix1501 : mux21 port map ( Y=>nx1500, A0=>nx1281, A1=>nx1285, S0=>nx1299);
   ix1282 : mux21 port map ( Y=>nx1281, A0=>nx1468, A1=>nx1462, S0=>nx3025);
   ix1469 : xnor2 port map ( Y=>nx1468, A0=>nx988, A1=>nx1177);
   ix1463 : xnor2 port map ( Y=>nx1462, A0=>nx1205, A1=>nx988);
   ix1286 : nand02 port map ( Y=>nx1285, A0=>nx1287, A1=>nx392);
   ix393 : xnor2 port map ( Y=>nx392, A0=>nx1291, A1=>nx1295);
   ix1292 : oai21 port map ( Y=>nx1291, A0=>T01(0), A1=>T10(0), B0=>nx1293);
   ix1294 : nand02 port map ( Y=>nx1293, A0=>T10(0), A1=>T01(0));
   ix1296 : oai21 port map ( Y=>nx1295, A0=>T12(0), A1=>T21(0), B0=>nx1297);
   ix1298 : nand02 port map ( Y=>nx1297, A0=>T21(0), A1=>T12(0));
   ix1300 : xnor2 port map ( Y=>nx1299, A0=>nx1281, A1=>nx1301);
   ix1481 : xnor2 port map ( Y=>nx1480, A0=>nx378, A1=>nx1323);
   ix379 : xnor2 port map ( Y=>nx378, A0=>nx374, A1=>nx376);
   ix375 : xnor2 port map ( Y=>nx374, A0=>nx120, A1=>nx1293);
   ix121 : xnor2 port map ( Y=>nx120, A0=>nx1311, A1=>T01(1));
   ix1312 : oai21 port map ( Y=>nx1311, A0=>T10(1), A1=>T00(0), B0=>nx1313);
   ix1314 : nand02 port map ( Y=>nx1313, A0=>T00(0), A1=>T10(1));
   ix377 : xnor2 port map ( Y=>nx376, A0=>nx258, A1=>nx1297);
   ix259 : xnor2 port map ( Y=>nx258, A0=>nx1319, A1=>T12(1));
   ix1320 : oai21 port map ( Y=>nx1319, A0=>T21(1), A1=>T22(0), B0=>nx1321);
   ix1322 : nand02 port map ( Y=>nx1321, A0=>T22(0), A1=>T21(1));
   ix1324 : nor02 port map ( Y=>nx1323, A0=>nx392, A1=>nx1295);
   ix1475 : xnor2 port map ( Y=>nx1474, A0=>nx1327, A1=>nx378);
   ix1328 : nor02 port map ( Y=>nx1327, A0=>nx1323, A1=>nx392);
   ix167 : nor02ii port map ( Y=>nx166, A0=>nx1337, A1=>nx88);
   ix1338 : aoi22 port map ( Y=>nx1337, A0=>T01(7), A1=>nx90, B0=>nx92, B1=>
      nx158);
   ix91 : xnor2 port map ( Y=>nx90, A0=>nx1341, A1=>nx74);
   ix1342 : xnor2 port map ( Y=>nx1341, A0=>T10(7), A1=>T00(6));
   ix75 : oai22 port map ( Y=>nx74, A0=>nx1345, A1=>nx1347, B0=>nx1367, B1=>
      nx1109);
   ix1346 : xnor2 port map ( Y=>nx1345, A0=>T10(6), A1=>T00(5));
   ix1348 : aoi22 port map ( Y=>nx1347, A0=>T00(4), A1=>T10(5), B0=>nx36, B1
      =>nx62);
   ix63 : oai22 port map ( Y=>nx62, A0=>nx1353, A1=>nx1355, B0=>nx1365, B1=>
      nx1067);
   ix1354 : xnor2 port map ( Y=>nx1353, A0=>T10(4), A1=>T00(3));
   ix1356 : aoi22 port map ( Y=>nx1355, A0=>T00(2), A1=>T10(3), B0=>nx40, B1
      =>nx50);
   ix51 : oai22 port map ( Y=>nx50, A0=>nx1361, A1=>nx1313, B0=>nx1363, B1=>
      nx1021);
   ix1362 : xnor2 port map ( Y=>nx1361, A0=>T10(2), A1=>T00(1));
   ix1364 : inv01 port map ( Y=>nx1363, A=>T00(1));
   ix1366 : inv01 port map ( Y=>nx1365, A=>T00(3));
   ix1368 : inv01 port map ( Y=>nx1367, A=>T00(5));
   ix159 : oai22 port map ( Y=>nx158, A0=>nx1375, A1=>nx1381, B0=>nx1379, B1
      =>nx1377);
   ix1378 : xnor2 port map ( Y=>nx1377, A0=>nx1345, A1=>nx1347);
   ix1380 : inv01 port map ( Y=>nx1379, A=>T01(6));
   ix1382 : aoi22 port map ( Y=>nx1381, A0=>T01(5), A1=>nx98, B0=>nx100, B1
      =>nx146);
   ix99 : xnor2 port map ( Y=>nx98, A0=>nx1385, A1=>nx62);
   ix1386 : xnor2 port map ( Y=>nx1385, A0=>T10(5), A1=>T00(4));
   ix1390 : inv01 port map ( Y=>nx1389, A=>T01(5));
   ix147 : oai22 port map ( Y=>nx146, A0=>nx1393, A1=>nx1399, B0=>nx1397, B1
      =>nx1395);
   ix1396 : xnor2 port map ( Y=>nx1395, A0=>nx1353, A1=>nx1355);
   ix1398 : inv01 port map ( Y=>nx1397, A=>T01(4));
   ix1400 : aoi22 port map ( Y=>nx1399, A0=>T01(3), A1=>nx106, B0=>nx108, B1
      =>nx134);
   ix107 : xnor2 port map ( Y=>nx106, A0=>nx1403, A1=>nx50);
   ix1404 : xnor2 port map ( Y=>nx1403, A0=>T10(3), A1=>T00(2));
   ix1408 : inv01 port map ( Y=>nx1407, A=>T01(3));
   ix135 : oai22 port map ( Y=>nx134, A0=>nx1411, A1=>nx1417, B0=>nx1415, B1
      =>nx1413);
   ix1414 : xnor2 port map ( Y=>nx1413, A0=>nx1361, A1=>nx1313);
   ix1416 : inv01 port map ( Y=>nx1415, A=>T01(2));
   ix1418 : aoi32 port map ( Y=>nx1417, A0=>nx120, A1=>T10(0), A2=>T01(0), 
      B0=>T01(1), B1=>nx118);
   ix89 : xnor2 port map ( Y=>nx88, A0=>T00(7), A1=>nx1423);
   ix1424 : aoi22 port map ( Y=>nx1423, A0=>T00(6), A1=>T10(7), B0=>nx32, B1
      =>nx74);
   ix461 : mux21 port map ( Y=>nx460, A0=>nx1431, A1=>nx1433, S0=>nx336);
   ix1434 : mux21 port map ( Y=>nx1433, A0=>nx338, A1=>nx444, S0=>nx342);
   ix339 : xnor2 port map ( Y=>nx338, A0=>nx1437, A1=>nx158);
   ix1438 : xnor2 port map ( Y=>nx1437, A0=>nx90, A1=>T01(7));
   ix445 : mux21 port map ( Y=>nx444, A0=>nx1441, A1=>nx1445, S0=>nx348);
   ix97 : xnor2 port map ( Y=>nx96, A0=>nx1377, A1=>T01(6));
   ix1446 : mux21 port map ( Y=>nx1445, A0=>nx350, A1=>nx428, S0=>nx354);
   ix351 : xnor2 port map ( Y=>nx350, A0=>nx1449, A1=>nx146);
   ix1450 : xnor2 port map ( Y=>nx1449, A0=>nx98, A1=>T01(5));
   ix429 : mux21 port map ( Y=>nx428, A0=>nx1453, A1=>nx1457, S0=>nx360);
   ix105 : xnor2 port map ( Y=>nx104, A0=>nx1395, A1=>T01(4));
   ix1458 : mux21 port map ( Y=>nx1457, A0=>nx362, A1=>nx412, S0=>nx366);
   ix363 : xnor2 port map ( Y=>nx362, A0=>nx1461, A1=>nx134);
   ix1462 : xnor2 port map ( Y=>nx1461, A0=>nx106, A1=>T01(3));
   ix413 : mux21 port map ( Y=>nx412, A0=>nx1465, A1=>nx1469, S0=>nx372);
   ix113 : xnor2 port map ( Y=>nx112, A0=>nx1413, A1=>T01(2));
   ix1470 : mux21 port map ( Y=>nx1469, A0=>nx374, A1=>nx396, S0=>nx378);
   ix397 : nor02 port map ( Y=>nx396, A0=>nx1291, A1=>nx392);
   ix373 : xnor2 port map ( Y=>nx372, A0=>nx368, A1=>nx370);
   ix369 : xnor2 port map ( Y=>nx368, A0=>nx112, A1=>nx1417);
   ix371 : xnor2 port map ( Y=>nx370, A0=>nx250, A1=>nx1483);
   ix251 : xnor2 port map ( Y=>nx250, A0=>nx1479, A1=>T12(2));
   ix1480 : xnor2 port map ( Y=>nx1479, A0=>nx1481, A1=>nx1321);
   ix1482 : xnor2 port map ( Y=>nx1481, A0=>T21(2), A1=>T22(1));
   ix1484 : aoi32 port map ( Y=>nx1483, A0=>nx258, A1=>T21(0), A2=>T12(0), 
      B0=>T12(1), B1=>nx256);
   ix1488 : inv01 port map ( Y=>nx1487, A=>T21(1));
   ix367 : xnor2 port map ( Y=>nx366, A0=>nx362, A1=>nx364);
   ix365 : xnor2 port map ( Y=>nx364, A0=>nx1493, A1=>nx272);
   ix1494 : xnor2 port map ( Y=>nx1493, A0=>nx244, A1=>T12(3));
   ix245 : xnor2 port map ( Y=>nx244, A0=>nx1497, A1=>nx188);
   ix1498 : xnor2 port map ( Y=>nx1497, A0=>T21(3), A1=>T22(2));
   ix189 : oai22 port map ( Y=>nx188, A0=>nx1481, A1=>nx1321, B0=>nx1501, B1
      =>nx1503);
   ix1502 : inv01 port map ( Y=>nx1501, A=>T22(1));
   ix1504 : inv01 port map ( Y=>nx1503, A=>T21(2));
   ix273 : oai22 port map ( Y=>nx272, A0=>nx1507, A1=>nx1483, B0=>nx809, B1
      =>nx1479);
   ix361 : xnor2 port map ( Y=>nx360, A0=>nx356, A1=>nx358);
   ix357 : xnor2 port map ( Y=>nx356, A0=>nx104, A1=>nx1399);
   ix359 : xnor2 port map ( Y=>nx358, A0=>nx242, A1=>nx1525);
   ix243 : xnor2 port map ( Y=>nx242, A0=>nx1517, A1=>T12(4));
   ix1518 : xnor2 port map ( Y=>nx1517, A0=>nx1519, A1=>nx1521);
   ix1520 : xnor2 port map ( Y=>nx1519, A0=>T21(4), A1=>T22(3));
   ix1522 : aoi22 port map ( Y=>nx1521, A0=>T22(2), A1=>T21(3), B0=>nx178, 
      B1=>nx188);
   ix1526 : aoi22 port map ( Y=>nx1525, A0=>T12(3), A1=>nx244, B0=>nx246, B1
      =>nx272);
   ix355 : xnor2 port map ( Y=>nx354, A0=>nx350, A1=>nx352);
   ix353 : xnor2 port map ( Y=>nx352, A0=>nx1533, A1=>nx284);
   ix1534 : xnor2 port map ( Y=>nx1533, A0=>nx236, A1=>T12(5));
   ix237 : xnor2 port map ( Y=>nx236, A0=>nx1537, A1=>nx200);
   ix1538 : xnor2 port map ( Y=>nx1537, A0=>T21(5), A1=>T22(4));
   ix201 : oai22 port map ( Y=>nx200, A0=>nx1519, A1=>nx1521, B0=>nx867, B1
      =>nx1541);
   ix1542 : inv01 port map ( Y=>nx1541, A=>T21(4));
   ix285 : oai22 port map ( Y=>nx284, A0=>nx1545, A1=>nx1525, B0=>nx799, B1
      =>nx1517);
   ix349 : xnor2 port map ( Y=>nx348, A0=>nx344, A1=>nx346);
   ix345 : xnor2 port map ( Y=>nx344, A0=>nx96, A1=>nx1381);
   ix347 : xnor2 port map ( Y=>nx346, A0=>nx234, A1=>nx1563);
   ix235 : xnor2 port map ( Y=>nx234, A0=>nx1555, A1=>T12(6));
   ix1556 : xnor2 port map ( Y=>nx1555, A0=>nx1557, A1=>nx1559);
   ix1558 : xnor2 port map ( Y=>nx1557, A0=>T21(6), A1=>T22(5));
   ix1560 : aoi22 port map ( Y=>nx1559, A0=>T22(4), A1=>T21(5), B0=>nx174, 
      B1=>nx200);
   ix1564 : aoi22 port map ( Y=>nx1563, A0=>T12(5), A1=>nx236, B0=>nx238, B1
      =>nx284);
   ix343 : xnor2 port map ( Y=>nx342, A0=>nx338, A1=>nx340);
   ix341 : xnor2 port map ( Y=>nx340, A0=>nx1571, A1=>nx296);
   ix1572 : xnor2 port map ( Y=>nx1571, A0=>nx228, A1=>T12(7));
   ix229 : xnor2 port map ( Y=>nx228, A0=>nx1575, A1=>nx212);
   ix1576 : xnor2 port map ( Y=>nx1575, A0=>T21(7), A1=>T22(6));
   ix213 : oai22 port map ( Y=>nx212, A0=>nx1557, A1=>nx1559, B0=>nx849, B1
      =>nx1579);
   ix1580 : inv01 port map ( Y=>nx1579, A=>T21(6));
   ix297 : oai22 port map ( Y=>nx296, A0=>nx1583, A1=>nx1563, B0=>nx893, B1
      =>nx1555);
   ix337 : xnor2 port map ( Y=>nx336, A0=>nx328, A1=>nx334);
   ix329 : xnor2 port map ( Y=>nx328, A0=>nx88, A1=>nx1337);
   ix335 : xnor2 port map ( Y=>nx334, A0=>nx226, A1=>nx1597);
   ix227 : xnor2 port map ( Y=>nx226, A0=>T22(7), A1=>nx1593);
   ix1594 : aoi22 port map ( Y=>nx1593, A0=>T22(6), A1=>T21(7), B0=>nx170, 
      B1=>nx212);
   ix1598 : aoi22 port map ( Y=>nx1597, A0=>T12(7), A1=>nx228, B0=>nx230, B1
      =>nx296);
   ix323 : xnor2 port map ( Y=>nx322, A0=>nx1603, A1=>nx1607);
   ix1606 : nor02 port map ( Y=>nx1603, A0=>nx166, A1=>nx82);
   ix1610 : nor02 port map ( Y=>nx1607, A0=>nx304, A1=>nx220);
   ix305 : nor02ii port map ( Y=>nx304, A0=>nx1597, A1=>nx226);
   ix1616 : xnor2 port map ( Y=>nx1615, A0=>nx1446, A1=>nx1458);
   ix1620 : xnor2 port map ( Y=>nx1619, A0=>nx372, A1=>nx570);
   ix571 : oai22 port map ( Y=>nx570, A0=>nx1623, A1=>nx1323, B0=>nx1625, B1
      =>nx376);
   ix1628 : xnor2 port map ( Y=>nx1627, A0=>nx492, A1=>nx372);
   ix493 : oai22 port map ( Y=>nx492, A0=>nx1327, A1=>nx1623, B0=>nx374, B1
      =>nx1631);
   ix1634 : xnor2 port map ( Y=>nx1633, A0=>nx1265, A1=>nx1635);
   ix1429 : xnor2 port map ( Y=>nx1428, A0=>nx366, A1=>nx1639);
   ix1640 : aoi22 port map ( Y=>nx1639, A0=>nx368, A1=>nx1641, B0=>nx372, B1
      =>nx570);
   ix1423 : xnor2 port map ( Y=>nx1422, A0=>nx1645, A1=>nx366);
   ix1646 : aoi22 port map ( Y=>nx1645, A0=>nx1465, A1=>nx370, B0=>nx492, B1
      =>nx372);
   ix1648 : xnor2 port map ( Y=>nx1647, A0=>nx1394, A1=>nx1406);
   ix1652 : xnor2 port map ( Y=>nx1651, A0=>nx360, A1=>nx586);
   ix587 : oai22 port map ( Y=>nx586, A0=>nx1655, A1=>nx1639, B0=>nx1657, B1
      =>nx364);
   ix1660 : xnor2 port map ( Y=>nx1659, A0=>nx508, A1=>nx360);
   ix509 : oai22 port map ( Y=>nx508, A0=>nx1645, A1=>nx1655, B0=>nx362, B1
      =>nx1663);
   ix1666 : xnor2 port map ( Y=>nx1665, A0=>nx1249, A1=>nx1667);
   ix1377 : xnor2 port map ( Y=>nx1376, A0=>nx354, A1=>nx1671);
   ix1672 : aoi22 port map ( Y=>nx1671, A0=>nx356, A1=>nx1673, B0=>nx360, B1
      =>nx586);
   ix1371 : xnor2 port map ( Y=>nx1370, A0=>nx1677, A1=>nx354);
   ix1678 : aoi22 port map ( Y=>nx1677, A0=>nx1453, A1=>nx358, B0=>nx508, B1
      =>nx360);
   ix1680 : xnor2 port map ( Y=>nx1679, A0=>nx1342, A1=>nx1354);
   ix1684 : xnor2 port map ( Y=>nx1683, A0=>nx348, A1=>nx602);
   ix603 : oai22 port map ( Y=>nx602, A0=>nx1687, A1=>nx1671, B0=>nx1689, B1
      =>nx352);
   ix1692 : xnor2 port map ( Y=>nx1691, A0=>nx524, A1=>nx348);
   ix525 : oai22 port map ( Y=>nx524, A0=>nx1677, A1=>nx1687, B0=>nx350, B1
      =>nx1695);
   ix1698 : xnor2 port map ( Y=>nx1697, A0=>nx1233, A1=>nx1699);
   ix1325 : xnor2 port map ( Y=>nx1324, A0=>nx342, A1=>nx1703);
   ix1704 : aoi22 port map ( Y=>nx1703, A0=>nx344, A1=>nx1705, B0=>nx348, B1
      =>nx602);
   ix1319 : xnor2 port map ( Y=>nx1318, A0=>nx1709, A1=>nx342);
   ix1710 : aoi22 port map ( Y=>nx1709, A0=>nx1441, A1=>nx346, B0=>nx524, B1
      =>nx348);
   ix1712 : xnor2 port map ( Y=>nx1711, A0=>nx1290, A1=>nx1302);
   ix1716 : xnor2 port map ( Y=>nx1715, A0=>nx336, A1=>nx618);
   ix619 : oai22 port map ( Y=>nx618, A0=>nx1719, A1=>nx1703, B0=>nx1721, B1
      =>nx340);
   ix1724 : xnor2 port map ( Y=>nx1723, A0=>nx540, A1=>nx336);
   ix541 : oai22 port map ( Y=>nx540, A0=>nx1709, A1=>nx1719, B0=>nx338, B1
      =>nx1727);
   ix1730 : xnor2 port map ( Y=>nx1729, A0=>nx1217, A1=>nx1731);
   ix1273 : xnor2 port map ( Y=>nx1272, A0=>nx322, A1=>nx1735);
   ix1736 : aoi22 port map ( Y=>nx1735, A0=>nx328, A1=>nx1737, B0=>nx336, B1
      =>nx618);
   ix1267 : xnor2 port map ( Y=>nx1266, A0=>nx1741, A1=>nx322);
   ix1742 : aoi22 port map ( Y=>nx1741, A0=>nx1431, A1=>nx334, B0=>nx540, B1
      =>nx336);
   ix1744 : xnor2 port map ( Y=>nx1743, A0=>nx1250, A1=>nx640);
   ix635 : oai22 port map ( Y=>nx634, A0=>nx1749, A1=>nx1735, B0=>nx1603, B1
      =>nx316);
   ix557 : oai22 port map ( Y=>nx556, A0=>nx1741, A1=>nx1749, B0=>nx310, B1
      =>nx1607);
   ix3403 : mux21 port map ( Y=>nx3402, A0=>nx1757, A1=>nx2509, S0=>nx2739);
   ix1758 : nor02 port map ( Y=>nx1757, A0=>nx2800, A1=>nx2190);
   ix2795 : oai22 port map ( Y=>nx2794, A0=>nx1763, A1=>nx1951, B0=>nx1765, 
      B1=>nx2476);
   ix1768 : nor02 port map ( Y=>nx1765, A0=>nx2326, A1=>nx2242);
   ix2327 : nor02ii port map ( Y=>nx2326, A0=>nx1771, A1=>nx2248);
   ix1772 : aoi22 port map ( Y=>nx1771, A0=>T12(7), A1=>nx2250, B0=>nx2252, 
      B1=>nx2318);
   ix2251 : xnor2 port map ( Y=>nx2250, A0=>nx1775, A1=>nx2234);
   ix1776 : xnor2 port map ( Y=>nx1775, A0=>T01(7), A1=>T02(6));
   ix2235 : oai22 port map ( Y=>nx2234, A0=>nx1779, A1=>nx1781, B0=>nx1801, 
      B1=>nx1379);
   ix1780 : xnor2 port map ( Y=>nx1779, A0=>T01(6), A1=>T02(5));
   ix1782 : aoi22 port map ( Y=>nx1781, A0=>T02(4), A1=>T01(5), B0=>nx2196, 
      B1=>nx2222);
   ix2223 : oai22 port map ( Y=>nx2222, A0=>nx1787, A1=>nx1789, B0=>nx1799, 
      B1=>nx1397);
   ix1788 : xnor2 port map ( Y=>nx1787, A0=>T01(4), A1=>T02(3));
   ix1790 : aoi22 port map ( Y=>nx1789, A0=>T02(2), A1=>T01(3), B0=>nx2200, 
      B1=>nx2210);
   ix2211 : oai22 port map ( Y=>nx2210, A0=>nx1795, A1=>nx1797, B0=>nx885, 
      B1=>nx1415);
   ix1796 : xnor2 port map ( Y=>nx1795, A0=>T01(2), A1=>T02(1));
   ix1798 : nand02 port map ( Y=>nx1797, A0=>T02(0), A1=>T01(1));
   ix1800 : inv01 port map ( Y=>nx1799, A=>T02(3));
   ix1802 : inv01 port map ( Y=>nx1801, A=>T02(5));
   ix2319 : oai22 port map ( Y=>nx2318, A0=>nx1807, A1=>nx1811, B0=>nx893, 
      B1=>nx1809);
   ix1810 : xnor2 port map ( Y=>nx1809, A0=>nx1779, A1=>nx1781);
   ix1812 : aoi22 port map ( Y=>nx1811, A0=>T12(5), A1=>nx2258, B0=>nx2260, 
      B1=>nx2306);
   ix2259 : xnor2 port map ( Y=>nx2258, A0=>nx1815, A1=>nx2222);
   ix1816 : xnor2 port map ( Y=>nx1815, A0=>T01(5), A1=>T02(4));
   ix2307 : oai22 port map ( Y=>nx2306, A0=>nx1821, A1=>nx1825, B0=>nx799, 
      B1=>nx1823);
   ix1824 : xnor2 port map ( Y=>nx1823, A0=>nx1787, A1=>nx1789);
   ix1826 : aoi22 port map ( Y=>nx1825, A0=>T12(3), A1=>nx2266, B0=>nx2268, 
      B1=>nx2294);
   ix2267 : xnor2 port map ( Y=>nx2266, A0=>nx1829, A1=>nx2210);
   ix1830 : xnor2 port map ( Y=>nx1829, A0=>T01(3), A1=>T02(2));
   ix2295 : oai22 port map ( Y=>nx2294, A0=>nx1835, A1=>nx1839, B0=>nx809, 
      B1=>nx1837);
   ix1838 : xnor2 port map ( Y=>nx1837, A0=>nx1795, A1=>nx1797);
   ix1840 : aoi32 port map ( Y=>nx1839, A0=>nx2280, A1=>T12(0), A2=>T01(0), 
      B0=>T12(1), B1=>nx2278);
   ix2281 : xnor2 port map ( Y=>nx2280, A0=>nx1843, A1=>T12(1));
   ix1844 : oai21 port map ( Y=>nx1843, A0=>T01(1), A1=>T02(0), B0=>nx1797);
   ix1848 : inv01 port map ( Y=>nx1847, A=>T01(1));
   ix2249 : xnor2 port map ( Y=>nx2248, A0=>T02(7), A1=>nx1851);
   ix1852 : aoi22 port map ( Y=>nx1851, A0=>T02(6), A1=>T01(7), B0=>nx2192, 
      B1=>nx2234);
   ix2465 : nor02ii port map ( Y=>nx2464, A0=>nx1863, A1=>nx2386);
   ix1864 : aoi22 port map ( Y=>nx1863, A0=>T21(7), A1=>nx2388, B0=>nx2390, 
      B1=>nx2456);
   ix2389 : xnor2 port map ( Y=>nx2388, A0=>nx1867, A1=>nx2372);
   ix1868 : xnor2 port map ( Y=>nx1867, A0=>T10(7), A1=>T20(6));
   ix2373 : oai22 port map ( Y=>nx2372, A0=>nx1871, A1=>nx1873, B0=>nx1073, 
      B1=>nx1109);
   ix1872 : xnor2 port map ( Y=>nx1871, A0=>T10(6), A1=>T20(5));
   ix1874 : aoi22 port map ( Y=>nx1873, A0=>T20(4), A1=>T10(5), B0=>nx2334, 
      B1=>nx2360);
   ix2361 : oai22 port map ( Y=>nx2360, A0=>nx1879, A1=>nx1881, B0=>nx1027, 
      B1=>nx1067);
   ix1880 : xnor2 port map ( Y=>nx1879, A0=>T10(4), A1=>T20(3));
   ix1882 : aoi22 port map ( Y=>nx1881, A0=>T20(2), A1=>T10(3), B0=>nx2338, 
      B1=>nx2348);
   ix2349 : oai22 port map ( Y=>nx2348, A0=>nx1887, A1=>nx1889, B0=>nx1891, 
      B1=>nx1021);
   ix1888 : xnor2 port map ( Y=>nx1887, A0=>T10(2), A1=>T20(1));
   ix1890 : nand02 port map ( Y=>nx1889, A0=>T20(0), A1=>T10(1));
   ix1892 : inv01 port map ( Y=>nx1891, A=>T20(1));
   ix2457 : oai22 port map ( Y=>nx2456, A0=>nx1899, A1=>nx1903, B0=>nx1579, 
      B1=>nx1901);
   ix1902 : xnor2 port map ( Y=>nx1901, A0=>nx1871, A1=>nx1873);
   ix1904 : aoi22 port map ( Y=>nx1903, A0=>T21(5), A1=>nx2396, B0=>nx2398, 
      B1=>nx2444);
   ix2397 : xnor2 port map ( Y=>nx2396, A0=>nx1907, A1=>nx2360);
   ix1908 : xnor2 port map ( Y=>nx1907, A0=>T10(5), A1=>T20(4));
   ix1912 : inv01 port map ( Y=>nx1911, A=>T21(5));
   ix2445 : oai22 port map ( Y=>nx2444, A0=>nx1915, A1=>nx1919, B0=>nx1541, 
      B1=>nx1917);
   ix1918 : xnor2 port map ( Y=>nx1917, A0=>nx1879, A1=>nx1881);
   ix1920 : aoi22 port map ( Y=>nx1919, A0=>T21(3), A1=>nx2404, B0=>nx2406, 
      B1=>nx2432);
   ix2405 : xnor2 port map ( Y=>nx2404, A0=>nx1923, A1=>nx2348);
   ix1924 : xnor2 port map ( Y=>nx1923, A0=>T10(3), A1=>T20(2));
   ix1928 : inv01 port map ( Y=>nx1927, A=>T21(3));
   ix2433 : oai22 port map ( Y=>nx2432, A0=>nx1931, A1=>nx1935, B0=>nx1503, 
      B1=>nx1933);
   ix1934 : xnor2 port map ( Y=>nx1933, A0=>nx1887, A1=>nx1889);
   ix1936 : aoi32 port map ( Y=>nx1935, A0=>nx2418, A1=>T21(0), A2=>T10(0), 
      B0=>T21(1), B1=>nx2416);
   ix2419 : xnor2 port map ( Y=>nx2418, A0=>nx1939, A1=>T21(1));
   ix1940 : oai21 port map ( Y=>nx1939, A0=>T10(1), A1=>T20(0), B0=>nx1889);
   ix2387 : xnor2 port map ( Y=>nx2386, A0=>T20(7), A1=>nx1945);
   ix1946 : aoi22 port map ( Y=>nx1945, A0=>T20(6), A1=>T10(7), B0=>nx2330, 
      B1=>nx2372);
   ix1952 : aoi22 port map ( Y=>nx1951, A0=>nx2488, A1=>nx1955, B0=>nx2496, 
      B1=>nx2778);
   ix2489 : xnor2 port map ( Y=>nx2488, A0=>nx2248, A1=>nx1771);
   ix2497 : xnor2 port map ( Y=>nx2496, A0=>nx2488, A1=>nx2494);
   ix2495 : xnor2 port map ( Y=>nx2494, A0=>nx2386, A1=>nx1863);
   ix2779 : oai22 port map ( Y=>nx2778, A0=>nx1963, A1=>nx1973, B0=>nx2065, 
      B1=>nx2500);
   ix2499 : xnor2 port map ( Y=>nx2498, A0=>nx1967, A1=>nx2318);
   ix1968 : xnor2 port map ( Y=>nx1967, A0=>nx2250, A1=>T12(7));
   ix2501 : xnor2 port map ( Y=>nx2500, A0=>nx1971, A1=>nx2456);
   ix1972 : xnor2 port map ( Y=>nx1971, A0=>nx2388, A1=>T21(7));
   ix1974 : aoi22 port map ( Y=>nx1973, A0=>nx2504, A1=>nx1979, B0=>nx2508, 
      B1=>nx2762);
   ix2505 : xnor2 port map ( Y=>nx2504, A0=>nx2256, A1=>nx1811);
   ix2257 : xnor2 port map ( Y=>nx2256, A0=>nx1809, A1=>T12(6));
   ix2395 : xnor2 port map ( Y=>nx2394, A0=>nx1901, A1=>T21(6));
   ix2509 : xnor2 port map ( Y=>nx2508, A0=>nx2504, A1=>nx2506);
   ix2507 : xnor2 port map ( Y=>nx2506, A0=>nx2394, A1=>nx1903);
   ix2763 : oai22 port map ( Y=>nx2762, A0=>nx1989, A1=>nx1999, B0=>nx2063, 
      B1=>nx2512);
   ix2511 : xnor2 port map ( Y=>nx2510, A0=>nx1993, A1=>nx2306);
   ix1994 : xnor2 port map ( Y=>nx1993, A0=>nx2258, A1=>T12(5));
   ix2513 : xnor2 port map ( Y=>nx2512, A0=>nx1997, A1=>nx2444);
   ix1998 : xnor2 port map ( Y=>nx1997, A0=>nx2396, A1=>T21(5));
   ix2000 : aoi22 port map ( Y=>nx1999, A0=>nx2516, A1=>nx2005, B0=>nx2520, 
      B1=>nx2746);
   ix2517 : xnor2 port map ( Y=>nx2516, A0=>nx2264, A1=>nx1825);
   ix2265 : xnor2 port map ( Y=>nx2264, A0=>nx1823, A1=>T12(4));
   ix2403 : xnor2 port map ( Y=>nx2402, A0=>nx1917, A1=>T21(4));
   ix2521 : xnor2 port map ( Y=>nx2520, A0=>nx2516, A1=>nx2518);
   ix2519 : xnor2 port map ( Y=>nx2518, A0=>nx2402, A1=>nx1919);
   ix2747 : oai22 port map ( Y=>nx2746, A0=>nx2015, A1=>nx2025, B0=>nx2061, 
      B1=>nx2524);
   ix2523 : xnor2 port map ( Y=>nx2522, A0=>nx2019, A1=>nx2294);
   ix2020 : xnor2 port map ( Y=>nx2019, A0=>nx2266, A1=>T12(3));
   ix2525 : xnor2 port map ( Y=>nx2524, A0=>nx2023, A1=>nx2432);
   ix2024 : xnor2 port map ( Y=>nx2023, A0=>nx2404, A1=>T21(3));
   ix2026 : aoi22 port map ( Y=>nx2025, A0=>nx2528, A1=>nx2031, B0=>nx2532, 
      B1=>nx2730);
   ix2529 : xnor2 port map ( Y=>nx2528, A0=>nx2272, A1=>nx1839);
   ix2273 : xnor2 port map ( Y=>nx2272, A0=>nx1837, A1=>T12(2));
   ix2411 : xnor2 port map ( Y=>nx2410, A0=>nx1933, A1=>T21(2));
   ix2533 : xnor2 port map ( Y=>nx2532, A0=>nx2528, A1=>nx2530);
   ix2531 : xnor2 port map ( Y=>nx2530, A0=>nx2410, A1=>nx1935);
   ix2731 : oai22 port map ( Y=>nx2730, A0=>nx2041, A1=>nx2051, B0=>nx2059, 
      B1=>nx2536);
   ix2535 : xnor2 port map ( Y=>nx2534, A0=>nx2280, A1=>nx2045);
   ix2046 : nand02 port map ( Y=>nx2045, A0=>T12(0), A1=>T01(0));
   ix2537 : xnor2 port map ( Y=>nx2536, A0=>nx2418, A1=>nx2049);
   ix2050 : nand02 port map ( Y=>nx2049, A0=>T21(0), A1=>T10(0));
   ix2052 : nor02 port map ( Y=>nx2051, A0=>nx2552, A1=>nx2057);
   ix2553 : xnor2 port map ( Y=>nx2552, A0=>nx2055, A1=>nx2057);
   ix2056 : oai21 port map ( Y=>nx2055, A0=>T01(0), A1=>T12(0), B0=>nx2045);
   ix2058 : oai21 port map ( Y=>nx2057, A0=>T10(0), A1=>T21(0), B0=>nx2049);
   ix2717 : oai22 port map ( Y=>nx2716, A0=>nx2069, A1=>nx1763, B0=>nx2470, 
      B1=>nx2105);
   ix2070 : aoi22 port map ( Y=>nx2069, A0=>nx2071, A1=>nx2494, B0=>nx2700, 
      B1=>nx2496);
   ix2701 : oai22 port map ( Y=>nx2700, A0=>nx2075, A1=>nx1963, B0=>nx2498, 
      B1=>nx2101);
   ix2076 : aoi22 port map ( Y=>nx2075, A0=>nx2077, A1=>nx2506, B0=>nx2684, 
      B1=>nx2508);
   ix2685 : oai22 port map ( Y=>nx2684, A0=>nx2081, A1=>nx1989, B0=>nx2510, 
      B1=>nx2099);
   ix2082 : aoi22 port map ( Y=>nx2081, A0=>nx2083, A1=>nx2518, B0=>nx2668, 
      B1=>nx2520);
   ix2669 : oai22 port map ( Y=>nx2668, A0=>nx2087, A1=>nx2015, B0=>nx2522, 
      B1=>nx2097);
   ix2088 : aoi22 port map ( Y=>nx2087, A0=>nx2089, A1=>nx2530, B0=>nx2652, 
      B1=>nx2532);
   ix2653 : oai22 port map ( Y=>nx2652, A0=>nx2093, A1=>nx2041, B0=>nx2534, 
      B1=>nx2095);
   ix2094 : nor02 port map ( Y=>nx2093, A0=>nx2051, A1=>nx2552);
   ix2108 : nor02 port map ( Y=>nx2105, A0=>nx2464, A1=>nx2380);
   ix2621 : mux21 port map ( Y=>nx2620, A0=>nx2071, A1=>nx2115, S0=>nx2496);
   ix2116 : mux21 port map ( Y=>nx2115, A0=>nx2498, A1=>nx2604, S0=>nx2502);
   ix2605 : mux21 port map ( Y=>nx2604, A0=>nx2077, A1=>nx2119, S0=>nx2508);
   ix2120 : mux21 port map ( Y=>nx2119, A0=>nx2510, A1=>nx2588, S0=>nx2514);
   ix2589 : mux21 port map ( Y=>nx2588, A0=>nx2083, A1=>nx2123, S0=>nx2520);
   ix2124 : mux21 port map ( Y=>nx2123, A0=>nx2522, A1=>nx2572, S0=>nx2526);
   ix2573 : mux21 port map ( Y=>nx2572, A0=>nx2089, A1=>nx2127, S0=>nx2532);
   ix2128 : mux21 port map ( Y=>nx2127, A0=>nx2534, A1=>nx2556, S0=>nx2538);
   ix2557 : nor02 port map ( Y=>nx2556, A0=>nx2055, A1=>nx2552);
   ix2539 : xnor2 port map ( Y=>nx2538, A0=>nx2534, A1=>nx2536);
   ix2527 : xnor2 port map ( Y=>nx2526, A0=>nx2522, A1=>nx2524);
   ix2515 : xnor2 port map ( Y=>nx2514, A0=>nx2510, A1=>nx2512);
   ix2503 : xnor2 port map ( Y=>nx2502, A0=>nx2498, A1=>nx2500);
   ix2483 : xnor2 port map ( Y=>nx2482, A0=>nx1765, A1=>nx2105);
   ix2191 : mux21 port map ( Y=>nx2190, A0=>nx2184, A1=>nx2106, S0=>nx3043);
   ix2185 : oai22 port map ( Y=>nx2184, A0=>nx2145, A1=>nx2319, B0=>nx2147, 
      B1=>nx1866);
   ix2150 : nor02 port map ( Y=>nx2147, A0=>nx1716, A1=>nx1632);
   ix1717 : nor02ii port map ( Y=>nx1716, A0=>nx2153, A1=>nx1638);
   ix2154 : aoi22 port map ( Y=>nx2153, A0=>T02(7), A1=>nx1640, B0=>nx1642, 
      B1=>nx1708);
   ix1641 : xnor2 port map ( Y=>nx1640, A0=>nx2157, A1=>nx1624);
   ix2158 : xnor2 port map ( Y=>nx2157, A0=>T00(7), A1=>T01(6));
   ix1625 : oai22 port map ( Y=>nx1624, A0=>nx2161, A1=>nx2163, B0=>nx1087, 
      B1=>nx1389);
   ix2162 : xnor2 port map ( Y=>nx2161, A0=>T00(6), A1=>T01(5));
   ix2164 : aoi22 port map ( Y=>nx2163, A0=>T00(5), A1=>T01(4), B0=>nx1586, 
      B1=>nx1612);
   ix1613 : oai22 port map ( Y=>nx1612, A0=>nx2169, A1=>nx2171, B0=>nx1041, 
      B1=>nx1407);
   ix2170 : xnor2 port map ( Y=>nx2169, A0=>T00(4), A1=>T01(3));
   ix2172 : aoi22 port map ( Y=>nx2171, A0=>T00(3), A1=>T01(2), B0=>nx1590, 
      B1=>nx1600);
   ix1601 : oai22 port map ( Y=>nx1600, A0=>nx2177, A1=>nx2179, B0=>nx995, 
      B1=>nx1847);
   ix2178 : xnor2 port map ( Y=>nx2177, A0=>T00(2), A1=>T01(1));
   ix2180 : nand02 port map ( Y=>nx2179, A0=>T00(1), A1=>T01(0));
   ix1709 : oai22 port map ( Y=>nx1708, A0=>nx2185, A1=>nx2189, B0=>nx827, 
      B1=>nx2187);
   ix2188 : xnor2 port map ( Y=>nx2187, A0=>nx2161, A1=>nx2163);
   ix2190 : aoi22 port map ( Y=>nx2189, A0=>T02(5), A1=>nx1648, B0=>nx1650, 
      B1=>nx1696);
   ix1649 : xnor2 port map ( Y=>nx1648, A0=>nx2193, A1=>nx1612);
   ix2194 : xnor2 port map ( Y=>nx2193, A0=>T00(5), A1=>T01(4));
   ix1697 : oai22 port map ( Y=>nx1696, A0=>nx2199, A1=>nx2203, B0=>nx823, 
      B1=>nx2201);
   ix2202 : xnor2 port map ( Y=>nx2201, A0=>nx2169, A1=>nx2171);
   ix2204 : aoi22 port map ( Y=>nx2203, A0=>T02(3), A1=>nx1656, B0=>nx1658, 
      B1=>nx1684);
   ix1657 : xnor2 port map ( Y=>nx1656, A0=>nx2207, A1=>nx1600);
   ix2208 : xnor2 port map ( Y=>nx2207, A0=>T00(3), A1=>T01(2));
   ix1685 : oai22 port map ( Y=>nx1684, A0=>nx2213, A1=>nx2217, B0=>nx819, 
      B1=>nx2215);
   ix2216 : xnor2 port map ( Y=>nx2215, A0=>nx2177, A1=>nx2179);
   ix2218 : aoi32 port map ( Y=>nx2217, A0=>nx1670, A1=>T00(0), A2=>T02(0), 
      B0=>T02(1), B1=>nx1668);
   ix1671 : xnor2 port map ( Y=>nx1670, A0=>nx2221, A1=>T02(1));
   ix2222 : oai21 port map ( Y=>nx2221, A0=>T01(0), A1=>T00(1), B0=>nx2179);
   ix1639 : xnor2 port map ( Y=>nx1638, A0=>T01(7), A1=>nx2229);
   ix2230 : aoi22 port map ( Y=>nx2229, A0=>T00(7), A1=>T01(6), B0=>nx1582, 
      B1=>nx1624);
   ix1855 : nor02ii port map ( Y=>nx1854, A0=>nx2239, A1=>nx1776);
   ix2240 : aoi22 port map ( Y=>nx2239, A0=>T22(7), A1=>nx1778, B0=>nx1780, 
      B1=>nx1846);
   ix1779 : xnor2 port map ( Y=>nx1778, A0=>nx2243, A1=>nx1762);
   ix2244 : xnor2 port map ( Y=>nx2243, A0=>T20(7), A1=>T21(6));
   ix1763 : oai22 port map ( Y=>nx1762, A0=>nx2247, A1=>nx2249, B0=>nx1911, 
      B1=>nx1095);
   ix2248 : xnor2 port map ( Y=>nx2247, A0=>T20(6), A1=>T21(5));
   ix2250 : aoi22 port map ( Y=>nx2249, A0=>T21(4), A1=>T20(5), B0=>nx1724, 
      B1=>nx1750);
   ix1751 : oai22 port map ( Y=>nx1750, A0=>nx2255, A1=>nx2257, B0=>nx1927, 
      B1=>nx1049);
   ix2256 : xnor2 port map ( Y=>nx2255, A0=>T20(4), A1=>T21(3));
   ix2258 : aoi22 port map ( Y=>nx2257, A0=>T21(2), A1=>T20(3), B0=>nx1728, 
      B1=>nx1738);
   ix1739 : oai22 port map ( Y=>nx1738, A0=>nx2263, A1=>nx2265, B0=>nx1487, 
      B1=>nx1003);
   ix2264 : xnor2 port map ( Y=>nx2263, A0=>T20(2), A1=>T21(1));
   ix2266 : nand02 port map ( Y=>nx2265, A0=>T21(0), A1=>T20(1));
   ix1847 : oai22 port map ( Y=>nx1846, A0=>nx2271, A1=>nx2275, B0=>nx839, 
      B1=>nx2273);
   ix2274 : xnor2 port map ( Y=>nx2273, A0=>nx2247, A1=>nx2249);
   ix2276 : aoi22 port map ( Y=>nx2275, A0=>T22(5), A1=>nx1786, B0=>nx1788, 
      B1=>nx1834);
   ix1787 : xnor2 port map ( Y=>nx1786, A0=>nx2279, A1=>nx1750);
   ix2280 : xnor2 port map ( Y=>nx2279, A0=>T20(5), A1=>T21(4));
   ix1835 : oai22 port map ( Y=>nx1834, A0=>nx2285, A1=>nx2289, B0=>nx857, 
      B1=>nx2287);
   ix2288 : xnor2 port map ( Y=>nx2287, A0=>nx2255, A1=>nx2257);
   ix2290 : aoi22 port map ( Y=>nx2289, A0=>T22(3), A1=>nx1794, B0=>nx1796, 
      B1=>nx1822);
   ix1795 : xnor2 port map ( Y=>nx1794, A0=>nx2293, A1=>nx1738);
   ix2294 : xnor2 port map ( Y=>nx2293, A0=>T20(3), A1=>T21(2));
   ix1823 : oai22 port map ( Y=>nx1822, A0=>nx2299, A1=>nx2303, B0=>nx875, 
      B1=>nx2301);
   ix2302 : xnor2 port map ( Y=>nx2301, A0=>nx2263, A1=>nx2265);
   ix2304 : aoi32 port map ( Y=>nx2303, A0=>nx1808, A1=>T22(0), A2=>T20(0), 
      B0=>T22(1), B1=>nx1806);
   ix1809 : xnor2 port map ( Y=>nx1808, A0=>nx2307, A1=>T22(1));
   ix2308 : oai21 port map ( Y=>nx2307, A0=>T20(1), A1=>T21(0), B0=>nx2265);
   ix1777 : xnor2 port map ( Y=>nx1776, A0=>T21(7), A1=>nx2313);
   ix2314 : aoi22 port map ( Y=>nx2313, A0=>T21(6), A1=>T20(7), B0=>nx1720, 
      B1=>nx1762);
   ix2320 : aoi22 port map ( Y=>nx2319, A0=>nx1878, A1=>nx2323, B0=>nx1886, 
      B1=>nx2168);
   ix1879 : xnor2 port map ( Y=>nx1878, A0=>nx1638, A1=>nx2153);
   ix1887 : xnor2 port map ( Y=>nx1886, A0=>nx1878, A1=>nx1884);
   ix1885 : xnor2 port map ( Y=>nx1884, A0=>nx1776, A1=>nx2239);
   ix2169 : oai22 port map ( Y=>nx2168, A0=>nx2331, A1=>nx2341, B0=>nx2433, 
      B1=>nx1890);
   ix1889 : xnor2 port map ( Y=>nx1888, A0=>nx2335, A1=>nx1708);
   ix2336 : xnor2 port map ( Y=>nx2335, A0=>nx1640, A1=>T02(7));
   ix1891 : xnor2 port map ( Y=>nx1890, A0=>nx2339, A1=>nx1846);
   ix2340 : xnor2 port map ( Y=>nx2339, A0=>nx1778, A1=>T22(7));
   ix2342 : aoi22 port map ( Y=>nx2341, A0=>nx1894, A1=>nx2347, B0=>nx1898, 
      B1=>nx2152);
   ix1895 : xnor2 port map ( Y=>nx1894, A0=>nx1646, A1=>nx2189);
   ix1647 : xnor2 port map ( Y=>nx1646, A0=>nx2187, A1=>T02(6));
   ix1785 : xnor2 port map ( Y=>nx1784, A0=>nx2273, A1=>T22(6));
   ix1899 : xnor2 port map ( Y=>nx1898, A0=>nx1894, A1=>nx1896);
   ix1897 : xnor2 port map ( Y=>nx1896, A0=>nx1784, A1=>nx2275);
   ix2153 : oai22 port map ( Y=>nx2152, A0=>nx2357, A1=>nx2367, B0=>nx2431, 
      B1=>nx1902);
   ix1901 : xnor2 port map ( Y=>nx1900, A0=>nx2361, A1=>nx1696);
   ix2362 : xnor2 port map ( Y=>nx2361, A0=>nx1648, A1=>T02(5));
   ix1903 : xnor2 port map ( Y=>nx1902, A0=>nx2365, A1=>nx1834);
   ix2366 : xnor2 port map ( Y=>nx2365, A0=>nx1786, A1=>T22(5));
   ix2368 : aoi22 port map ( Y=>nx2367, A0=>nx1906, A1=>nx2373, B0=>nx1910, 
      B1=>nx2136);
   ix1907 : xnor2 port map ( Y=>nx1906, A0=>nx1654, A1=>nx2203);
   ix1655 : xnor2 port map ( Y=>nx1654, A0=>nx2201, A1=>T02(4));
   ix1793 : xnor2 port map ( Y=>nx1792, A0=>nx2287, A1=>T22(4));
   ix1911 : xnor2 port map ( Y=>nx1910, A0=>nx1906, A1=>nx1908);
   ix1909 : xnor2 port map ( Y=>nx1908, A0=>nx1792, A1=>nx2289);
   ix2137 : oai22 port map ( Y=>nx2136, A0=>nx2383, A1=>nx2393, B0=>nx2429, 
      B1=>nx1914);
   ix1913 : xnor2 port map ( Y=>nx1912, A0=>nx2387, A1=>nx1684);
   ix2388 : xnor2 port map ( Y=>nx2387, A0=>nx1656, A1=>T02(3));
   ix1915 : xnor2 port map ( Y=>nx1914, A0=>nx2391, A1=>nx1822);
   ix2392 : xnor2 port map ( Y=>nx2391, A0=>nx1794, A1=>T22(3));
   ix2394 : aoi22 port map ( Y=>nx2393, A0=>nx1918, A1=>nx2399, B0=>nx1922, 
      B1=>nx2120);
   ix1919 : xnor2 port map ( Y=>nx1918, A0=>nx1662, A1=>nx2217);
   ix1663 : xnor2 port map ( Y=>nx1662, A0=>nx2215, A1=>T02(2));
   ix1801 : xnor2 port map ( Y=>nx1800, A0=>nx2301, A1=>T22(2));
   ix1923 : xnor2 port map ( Y=>nx1922, A0=>nx1918, A1=>nx1920);
   ix1921 : xnor2 port map ( Y=>nx1920, A0=>nx1800, A1=>nx2303);
   ix2121 : oai22 port map ( Y=>nx2120, A0=>nx2409, A1=>nx2419, B0=>nx2427, 
      B1=>nx1926);
   ix1925 : xnor2 port map ( Y=>nx1924, A0=>nx1670, A1=>nx2413);
   ix2414 : nand02 port map ( Y=>nx2413, A0=>T00(0), A1=>T02(0));
   ix1927 : xnor2 port map ( Y=>nx1926, A0=>nx1808, A1=>nx2417);
   ix2418 : nand02 port map ( Y=>nx2417, A0=>T22(0), A1=>T20(0));
   ix2420 : nor02 port map ( Y=>nx2419, A0=>nx1942, A1=>nx2425);
   ix1943 : xnor2 port map ( Y=>nx1942, A0=>nx2423, A1=>nx2425);
   ix2424 : oai21 port map ( Y=>nx2423, A0=>T02(0), A1=>T00(0), B0=>nx2413);
   ix2426 : oai21 port map ( Y=>nx2425, A0=>T20(0), A1=>T22(0), B0=>nx2417);
   ix2107 : oai22 port map ( Y=>nx2106, A0=>nx2437, A1=>nx2145, B0=>nx1860, 
      B1=>nx2473);
   ix2438 : aoi22 port map ( Y=>nx2437, A0=>nx2439, A1=>nx1884, B0=>nx2090, 
      B1=>nx1886);
   ix2091 : oai22 port map ( Y=>nx2090, A0=>nx2443, A1=>nx2331, B0=>nx1888, 
      B1=>nx2469);
   ix2444 : aoi22 port map ( Y=>nx2443, A0=>nx2445, A1=>nx1896, B0=>nx2074, 
      B1=>nx1898);
   ix2075 : oai22 port map ( Y=>nx2074, A0=>nx2449, A1=>nx2357, B0=>nx1900, 
      B1=>nx2467);
   ix2450 : aoi22 port map ( Y=>nx2449, A0=>nx2451, A1=>nx1908, B0=>nx2058, 
      B1=>nx1910);
   ix2059 : oai22 port map ( Y=>nx2058, A0=>nx2455, A1=>nx2383, B0=>nx1912, 
      B1=>nx2465);
   ix2456 : aoi22 port map ( Y=>nx2455, A0=>nx2457, A1=>nx1920, B0=>nx2042, 
      B1=>nx1922);
   ix2043 : oai22 port map ( Y=>nx2042, A0=>nx2461, A1=>nx2409, B0=>nx1924, 
      B1=>nx2463);
   ix2462 : nor02 port map ( Y=>nx2461, A0=>nx2419, A1=>nx1942);
   ix2476 : nor02 port map ( Y=>nx2473, A0=>nx1854, A1=>nx1770);
   ix2480 : mux21 port map ( Y=>nx2477, A0=>nx1860, A1=>nx2010, S0=>nx1872);
   ix2011 : mux21 port map ( Y=>nx2010, A0=>nx2439, A1=>nx2483, S0=>nx1886);
   ix2484 : mux21 port map ( Y=>nx2483, A0=>nx1888, A1=>nx1994, S0=>nx1892);
   ix1995 : mux21 port map ( Y=>nx1994, A0=>nx2445, A1=>nx2487, S0=>nx1898);
   ix2488 : mux21 port map ( Y=>nx2487, A0=>nx1900, A1=>nx1978, S0=>nx1904);
   ix1979 : mux21 port map ( Y=>nx1978, A0=>nx2451, A1=>nx2491, S0=>nx1910);
   ix2492 : mux21 port map ( Y=>nx2491, A0=>nx1912, A1=>nx1962, S0=>nx1916);
   ix1963 : mux21 port map ( Y=>nx1962, A0=>nx2457, A1=>nx2495, S0=>nx1922);
   ix2496 : mux21 port map ( Y=>nx2495, A0=>nx1924, A1=>nx1946, S0=>nx1928);
   ix1947 : nor02 port map ( Y=>nx1946, A0=>nx2423, A1=>nx1942);
   ix1929 : xnor2 port map ( Y=>nx1928, A0=>nx1924, A1=>nx1926);
   ix1917 : xnor2 port map ( Y=>nx1916, A0=>nx1912, A1=>nx1914);
   ix1905 : xnor2 port map ( Y=>nx1904, A0=>nx1900, A1=>nx1902);
   ix1893 : xnor2 port map ( Y=>nx1892, A0=>nx1888, A1=>nx1890);
   ix1873 : xnor2 port map ( Y=>nx1872, A0=>nx2147, A1=>nx2473);
   ix2510 : mux21 port map ( Y=>nx2509, A0=>nx3140, A1=>nx3386, S0=>nx2735);
   ix3141 : mux21 port map ( Y=>nx3140, A0=>nx2513, A1=>nx2519, S0=>nx3047);
   ix2811 : xnor2 port map ( Y=>nx2810, A0=>nx2482, A1=>nx1951);
   ix2805 : xnor2 port map ( Y=>nx2804, A0=>nx2069, A1=>nx2482);
   ix2520 : mux21 port map ( Y=>nx2519, A0=>nx2822, A1=>nx2816, S0=>nx3043);
   ix2823 : xnor2 port map ( Y=>nx2822, A0=>nx1872, A1=>nx2319);
   ix2817 : xnor2 port map ( Y=>nx2816, A0=>nx2437, A1=>nx1872);
   ix2526 : mux21 port map ( Y=>nx2525, A0=>nx2800, A1=>nx3114, S0=>nx2663);
   ix3115 : mux21 port map ( Y=>nx3114, A0=>nx2513, A1=>nx2529, S0=>nx2661);
   ix2530 : mux21 port map ( Y=>nx2529, A0=>nx2840, A1=>nx3098, S0=>nx2653);
   ix2534 : xnor2 port map ( Y=>nx2533, A0=>nx2496, A1=>nx2778);
   ix2536 : xnor2 port map ( Y=>nx2535, A0=>nx2700, A1=>nx2496);
   ix3099 : mux21 port map ( Y=>nx3098, A0=>nx2539, A1=>nx2545, S0=>nx2645);
   ix2863 : xnor2 port map ( Y=>nx2862, A0=>nx2502, A1=>nx1973);
   ix2857 : xnor2 port map ( Y=>nx2856, A0=>nx2075, A1=>nx2502);
   ix2546 : mux21 port map ( Y=>nx2545, A0=>nx2892, A1=>nx3082, S0=>nx2637);
   ix2550 : xnor2 port map ( Y=>nx2549, A0=>nx2508, A1=>nx2762);
   ix2552 : xnor2 port map ( Y=>nx2551, A0=>nx2684, A1=>nx2508);
   ix3083 : mux21 port map ( Y=>nx3082, A0=>nx2555, A1=>nx2561, S0=>nx2629);
   ix2915 : xnor2 port map ( Y=>nx2914, A0=>nx2514, A1=>nx1999);
   ix2909 : xnor2 port map ( Y=>nx2908, A0=>nx2081, A1=>nx2514);
   ix2562 : mux21 port map ( Y=>nx2561, A0=>nx2944, A1=>nx3066, S0=>nx2621);
   ix2566 : xnor2 port map ( Y=>nx2565, A0=>nx2520, A1=>nx2746);
   ix2568 : xnor2 port map ( Y=>nx2567, A0=>nx2668, A1=>nx2520);
   ix3067 : mux21 port map ( Y=>nx3066, A0=>nx2571, A1=>nx2577, S0=>nx2613);
   ix2967 : xnor2 port map ( Y=>nx2966, A0=>nx2526, A1=>nx2025);
   ix2961 : xnor2 port map ( Y=>nx2960, A0=>nx2087, A1=>nx2526);
   ix2578 : mux21 port map ( Y=>nx2577, A0=>nx2996, A1=>nx3050, S0=>nx2605);
   ix2582 : xnor2 port map ( Y=>nx2581, A0=>nx2532, A1=>nx2730);
   ix2584 : xnor2 port map ( Y=>nx2583, A0=>nx2652, A1=>nx2532);
   ix3051 : mux21 port map ( Y=>nx3050, A0=>nx2587, A1=>nx2593, S0=>nx2597);
   ix3019 : xnor2 port map ( Y=>nx3018, A0=>nx2538, A1=>nx2051);
   ix3013 : xnor2 port map ( Y=>nx3012, A0=>nx2093, A1=>nx2538);
   ix2594 : nand02 port map ( Y=>nx2593, A0=>nx2595, A1=>nx1942);
   ix2598 : xnor2 port map ( Y=>nx2597, A0=>nx2587, A1=>nx2599);
   ix2600 : mux21 port map ( Y=>nx2599, A0=>nx3030, A1=>nx3024, S0=>nx3043);
   ix3031 : xnor2 port map ( Y=>nx3030, A0=>nx1928, A1=>nx2419);
   ix3025 : xnor2 port map ( Y=>nx3024, A0=>nx2461, A1=>nx1928);
   ix2606 : xnor2 port map ( Y=>nx2605, A0=>nx2996, A1=>nx3008);
   ix3009 : mux21 port map ( Y=>nx3008, A0=>nx2609, A1=>nx2611, S0=>nx3043);
   ix2610 : xnor2 port map ( Y=>nx2609, A0=>nx1922, A1=>nx2120);
   ix2612 : xnor2 port map ( Y=>nx2611, A0=>nx2042, A1=>nx1922);
   ix2614 : xnor2 port map ( Y=>nx2613, A0=>nx2571, A1=>nx2615);
   ix2616 : mux21 port map ( Y=>nx2615, A0=>nx2978, A1=>nx2972, S0=>nx3043);
   ix2979 : xnor2 port map ( Y=>nx2978, A0=>nx1916, A1=>nx2393);
   ix2973 : xnor2 port map ( Y=>nx2972, A0=>nx2455, A1=>nx1916);
   ix2622 : xnor2 port map ( Y=>nx2621, A0=>nx2944, A1=>nx2956);
   ix2957 : mux21 port map ( Y=>nx2956, A0=>nx2625, A1=>nx2627, S0=>nx3043);
   ix2626 : xnor2 port map ( Y=>nx2625, A0=>nx1910, A1=>nx2136);
   ix2628 : xnor2 port map ( Y=>nx2627, A0=>nx2058, A1=>nx1910);
   ix2630 : xnor2 port map ( Y=>nx2629, A0=>nx2555, A1=>nx2631);
   ix2632 : mux21 port map ( Y=>nx2631, A0=>nx2926, A1=>nx2920, S0=>nx3045);
   ix2927 : xnor2 port map ( Y=>nx2926, A0=>nx1904, A1=>nx2367);
   ix2921 : xnor2 port map ( Y=>nx2920, A0=>nx2449, A1=>nx1904);
   ix2638 : xnor2 port map ( Y=>nx2637, A0=>nx2892, A1=>nx2904);
   ix2905 : mux21 port map ( Y=>nx2904, A0=>nx2641, A1=>nx2643, S0=>nx3045);
   ix2642 : xnor2 port map ( Y=>nx2641, A0=>nx1898, A1=>nx2152);
   ix2644 : xnor2 port map ( Y=>nx2643, A0=>nx2074, A1=>nx1898);
   ix2646 : xnor2 port map ( Y=>nx2645, A0=>nx2539, A1=>nx2647);
   ix2648 : mux21 port map ( Y=>nx2647, A0=>nx2874, A1=>nx2868, S0=>nx3045);
   ix2875 : xnor2 port map ( Y=>nx2874, A0=>nx1892, A1=>nx2341);
   ix2869 : xnor2 port map ( Y=>nx2868, A0=>nx2443, A1=>nx1892);
   ix2654 : xnor2 port map ( Y=>nx2653, A0=>nx2840, A1=>nx2852);
   ix2853 : mux21 port map ( Y=>nx2852, A0=>nx2657, A1=>nx2659, S0=>nx3045);
   ix2658 : xnor2 port map ( Y=>nx2657, A0=>nx1886, A1=>nx2168);
   ix2660 : xnor2 port map ( Y=>nx2659, A0=>nx2090, A1=>nx1886);
   ix2662 : xnor2 port map ( Y=>nx2661, A0=>nx2513, A1=>nx2519);
   ix2664 : xnor2 port map ( Y=>nx2663, A0=>nx2800, A1=>nx2190);
   ix3387 : mux21 port map ( Y=>nx3386, A0=>nx2667, A1=>nx2669, S0=>nx2731);
   ix2668 : mux21 port map ( Y=>nx2667, A0=>nx2840, A1=>nx2852, S0=>nx3047);
   ix2670 : mux21 port map ( Y=>nx2669, A0=>nx3176, A1=>nx3370, S0=>nx2727);
   ix3177 : mux21 port map ( Y=>nx3176, A0=>nx2539, A1=>nx2647, S0=>nx3047);
   ix3371 : mux21 port map ( Y=>nx3370, A0=>nx2675, A1=>nx2677, S0=>nx2723);
   ix2676 : mux21 port map ( Y=>nx2675, A0=>nx2892, A1=>nx2904, S0=>nx3047);
   ix2678 : mux21 port map ( Y=>nx2677, A0=>nx3212, A1=>nx3354, S0=>nx2719);
   ix3213 : mux21 port map ( Y=>nx3212, A0=>nx2555, A1=>nx2631, S0=>nx3047);
   ix3355 : mux21 port map ( Y=>nx3354, A0=>nx2683, A1=>nx2685, S0=>nx2715);
   ix2684 : mux21 port map ( Y=>nx2683, A0=>nx2944, A1=>nx2956, S0=>nx3047);
   ix2686 : mux21 port map ( Y=>nx2685, A0=>nx3248, A1=>nx3338, S0=>nx2711);
   ix3249 : mux21 port map ( Y=>nx3248, A0=>nx2571, A1=>nx2615, S0=>nx3049);
   ix3339 : mux21 port map ( Y=>nx3338, A0=>nx2691, A1=>nx2693, S0=>nx2707);
   ix2692 : mux21 port map ( Y=>nx2691, A0=>nx2996, A1=>nx3008, S0=>nx3049);
   ix2694 : mux21 port map ( Y=>nx2693, A0=>nx3284, A1=>nx3322, S0=>nx2703);
   ix3285 : mux21 port map ( Y=>nx3284, A0=>nx2587, A1=>nx2599, S0=>nx3049);
   ix3323 : nor02ii port map ( Y=>nx3322, A0=>nx3318, A1=>nx3306);
   ix3307 : mux21 port map ( Y=>nx3306, A0=>nx2552, A1=>nx1942, S0=>nx3049);
   ix2704 : xnor2 port map ( Y=>nx2703, A0=>nx3284, A1=>nx3292);
   ix2708 : xnor2 port map ( Y=>nx2707, A0=>nx2691, A1=>nx2709);
   ix2712 : xnor2 port map ( Y=>nx2711, A0=>nx3248, A1=>nx3256);
   ix2716 : xnor2 port map ( Y=>nx2715, A0=>nx2683, A1=>nx2717);
   ix2720 : xnor2 port map ( Y=>nx2719, A0=>nx3212, A1=>nx3220);
   ix2724 : xnor2 port map ( Y=>nx2723, A0=>nx2675, A1=>nx2725);
   ix2728 : xnor2 port map ( Y=>nx2727, A0=>nx3176, A1=>nx3184);
   ix2732 : xnor2 port map ( Y=>nx2731, A0=>nx2667, A1=>nx2733);
   ix2736 : xnor2 port map ( Y=>nx2735, A0=>nx3140, A1=>nx3148);
   ix2740 : xnor2 port map ( Y=>nx2739, A0=>nx1757, A1=>nx2741);
   ix2742 : nor02 port map ( Y=>nx2741, A0=>nx1250, A1=>nx640);
   ix3859 : oai22 port map ( Y=>nx3858, A0=>nx3056, A1=>nx2757, B0=>nx3060, 
      B1=>nx2765);
   ix3839 : nor02 port map ( Y=>EDGE_dup0, A0=>THRESHOLD(12), A1=>nx2769);
   ix2770 : mux21 port map ( Y=>nx2769, A0=>nx3826, A1=>nx3682, S0=>nx3684);
   ix3827 : oai22 port map ( Y=>nx3826, A0=>nx3692, A1=>nx2909, B0=>nx2775, 
      B1=>THRESHOLD(10));
   ix3693 : xnor2 port map ( Y=>nx3692, A0=>nx2775, A1=>THRESHOLD(10));
   ix2776 : xnor2 port map ( Y=>nx2775, A0=>nx3410, A1=>nx3680);
   ix3411 : nand02 port map ( Y=>nx3410, A0=>nx1757, A1=>nx2741);
   ix3681 : nor02 port map ( Y=>nx3680, A0=>nx2781, A1=>nx2783);
   ix2784 : nand02 port map ( Y=>nx2783, A0=>nx3426, A1=>nx3676);
   ix3677 : oai22 port map ( Y=>nx3676, A0=>nx2789, A1=>nx2803, B0=>nx2791, 
      B1=>nx2793);
   ix2790 : xnor2 port map ( Y=>nx2789, A0=>nx2791, A1=>nx2793);
   ix2794 : aoi221 port map ( Y=>nx2793, A0=>nx640, A1=>nx3021, B0=>nx2800, 
      B1=>nx3019, C0=>nx3462);
   ix3463 : ao22 port map ( Y=>nx3462, A0=>nx1250, A1=>nx3458, B0=>nx2190, 
      B1=>nx3450);
   ix2804 : aoi22 port map ( Y=>nx2803, A0=>nx3474, A1=>nx3488, B0=>nx3490, 
      B1=>nx3664);
   ix2812 : nand02 port map ( Y=>nx2811, A0=>nx3049, A1=>nx3013);
   ix3491 : xnor2 port map ( Y=>nx3490, A0=>nx3474, A1=>nx2821);
   ix2822 : aoi221 port map ( Y=>nx2821, A0=>nx1276, A1=>nx3021, B0=>nx2814, 
      B1=>nx3019, C0=>nx3486);
   ix3487 : oai22 port map ( Y=>nx3486, A0=>nx1217, A1=>nx2757, B0=>nx2519, 
      B1=>nx2765);
   ix3665 : oai22 port map ( Y=>nx3664, A0=>nx2831, A1=>nx2839, B0=>nx2833, 
      B1=>nx2835);
   ix2832 : xnor2 port map ( Y=>nx2831, A0=>nx2833, A1=>nx2835);
   ix2836 : aoi221 port map ( Y=>nx2835, A0=>nx1302, A1=>nx3021, B0=>nx2840, 
      B1=>nx3019, C0=>nx3510);
   ix3511 : ao22 port map ( Y=>nx3510, A0=>nx1290, A1=>nx3458, B0=>nx2852, 
      B1=>nx3450);
   ix2840 : aoi22 port map ( Y=>nx2839, A0=>nx3522, A1=>nx3536, B0=>nx3538, 
      B1=>nx3652);
   ix3539 : xnor2 port map ( Y=>nx3538, A0=>nx3522, A1=>nx2853);
   ix2854 : aoi221 port map ( Y=>nx2853, A0=>nx1328, A1=>nx3021, B0=>nx2866, 
      B1=>nx3019, C0=>nx3534);
   ix3535 : oai22 port map ( Y=>nx3534, A0=>nx1233, A1=>nx2757, B0=>nx2647, 
      B1=>nx2765);
   ix3653 : oai22 port map ( Y=>nx3652, A0=>nx2861, A1=>nx2869, B0=>nx2863, 
      B1=>nx2865);
   ix2862 : xnor2 port map ( Y=>nx2861, A0=>nx2863, A1=>nx2865);
   ix2866 : aoi221 port map ( Y=>nx2865, A0=>nx1354, A1=>nx3021, B0=>nx2892, 
      B1=>nx3019, C0=>nx3558);
   ix3559 : ao22 port map ( Y=>nx3558, A0=>nx1342, A1=>nx3458, B0=>nx2904, 
      B1=>nx3450);
   ix2870 : aoi22 port map ( Y=>nx2869, A0=>nx3570, A1=>nx3584, B0=>nx3586, 
      B1=>nx3640);
   ix3587 : xnor2 port map ( Y=>nx3586, A0=>nx3570, A1=>nx2881);
   ix2882 : aoi221 port map ( Y=>nx2881, A0=>nx1380, A1=>nx3444, B0=>nx2918, 
      B1=>nx3438, C0=>nx3582);
   ix3583 : oai22 port map ( Y=>nx3582, A0=>nx1249, A1=>nx2757, B0=>nx2631, 
      B1=>nx2765);
   ix3641 : oai22 port map ( Y=>nx3640, A0=>nx2889, A1=>nx2897, B0=>nx2891, 
      B1=>nx2893);
   ix2890 : xnor2 port map ( Y=>nx2889, A0=>nx2891, A1=>nx2893);
   ix2894 : aoi221 port map ( Y=>nx2893, A0=>nx1406, A1=>nx3444, B0=>nx2944, 
      B1=>nx3438, C0=>nx3606);
   ix3607 : ao22 port map ( Y=>nx3606, A0=>nx1394, A1=>nx3458, B0=>nx2956, 
      B1=>nx3450);
   ix2902 : aoi221 port map ( Y=>nx2901, A0=>nx1432, A1=>nx3444, B0=>nx2970, 
      B1=>nx3438, C0=>nx3630);
   ix3631 : oai22 port map ( Y=>nx3630, A0=>nx1265, A1=>nx2757, B0=>nx2615, 
      B1=>nx2765);
   ix2910 : mux21 port map ( Y=>nx2909, A0=>nx3810, A1=>nx3698, S0=>nx3700);
   ix3811 : oai22 port map ( Y=>nx3810, A0=>nx3708, A1=>nx2915, B0=>nx2913, 
      B1=>THRESHOLD(8));
   ix3709 : xnor2 port map ( Y=>nx3708, A0=>nx2913, A1=>THRESHOLD(8));
   ix2914 : xnor2 port map ( Y=>nx2913, A0=>nx3426, A1=>nx3676);
   ix2916 : mux21 port map ( Y=>nx2915, A0=>nx3794, A1=>nx3710, S0=>nx3712);
   ix3795 : oai22 port map ( Y=>nx3794, A0=>nx3716, A1=>nx2923, B0=>nx2921, 
      B1=>THRESHOLD(6));
   ix3717 : xnor2 port map ( Y=>nx3716, A0=>nx2921, A1=>THRESHOLD(6));
   ix2922 : xnor2 port map ( Y=>nx2921, A0=>nx3490, A1=>nx3664);
   ix2924 : mux21 port map ( Y=>nx2923, A0=>nx3778, A1=>nx3718, S0=>nx3720);
   ix3779 : oai22 port map ( Y=>nx3778, A0=>nx3724, A1=>nx2931, B0=>nx2929, 
      B1=>THRESHOLD(4));
   ix3725 : xnor2 port map ( Y=>nx3724, A0=>nx2929, A1=>THRESHOLD(4));
   ix2930 : xnor2 port map ( Y=>nx2929, A0=>nx3538, A1=>nx3652);
   ix2932 : mux21 port map ( Y=>nx2931, A0=>nx3762, A1=>nx3726, S0=>nx3728);
   ix3763 : oai22 port map ( Y=>nx3762, A0=>nx3732, A1=>nx2939, B0=>nx2937, 
      B1=>THRESHOLD(2));
   ix3733 : xnor2 port map ( Y=>nx3732, A0=>nx2937, A1=>THRESHOLD(2));
   ix2938 : xnor2 port map ( Y=>nx2937, A0=>nx3586, A1=>nx3640);
   ix2940 : mux21 port map ( Y=>nx2939, A0=>nx3734, A1=>nx3746, S0=>nx2949);
   ix3735 : xnor2 port map ( Y=>nx3734, A0=>nx2889, A1=>nx3634);
   ix3635 : nor02 port map ( Y=>nx3634, A0=>nx2899, A1=>nx2901);
   ix3747 : nor02 port map ( Y=>nx3746, A0=>nx2947, A1=>THRESHOLD(0));
   ix2948 : xnor2 port map ( Y=>nx2947, A0=>nx2899, A1=>nx2901);
   ix2950 : xnor2 port map ( Y=>nx2949, A0=>nx3734, A1=>THRESHOLD(1));
   ix3729 : xnor2 port map ( Y=>nx3728, A0=>nx2955, A1=>THRESHOLD(3));
   ix2956 : xnor2 port map ( Y=>nx2955, A0=>nx2861, A1=>nx2869);
   ix3721 : xnor2 port map ( Y=>nx3720, A0=>nx2961, A1=>THRESHOLD(5));
   ix2962 : xnor2 port map ( Y=>nx2961, A0=>nx2831, A1=>nx2839);
   ix3713 : xnor2 port map ( Y=>nx3712, A0=>nx2965, A1=>THRESHOLD(7));
   ix2966 : xnor2 port map ( Y=>nx2965, A0=>nx2789, A1=>nx2803);
   ix3701 : xnor2 port map ( Y=>nx3700, A0=>nx2971, A1=>THRESHOLD(9));
   ix2972 : xnor2 port map ( Y=>nx2971, A0=>nx2781, A1=>nx2783);
   ix3685 : xnor2 port map ( Y=>nx3684, A0=>nx2977, A1=>THRESHOLD(11));
   ix2978 : nand02 port map ( Y=>nx2977, A0=>nx3410, A1=>nx3680);
   ix3869 : aoi21 port map ( Y=>DIRECTION(2), A0=>nx2765, A1=>nx2757, B0=>
      nx2983);
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
      D=>nx679, CLK=>CLOCK, S=>RESET);
   ix3727 : inv01 port map ( Y=>nx3726, A=>nx2955);
   ix3719 : inv01 port map ( Y=>nx3718, A=>nx2961);
   ix3711 : inv01 port map ( Y=>nx3710, A=>nx2965);
   ix3699 : inv01 port map ( Y=>nx3698, A=>nx2971);
   ix3683 : inv01 port map ( Y=>nx3682, A=>nx2977);
   ix2898 : inv01 port map ( Y=>nx2897, A=>nx3634);
   ix3585 : inv01 port map ( Y=>nx3584, A=>nx2881);
   ix3537 : inv01 port map ( Y=>nx3536, A=>nx2853);
   ix3489 : inv01 port map ( Y=>nx3488, A=>nx2821);
   ix3459 : inv01 port map ( Y=>nx3458, A=>nx2757);
   ix2766 : inv01 port map ( Y=>nx2765, A=>nx3450);
   ix3439 : inv01 port map ( Y=>nx3438, A=>nx2811);
   ix2748 : inv01 port map ( Y=>nx2747, A=>nx3402);
   ix2971 : inv01 port map ( Y=>nx2970, A=>nx2571);
   ix2919 : inv01 port map ( Y=>nx2918, A=>nx2555);
   ix2867 : inv01 port map ( Y=>nx2866, A=>nx2539);
   ix2815 : inv01 port map ( Y=>nx2814, A=>nx2513);
   ix2596 : inv01 port map ( Y=>nx2595, A=>nx2552);
   ix2042 : inv01 port map ( Y=>nx2041, A=>nx2538);
   ix2096 : inv01 port map ( Y=>nx2095, A=>nx2536);
   ix2060 : inv01 port map ( Y=>nx2059, A=>nx2534);
   ix2032 : inv01 port map ( Y=>nx2031, A=>nx2530);
   ix2090 : inv01 port map ( Y=>nx2089, A=>nx2528);
   ix2016 : inv01 port map ( Y=>nx2015, A=>nx2526);
   ix2098 : inv01 port map ( Y=>nx2097, A=>nx2524);
   ix2062 : inv01 port map ( Y=>nx2061, A=>nx2522);
   ix2006 : inv01 port map ( Y=>nx2005, A=>nx2518);
   ix2084 : inv01 port map ( Y=>nx2083, A=>nx2516);
   ix1990 : inv01 port map ( Y=>nx1989, A=>nx2514);
   ix2100 : inv01 port map ( Y=>nx2099, A=>nx2512);
   ix2064 : inv01 port map ( Y=>nx2063, A=>nx2510);
   ix1980 : inv01 port map ( Y=>nx1979, A=>nx2506);
   ix2078 : inv01 port map ( Y=>nx2077, A=>nx2504);
   ix1964 : inv01 port map ( Y=>nx1963, A=>nx2502);
   ix2102 : inv01 port map ( Y=>nx2101, A=>nx2500);
   ix2066 : inv01 port map ( Y=>nx2065, A=>nx2498);
   ix1956 : inv01 port map ( Y=>nx1955, A=>nx2494);
   ix2072 : inv01 port map ( Y=>nx2071, A=>nx2488);
   ix1764 : inv01 port map ( Y=>nx1763, A=>nx2482);
   ix2477 : inv01 port map ( Y=>nx2476, A=>nx2105);
   ix2471 : inv01 port map ( Y=>nx2470, A=>nx1765);
   ix2417 : inv01 port map ( Y=>nx2416, A=>nx1939);
   ix1932 : inv01 port map ( Y=>nx1931, A=>nx2410);
   ix2407 : inv01 port map ( Y=>nx2406, A=>nx2023);
   ix1916 : inv01 port map ( Y=>nx1915, A=>nx2402);
   ix2399 : inv01 port map ( Y=>nx2398, A=>nx1997);
   ix1900 : inv01 port map ( Y=>nx1899, A=>nx2394);
   ix2391 : inv01 port map ( Y=>nx2390, A=>nx1971);
   ix2339 : inv01 port map ( Y=>nx2338, A=>nx1923);
   ix2335 : inv01 port map ( Y=>nx2334, A=>nx1907);
   ix2331 : inv01 port map ( Y=>nx2330, A=>nx1867);
   ix2279 : inv01 port map ( Y=>nx2278, A=>nx1843);
   ix1836 : inv01 port map ( Y=>nx1835, A=>nx2272);
   ix2269 : inv01 port map ( Y=>nx2268, A=>nx2019);
   ix1822 : inv01 port map ( Y=>nx1821, A=>nx2264);
   ix2261 : inv01 port map ( Y=>nx2260, A=>nx1993);
   ix1808 : inv01 port map ( Y=>nx1807, A=>nx2256);
   ix2253 : inv01 port map ( Y=>nx2252, A=>nx1967);
   ix2201 : inv01 port map ( Y=>nx2200, A=>nx1829);
   ix2197 : inv01 port map ( Y=>nx2196, A=>nx1815);
   ix2193 : inv01 port map ( Y=>nx2192, A=>nx1775);
   ix2410 : inv01 port map ( Y=>nx2409, A=>nx1928);
   ix2464 : inv01 port map ( Y=>nx2463, A=>nx1926);
   ix2428 : inv01 port map ( Y=>nx2427, A=>nx1924);
   ix2400 : inv01 port map ( Y=>nx2399, A=>nx1920);
   ix2458 : inv01 port map ( Y=>nx2457, A=>nx1918);
   ix2384 : inv01 port map ( Y=>nx2383, A=>nx1916);
   ix2466 : inv01 port map ( Y=>nx2465, A=>nx1914);
   ix2430 : inv01 port map ( Y=>nx2429, A=>nx1912);
   ix2374 : inv01 port map ( Y=>nx2373, A=>nx1908);
   ix2452 : inv01 port map ( Y=>nx2451, A=>nx1906);
   ix2358 : inv01 port map ( Y=>nx2357, A=>nx1904);
   ix2468 : inv01 port map ( Y=>nx2467, A=>nx1902);
   ix2432 : inv01 port map ( Y=>nx2431, A=>nx1900);
   ix2348 : inv01 port map ( Y=>nx2347, A=>nx1896);
   ix2446 : inv01 port map ( Y=>nx2445, A=>nx1894);
   ix2332 : inv01 port map ( Y=>nx2331, A=>nx1892);
   ix2470 : inv01 port map ( Y=>nx2469, A=>nx1890);
   ix2434 : inv01 port map ( Y=>nx2433, A=>nx1888);
   ix2324 : inv01 port map ( Y=>nx2323, A=>nx1884);
   ix2440 : inv01 port map ( Y=>nx2439, A=>nx1878);
   ix2146 : inv01 port map ( Y=>nx2145, A=>nx1872);
   ix1867 : inv01 port map ( Y=>nx1866, A=>nx2473);
   ix1861 : inv01 port map ( Y=>nx1860, A=>nx2147);
   ix1807 : inv01 port map ( Y=>nx1806, A=>nx2307);
   ix2300 : inv01 port map ( Y=>nx2299, A=>nx1800);
   ix1797 : inv01 port map ( Y=>nx1796, A=>nx2391);
   ix2286 : inv01 port map ( Y=>nx2285, A=>nx1792);
   ix1789 : inv01 port map ( Y=>nx1788, A=>nx2365);
   ix2272 : inv01 port map ( Y=>nx2271, A=>nx1784);
   ix1781 : inv01 port map ( Y=>nx1780, A=>nx2339);
   ix1729 : inv01 port map ( Y=>nx1728, A=>nx2293);
   ix1725 : inv01 port map ( Y=>nx1724, A=>nx2279);
   ix1721 : inv01 port map ( Y=>nx1720, A=>nx2243);
   ix1669 : inv01 port map ( Y=>nx1668, A=>nx2221);
   ix2214 : inv01 port map ( Y=>nx2213, A=>nx1662);
   ix1659 : inv01 port map ( Y=>nx1658, A=>nx2387);
   ix2200 : inv01 port map ( Y=>nx2199, A=>nx1654);
   ix1651 : inv01 port map ( Y=>nx1650, A=>nx2361);
   ix2186 : inv01 port map ( Y=>nx2185, A=>nx1646);
   ix1643 : inv01 port map ( Y=>nx1642, A=>nx2335);
   ix1591 : inv01 port map ( Y=>nx1590, A=>nx2207);
   ix1587 : inv01 port map ( Y=>nx1586, A=>nx2193);
   ix1583 : inv01 port map ( Y=>nx1582, A=>nx2157);
   ix1433 : inv01 port map ( Y=>nx1432, A=>nx1635);
   ix1381 : inv01 port map ( Y=>nx1380, A=>nx1667);
   ix1329 : inv01 port map ( Y=>nx1328, A=>nx1699);
   ix1277 : inv01 port map ( Y=>nx1276, A=>nx1731);
   ix1288 : inv01 port map ( Y=>nx1287, A=>nx1002);
   ix1176 : inv01 port map ( Y=>nx1175, A=>nx988);
   ix1208 : inv01 port map ( Y=>nx1207, A=>nx986);
   ix1180 : inv01 port map ( Y=>nx1179, A=>nx984);
   ix1172 : inv01 port map ( Y=>nx1171, A=>nx980);
   ix936 : inv01 port map ( Y=>nx935, A=>nx978);
   ix1168 : inv01 port map ( Y=>nx1167, A=>nx976);
   ix1210 : inv01 port map ( Y=>nx1209, A=>nx974);
   ix1182 : inv01 port map ( Y=>nx1181, A=>nx972);
   ix1164 : inv01 port map ( Y=>nx1163, A=>nx968);
   ix924 : inv01 port map ( Y=>nx923, A=>nx966);
   ix1160 : inv01 port map ( Y=>nx1159, A=>nx964);
   ix1212 : inv01 port map ( Y=>nx1211, A=>nx962);
   ix1184 : inv01 port map ( Y=>nx1183, A=>nx960);
   ix1156 : inv01 port map ( Y=>nx1155, A=>nx956);
   ix912 : inv01 port map ( Y=>nx911, A=>nx954);
   ix1152 : inv01 port map ( Y=>nx1151, A=>nx952);
   ix1214 : inv01 port map ( Y=>nx1213, A=>nx950);
   ix1186 : inv01 port map ( Y=>nx1185, A=>nx948);
   ix1148 : inv01 port map ( Y=>nx1147, A=>nx944);
   ix902 : inv01 port map ( Y=>nx901, A=>nx938);
   ix1142 : inv01 port map ( Y=>nx1141, A=>nx932);
   ix927 : inv01 port map ( Y=>nx926, A=>nx1123);
   ix921 : inv01 port map ( Y=>nx920, A=>nx1119);
   ix867 : inv01 port map ( Y=>nx866, A=>nx961);
   ix1002 : inv01 port map ( Y=>nx1001, A=>nx860);
   ix857 : inv01 port map ( Y=>nx856, A=>nx987);
   ix1048 : inv01 port map ( Y=>nx1047, A=>nx852);
   ix849 : inv01 port map ( Y=>nx848, A=>nx1033);
   ix1094 : inv01 port map ( Y=>nx1093, A=>nx844);
   ix841 : inv01 port map ( Y=>nx840, A=>nx1079);
   ix789 : inv01 port map ( Y=>nx788, A=>nx991);
   ix785 : inv01 port map ( Y=>nx784, A=>nx1037);
   ix781 : inv01 port map ( Y=>nx780, A=>nx1083);
   ix729 : inv01 port map ( Y=>nx728, A=>nx881);
   ix872 : inv01 port map ( Y=>nx871, A=>nx722);
   ix719 : inv01 port map ( Y=>nx718, A=>nx931);
   ix854 : inv01 port map ( Y=>nx853, A=>nx714);
   ix711 : inv01 port map ( Y=>nx710, A=>nx919);
   ix836 : inv01 port map ( Y=>nx835, A=>nx706);
   ix703 : inv01 port map ( Y=>nx702, A=>nx907);
   ix651 : inv01 port map ( Y=>nx650, A=>nx863);
   ix647 : inv01 port map ( Y=>nx646, A=>nx845);
   ix643 : inv01 port map ( Y=>nx642, A=>nx789);
   ix1624 : inv01 port map ( Y=>nx1623, A=>nx378);
   ix1632 : inv01 port map ( Y=>nx1631, A=>nx376);
   ix1626 : inv01 port map ( Y=>nx1625, A=>nx374);
   ix1642 : inv01 port map ( Y=>nx1641, A=>nx370);
   ix1466 : inv01 port map ( Y=>nx1465, A=>nx368);
   ix1656 : inv01 port map ( Y=>nx1655, A=>nx366);
   ix1664 : inv01 port map ( Y=>nx1663, A=>nx364);
   ix1658 : inv01 port map ( Y=>nx1657, A=>nx362);
   ix1674 : inv01 port map ( Y=>nx1673, A=>nx358);
   ix1454 : inv01 port map ( Y=>nx1453, A=>nx356);
   ix1688 : inv01 port map ( Y=>nx1687, A=>nx354);
   ix1696 : inv01 port map ( Y=>nx1695, A=>nx352);
   ix1690 : inv01 port map ( Y=>nx1689, A=>nx350);
   ix1706 : inv01 port map ( Y=>nx1705, A=>nx346);
   ix1442 : inv01 port map ( Y=>nx1441, A=>nx344);
   ix1720 : inv01 port map ( Y=>nx1719, A=>nx342);
   ix1728 : inv01 port map ( Y=>nx1727, A=>nx340);
   ix1722 : inv01 port map ( Y=>nx1721, A=>nx338);
   ix1738 : inv01 port map ( Y=>nx1737, A=>nx334);
   ix1432 : inv01 port map ( Y=>nx1431, A=>nx328);
   ix1750 : inv01 port map ( Y=>nx1749, A=>nx322);
   ix317 : inv01 port map ( Y=>nx316, A=>nx1607);
   ix311 : inv01 port map ( Y=>nx310, A=>nx1603);
   ix257 : inv01 port map ( Y=>nx256, A=>nx1319);
   ix1508 : inv01 port map ( Y=>nx1507, A=>nx250);
   ix247 : inv01 port map ( Y=>nx246, A=>nx1493);
   ix1546 : inv01 port map ( Y=>nx1545, A=>nx242);
   ix239 : inv01 port map ( Y=>nx238, A=>nx1533);
   ix1584 : inv01 port map ( Y=>nx1583, A=>nx234);
   ix231 : inv01 port map ( Y=>nx230, A=>nx1571);
   ix179 : inv01 port map ( Y=>nx178, A=>nx1497);
   ix175 : inv01 port map ( Y=>nx174, A=>nx1537);
   ix171 : inv01 port map ( Y=>nx170, A=>nx1575);
   ix119 : inv01 port map ( Y=>nx118, A=>nx1311);
   ix1412 : inv01 port map ( Y=>nx1411, A=>nx112);
   ix109 : inv01 port map ( Y=>nx108, A=>nx1461);
   ix1394 : inv01 port map ( Y=>nx1393, A=>nx104);
   ix101 : inv01 port map ( Y=>nx100, A=>nx1449);
   ix1376 : inv01 port map ( Y=>nx1375, A=>nx96);
   ix93 : inv01 port map ( Y=>nx92, A=>nx1437);
   ix41 : inv01 port map ( Y=>nx40, A=>nx1403);
   ix37 : inv01 port map ( Y=>nx36, A=>nx1385);
   ix33 : inv01 port map ( Y=>nx32, A=>nx1341);
   ix2984 : inv01 port map ( Y=>nx2983, A=>EDGE_dup0);
   ix3011 : inv01 port map ( Y=>nx3013, A=>nx3064);
   ix3018 : inv01 port map ( Y=>nx3019, A=>nx2811);
   ix3022 : buf02 port map ( Y=>nx3023, A=>nx775);
   ix3024 : buf02 port map ( Y=>nx3025, A=>nx775);
   ix3026 : inv01 port map ( Y=>nx3027, A=>nx1135);
   ix3042 : buf02 port map ( Y=>nx3043, A=>nx2477);
   ix3044 : buf02 port map ( Y=>nx3045, A=>nx2477);
   ix3046 : buf02 port map ( Y=>nx3047, A=>nx2525);
   ix3048 : buf02 port map ( Y=>nx3049, A=>nx2525);
   ix693 : nor02ii port map ( Y=>nx692, A0=>nx889, A1=>T12(7));
   ix831 : nor02ii port map ( Y=>nx830, A0=>nx1105, A1=>T10(7));
   ix3445 : and02 port map ( Y=>nx3444, A0=>nx3069, A1=>nx3064);
   ix1302 : mux21 port map ( Y=>nx1301, A0=>nx1474, A1=>nx1480, S0=>nx3056);
   ix1334 : mux21_ni port map ( Y=>nx468, A0=>nx310, A1=>nx460, S0=>nx322);
   ix83 : nor02ii port map ( Y=>nx82, A0=>nx1423, A1=>T00(7));
   ix221 : nor02ii port map ( Y=>nx220, A0=>nx1593, A1=>T22(7));
   ix1459 : mux21 port map ( Y=>nx1458, A0=>nx1627, A1=>nx1619, S0=>nx3056);
   ix1636 : mux21 port map ( Y=>nx1635, A0=>nx1422, A1=>nx1428, S0=>nx3056);
   ix1407 : mux21 port map ( Y=>nx1406, A0=>nx1659, A1=>nx1651, S0=>nx3056);
   ix1668 : mux21 port map ( Y=>nx1667, A0=>nx1370, A1=>nx1376, S0=>nx3056);
   ix1355 : mux21 port map ( Y=>nx1354, A0=>nx1691, A1=>nx1683, S0=>nx3058);
   ix1700 : mux21 port map ( Y=>nx1699, A0=>nx1318, A1=>nx1324, S0=>nx3058);
   ix1303 : mux21 port map ( Y=>nx1302, A0=>nx1723, A1=>nx1715, S0=>nx3058);
   ix1732 : mux21 port map ( Y=>nx1731, A0=>nx1266, A1=>nx1272, S0=>nx3058);
   ix641 : mux21 port map ( Y=>nx640, A0=>nx556, A1=>nx634, S0=>nx3058);
   ix2801 : mux21 port map ( Y=>nx2800, A0=>nx2716, A1=>nx2794, S0=>nx3060);
   ix2243 : nor02ii port map ( Y=>nx2242, A0=>nx1851, A1=>T02(7));
   ix2381 : nor02ii port map ( Y=>nx2380, A0=>nx1945, A1=>T20(7));
   ix2112 : mux21_ni port map ( Y=>nx2628, A0=>nx2470, A1=>nx2620, S0=>
      nx2482);
   ix1633 : nor02ii port map ( Y=>nx1632, A0=>nx2229, A1=>T01(7));
   ix1771 : nor02ii port map ( Y=>nx1770, A0=>nx2313, A1=>T21(7));
   ix2514 : mux21 port map ( Y=>nx2513, A0=>nx2804, A1=>nx2810, S0=>nx3060);
   ix2841 : mux21 port map ( Y=>nx2840, A0=>nx2535, A1=>nx2533, S0=>nx3060);
   ix2540 : mux21 port map ( Y=>nx2539, A0=>nx2856, A1=>nx2862, S0=>nx3060);
   ix2893 : mux21 port map ( Y=>nx2892, A0=>nx2551, A1=>nx2549, S0=>nx3060);
   ix2556 : mux21 port map ( Y=>nx2555, A0=>nx2908, A1=>nx2914, S0=>nx3062);
   ix2945 : mux21 port map ( Y=>nx2944, A0=>nx2567, A1=>nx2565, S0=>nx3062);
   ix2572 : mux21 port map ( Y=>nx2571, A0=>nx2960, A1=>nx2966, S0=>nx3062);
   ix2997 : mux21 port map ( Y=>nx2996, A0=>nx2583, A1=>nx2581, S0=>nx3062);
   ix2588 : mux21 port map ( Y=>nx2587, A0=>nx3012, A1=>nx3018, S0=>nx3062);
   ix3319 : mux21 port map ( Y=>nx3318, A0=>nx392, A1=>nx1002, S0=>nx3069);
   ix3293 : mux21 port map ( Y=>nx3292, A0=>nx1301, A1=>nx1281, S0=>nx3069);
   ix2710 : mux21 port map ( Y=>nx2709, A0=>nx1458, A1=>nx1446, S0=>nx3069);
   ix3257 : mux21 port map ( Y=>nx3256, A0=>nx1635, A1=>nx1265, S0=>nx3069);
   ix2718 : mux21 port map ( Y=>nx2717, A0=>nx1406, A1=>nx1394, S0=>nx3069);
   ix3221 : mux21 port map ( Y=>nx3220, A0=>nx1667, A1=>nx1249, S0=>nx3071);
   ix2726 : mux21 port map ( Y=>nx2725, A0=>nx1354, A1=>nx1342, S0=>nx3071);
   ix3185 : mux21 port map ( Y=>nx3184, A0=>nx1699, A1=>nx1233, S0=>nx3071);
   ix2734 : mux21 port map ( Y=>nx2733, A0=>nx1302, A1=>nx1290, S0=>nx3071);
   ix3149 : mux21 port map ( Y=>nx3148, A0=>nx1731, A1=>nx1217, S0=>nx3071);
   ix2758 : or02 port map ( Y=>nx2757, A0=>nx3071, A1=>nx3402);
   ix2782 : mux21 port map ( Y=>nx2781, A0=>nx3140, A1=>nx3148, S0=>nx3064);
   ix3427 : mux21 port map ( Y=>nx3426, A0=>nx2667, A1=>nx2733, S0=>nx3064);
   ix2792 : mux21 port map ( Y=>nx2791, A0=>nx3176, A1=>nx3184, S0=>nx3064);
   ix3451 : nor02ii port map ( Y=>nx3450, A0=>nx3049, A1=>nx3402);
   ix3475 : mux21 port map ( Y=>nx3474, A0=>nx2675, A1=>nx2725, S0=>nx3064);
   ix2834 : mux21 port map ( Y=>nx2833, A0=>nx3212, A1=>nx3220, S0=>nx3067);
   ix3523 : mux21 port map ( Y=>nx3522, A0=>nx2683, A1=>nx2717, S0=>nx3067);
   ix2864 : mux21 port map ( Y=>nx2863, A0=>nx3248, A1=>nx3256, S0=>nx3067);
   ix3571 : mux21 port map ( Y=>nx3570, A0=>nx2691, A1=>nx2709, S0=>nx3067);
   ix2892 : mux21 port map ( Y=>nx2891, A0=>nx3284, A1=>nx3292, S0=>nx3067);
   ix2900 : mux21 port map ( Y=>nx2899, A0=>nx3306, A1=>nx3318, S0=>nx3067);
   ix3865 : nor02ii port map ( Y=>DIRECTION(1), A0=>nx2747, A1=>EDGE_dup0);
   ix3020 : and02 port map ( Y=>nx3021, A0=>nx3027, A1=>nx2747);
   ix3055 : buf02 port map ( Y=>nx3056, A=>nx468);
   ix3057 : buf02 port map ( Y=>nx3058, A=>nx468);
   ix3059 : buf02 port map ( Y=>nx3060, A=>nx2628);
   ix3061 : buf02 port map ( Y=>nx3062, A=>nx2628);
   ix3063 : inv01 port map ( Y=>nx3064, A=>nx3402);
   ix3065 : inv01 port map ( Y=>nx3067, A=>nx3402);
   ix3068 : inv01 port map ( Y=>nx3069, A=>nx1135);
   ix3070 : inv01 port map ( Y=>nx3071, A=>nx1135);
end behavioral ;

