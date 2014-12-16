//
// Verilog description for cell filter, 
// Mon Dec 15 19:41:04 2014
//
// LeonardoSpectrum Level 3, 2008b.3 
//


module filter ( T00, T01, T02, T10, T11, T12, T20, T21, T22, CLOCK, I_VALID, 
                RESET, THRESHOLD, READY, O_VALID, EDGE, DIRECTION ) ;

    input [7:0]T00 ;
    input [7:0]T01 ;
    input [7:0]T02 ;
    input [7:0]T10 ;
    input [7:0]T11 ;
    input [7:0]T12 ;
    input [7:0]T20 ;
    input [7:0]T21 ;
    input [7:0]T22 ;
    input CLOCK ;
    input I_VALID ;
    input RESET ;
    input [12:0]THRESHOLD ;
    output READY ;
    output O_VALID ;
    output EDGE ;
    output [2:0]DIRECTION ;

    wire nx679, fsm_inst_state_3, fsm_inst_state_2, fsm_inst_state_0, nx8, nx12, 
         nx18, nx32, nx36, nx40, nx50, nx62, nx74, nx82, nx88, nx90, nx92, nx96, 
         nx98, nx100, nx104, nx106, nx108, nx112, nx118, nx120, nx134, nx146, 
         nx158, nx166, nx170, nx174, nx178, nx188, nx200, nx212, nx220, nx226, 
         nx228, nx230, nx234, nx236, nx238, nx242, nx244, nx246, nx250, nx256, 
         nx258, nx272, nx284, nx296, nx304, nx310, nx316, nx322, nx328, nx334, 
         nx336, nx338, nx340, nx342, nx344, nx346, nx348, nx350, nx352, nx354, 
         nx356, nx358, nx360, nx362, nx364, nx366, nx368, nx370, nx372, nx374, 
         nx376, nx378, nx392, nx396, nx412, nx428, nx444, nx460, nx468, nx492, 
         nx508, nx524, nx540, nx556, nx570, nx586, nx602, nx618, nx634, nx640, 
         nx642, nx646, nx650, nx660, nx672, nx684, nx692, nx698, nx700, nx702, 
         nx706, nx708, nx710, nx714, nx716, nx718, nx722, nx728, nx730, nx744, 
         nx756, nx768, nx776, nx780, nx784, nx788, nx798, nx810, nx822, nx830, 
         nx836, nx838, nx840, nx844, nx846, nx848, nx852, nx854, nx856, nx860, 
         nx866, nx868, nx882, nx894, nx906, nx914, nx920, nx926, nx932, nx938, 
         nx944, nx946, nx948, nx950, nx952, nx954, nx956, nx958, nx960, nx962, 
         nx964, nx966, nx968, nx970, nx972, nx974, nx976, nx978, nx980, nx982, 
         nx984, nx986, nx988, nx1002, nx1006, nx1022, nx1038, nx1054, nx1070, 
         nx1102, nx1118, nx1134, nx1150, nx1166, nx1180, nx1196, nx1212, nx1228, 
         nx1244, nx1250, nx1254, nx1260, nx1266, nx1272, nx1276, nx1290, nx1302, 
         nx1306, nx1312, nx1318, nx1324, nx1328, nx1342, nx1354, nx1358, nx1364, 
         nx1370, nx1376, nx1380, nx1394, nx1406, nx1410, nx1416, nx1422, nx1428, 
         nx1432, nx1446, nx1458, nx1462, nx1468, nx1474, nx1480, nx1500, nx1516, 
         nx1532, nx1548, nx1564, nx1582, nx1586, nx1590, nx1600, nx1612, nx1624, 
         nx1632, nx1638, nx1640, nx1642, nx1646, nx1648, nx1650, nx1654, nx1656, 
         nx1658, nx1662, nx1668, nx1670, nx1684, nx1696, nx1708, nx1716, nx1720, 
         nx1724, nx1728, nx1738, nx1750, nx1762, nx1770, nx1776, nx1778, nx1780, 
         nx1784, nx1786, nx1788, nx1792, nx1794, nx1796, nx1800, nx1806, nx1808, 
         nx1822, nx1834, nx1846, nx1854, nx1860, nx1866, nx1872, nx1878, nx1884, 
         nx1886, nx1888, nx1890, nx1892, nx1894, nx1896, nx1898, nx1900, nx1902, 
         nx1904, nx1906, nx1908, nx1910, nx1912, nx1914, nx1916, nx1918, nx1920, 
         nx1922, nx1924, nx1926, nx1928, nx1942, nx1946, nx1962, nx1978, nx1994, 
         nx2010, nx2042, nx2058, nx2074, nx2090, nx2106, nx2120, nx2136, nx2152, 
         nx2168, nx2184, nx2190, nx2192, nx2196, nx2200, nx2210, nx2222, nx2234, 
         nx2242, nx2248, nx2250, nx2252, nx2256, nx2258, nx2260, nx2264, nx2266, 
         nx2268, nx2272, nx2278, nx2280, nx2294, nx2306, nx2318, nx2326, nx2330, 
         nx2334, nx2338, nx2348, nx2360, nx2372, nx2380, nx2386, nx2388, nx2390, 
         nx2394, nx2396, nx2398, nx2402, nx2404, nx2406, nx2410, nx2416, nx2418, 
         nx2432, nx2444, nx2456, nx2464, nx2470, nx2476, nx2482, nx2488, nx2494, 
         nx2496, nx2498, nx2500, nx2502, nx2504, nx2506, nx2508, nx2510, nx2512, 
         nx2514, nx2516, nx2518, nx2520, nx2522, nx2524, nx2526, nx2528, nx2530, 
         nx2532, nx2534, nx2536, nx2538, nx2552, nx2556, nx2572, nx2588, nx2604, 
         nx2620, nx2628, nx2652, nx2668, nx2684, nx2700, nx2716, nx2730, nx2746, 
         nx2762, nx2778, nx2794, nx2800, nx2804, nx2810, nx2814, nx2816, nx2822, 
         nx2840, nx2852, nx2856, nx2862, nx2866, nx2868, nx2874, nx2892, nx2904, 
         nx2908, nx2914, nx2918, nx2920, nx2926, nx2944, nx2956, nx2960, nx2966, 
         nx2970, nx2972, nx2978, nx2996, nx3008, nx3012, nx3018, nx3024, nx3030, 
         nx3050, nx3066, nx3082, nx3098, nx3114, nx3140, nx3148, nx3176, nx3184, 
         nx3212, nx3220, nx3248, nx3256, nx3284, nx3292, nx3306, nx3318, nx3322, 
         nx3338, nx3354, nx3370, nx3386, nx3402, nx3410, nx3426, nx3438, nx3444, 
         nx3450, nx3458, nx3462, nx3474, nx3486, nx3488, nx3490, nx3510, nx3522, 
         nx3534, nx3536, nx3538, nx3558, nx3570, nx3582, nx3584, nx3586, nx3606, 
         nx3630, nx3634, nx3640, nx3652, nx3664, nx3676, nx3680, nx3682, nx3684, 
         nx3692, nx3698, nx3700, nx3708, nx3710, nx3712, nx3716, nx3718, nx3720, 
         nx3724, nx3726, nx3728, nx3732, nx3734, nx3746, nx3762, nx3778, nx3794, 
         nx3810, nx3826, nx3858, nx773, nx775, nx785, nx789, nx793, nx795, nx799, 
         nx803, nx805, nx809, nx813, nx815, nx817, nx819, nx821, nx823, nx825, 
         nx827, nx835, nx837, nx839, nx841, nx845, nx849, nx853, nx855, nx857, 
         nx859, nx863, nx867, nx871, nx873, nx875, nx877, nx881, nx885, nx889, 
         nx893, nx901, nx903, nx907, nx911, nx915, nx919, nx923, nx927, nx931, 
         nx935, nx939, nx943, nx947, nx951, nx953, nx961, nx963, nx973, nx975, 
         nx977, nx987, nx991, nx995, nx997, nx1001, nx1003, nx1013, nx1015, 
         nx1017, nx1021, nx1023, nx1027, nx1033, nx1037, nx1041, nx1043, nx1047, 
         nx1049, nx1059, nx1061, nx1063, nx1067, nx1069, nx1073, nx1079, nx1083, 
         nx1087, nx1089, nx1093, nx1095, nx1105, nx1109, nx1111, nx1119, nx1123, 
         nx1135, nx1141, nx1145, nx1147, nx1151, nx1153, nx1155, nx1159, nx1161, 
         nx1163, nx1167, nx1169, nx1171, nx1175, nx1177, nx1179, nx1181, nx1183, 
         nx1185, nx1189, nx1193, nx1197, nx1201, nx1205, nx1207, nx1209, nx1211, 
         nx1213, nx1217, nx1223, nx1227, nx1229, nx1233, nx1239, nx1243, nx1245, 
         nx1249, nx1255, nx1259, nx1261, nx1265, nx1271, nx1275, nx1277, nx1281, 
         nx1285, nx1287, nx1291, nx1293, nx1295, nx1297, nx1299, nx1301, nx1311, 
         nx1313, nx1319, nx1321, nx1323, nx1327, nx1337, nx1341, nx1345, nx1347, 
         nx1353, nx1355, nx1361, nx1363, nx1365, nx1367, nx1375, nx1377, nx1379, 
         nx1381, nx1385, nx1389, nx1393, nx1395, nx1397, nx1399, nx1403, nx1407, 
         nx1411, nx1413, nx1415, nx1417, nx1423, nx1431, nx1433, nx1437, nx1441, 
         nx1445, nx1449, nx1453, nx1457, nx1461, nx1465, nx1469, nx1479, nx1481, 
         nx1483, nx1487, nx1493, nx1497, nx1501, nx1503, nx1507, nx1517, nx1519, 
         nx1521, nx1525, nx1533, nx1537, nx1541, nx1545, nx1555, nx1557, nx1559, 
         nx1563, nx1571, nx1575, nx1579, nx1583, nx1593, nx1597, nx1603, nx1607, 
         nx1615, nx1619, nx1623, nx1625, nx1627, nx1631, nx1633, nx1635, nx1639, 
         nx1641, nx1645, nx1647, nx1651, nx1655, nx1657, nx1659, nx1663, nx1665, 
         nx1667, nx1671, nx1673, nx1677, nx1679, nx1683, nx1687, nx1689, nx1691, 
         nx1695, nx1697, nx1699, nx1703, nx1705, nx1709, nx1711, nx1715, nx1719, 
         nx1721, nx1723, nx1727, nx1729, nx1731, nx1735, nx1737, nx1741, nx1743, 
         nx1749, nx1757, nx1763, nx1765, nx1771, nx1775, nx1779, nx1781, nx1787, 
         nx1789, nx1795, nx1797, nx1799, nx1801, nx1807, nx1809, nx1811, nx1815, 
         nx1821, nx1823, nx1825, nx1829, nx1835, nx1837, nx1839, nx1843, nx1847, 
         nx1851, nx1863, nx1867, nx1871, nx1873, nx1879, nx1881, nx1887, nx1889, 
         nx1891, nx1899, nx1901, nx1903, nx1907, nx1911, nx1915, nx1917, nx1919, 
         nx1923, nx1927, nx1931, nx1933, nx1935, nx1939, nx1945, nx1951, nx1955, 
         nx1963, nx1967, nx1971, nx1973, nx1979, nx1989, nx1993, nx1997, nx1999, 
         nx2005, nx2015, nx2019, nx2023, nx2025, nx2031, nx2041, nx2045, nx2049, 
         nx2051, nx2055, nx2057, nx2059, nx2061, nx2063, nx2065, nx2069, nx2071, 
         nx2075, nx2077, nx2081, nx2083, nx2087, nx2089, nx2093, nx2095, nx2097, 
         nx2099, nx2101, nx2105, nx2115, nx2119, nx2123, nx2127, nx2145, nx2147, 
         nx2153, nx2157, nx2161, nx2163, nx2169, nx2171, nx2177, nx2179, nx2185, 
         nx2187, nx2189, nx2193, nx2199, nx2201, nx2203, nx2207, nx2213, nx2215, 
         nx2217, nx2221, nx2229, nx2239, nx2243, nx2247, nx2249, nx2255, nx2257, 
         nx2263, nx2265, nx2271, nx2273, nx2275, nx2279, nx2285, nx2287, nx2289, 
         nx2293, nx2299, nx2301, nx2303, nx2307, nx2313, nx2319, nx2323, nx2331, 
         nx2335, nx2339, nx2341, nx2347, nx2357, nx2361, nx2365, nx2367, nx2373, 
         nx2383, nx2387, nx2391, nx2393, nx2399, nx2409, nx2413, nx2417, nx2419, 
         nx2423, nx2425, nx2427, nx2429, nx2431, nx2433, nx2437, nx2439, nx2443, 
         nx2445, nx2449, nx2451, nx2455, nx2457, nx2461, nx2463, nx2465, nx2467, 
         nx2469, nx2473, nx2477, nx2483, nx2487, nx2491, nx2495, nx2509, nx2513, 
         nx2519, nx2525, nx2529, nx2533, nx2535, nx2539, nx2545, nx2549, nx2551, 
         nx2555, nx2561, nx2565, nx2567, nx2571, nx2577, nx2581, nx2583, nx2587, 
         nx2593, nx2595, nx2597, nx2599, nx2605, nx2609, nx2611, nx2613, nx2615, 
         nx2621, nx2625, nx2627, nx2629, nx2631, nx2637, nx2641, nx2643, nx2645, 
         nx2647, nx2653, nx2657, nx2659, nx2661, nx2663, nx2667, nx2669, nx2675, 
         nx2677, nx2683, nx2685, nx2691, nx2693, nx2703, nx2707, nx2709, nx2711, 
         nx2715, nx2717, nx2719, nx2723, nx2725, nx2727, nx2731, nx2733, nx2735, 
         nx2739, nx2741, nx2747, nx2757, nx2765, nx2769, nx2775, nx2781, nx2783, 
         nx2789, nx2791, nx2793, nx2803, nx2811, nx2821, nx2831, nx2833, nx2835, 
         nx2839, nx2853, nx2861, nx2863, nx2865, nx2869, nx2881, nx2889, nx2891, 
         nx2893, nx2897, nx2899, nx2901, nx2909, nx2913, nx2915, nx2921, nx2923, 
         nx2929, nx2931, nx2937, nx2939, nx2947, nx2949, nx2955, nx2961, nx2965, 
         nx2971, nx2977, nx2983, nx3013, nx3019, nx3021, nx3023, nx3025, nx3027, 
         nx3043, nx3045, nx3047, nx3049, nx3056, nx3058, nx3060, nx3062, nx3064, 
         nx3067, nx3069, nx3071;
    wire [4:0] \$dummy ;




    fake_gnd ix680 (.Y (nx679)) ;
    nor02ii ix3863 (.Y (DIRECTION[0]), .A0 (nx773), .A1 (EDGE)) ;
    aoi221 ix774 (.Y (nx773), .A0 (nx3023), .A1 (nx3021), .B0 (nx3045), .B1 (
           nx3019), .C0 (nx3858)) ;
    mux21 ix780 (.Y (nx775), .A0 (nx920), .A1 (nx1070), .S0 (nx932)) ;
    nor02ii ix777 (.Y (nx776), .A0 (nx785), .A1 (nx698)) ;
    aoi22 ix786 (.Y (nx785), .A0 (T22[7]), .A1 (nx700), .B0 (nx702), .B1 (nx768)
          ) ;
    xnor2 ix701 (.Y (nx700), .A0 (nx789), .A1 (nx684)) ;
    xnor2 ix790 (.Y (nx789), .A0 (T02[7]), .A1 (T12[6])) ;
    oai22 ix685 (.Y (nx684), .A0 (nx793), .A1 (nx795), .B0 (nx825), .B1 (nx827)
          ) ;
    xnor2 ix794 (.Y (nx793), .A0 (T02[6]), .A1 (T12[5])) ;
    aoi22 ix796 (.Y (nx795), .A0 (T12[4]), .A1 (T02[5]), .B0 (nx646), .B1 (nx672
          )) ;
    inv01 ix800 (.Y (nx799), .A (T12[4])) ;
    oai22 ix673 (.Y (nx672), .A0 (nx803), .A1 (nx805), .B0 (nx821), .B1 (nx823)
          ) ;
    xnor2 ix804 (.Y (nx803), .A0 (T02[4]), .A1 (T12[3])) ;
    aoi22 ix806 (.Y (nx805), .A0 (T12[2]), .A1 (T02[3]), .B0 (nx650), .B1 (nx660
          )) ;
    inv01 ix810 (.Y (nx809), .A (T12[2])) ;
    oai22 ix661 (.Y (nx660), .A0 (nx813), .A1 (nx815), .B0 (nx817), .B1 (nx819)
          ) ;
    xnor2 ix814 (.Y (nx813), .A0 (T02[2]), .A1 (T12[1])) ;
    nand02 ix816 (.Y (nx815), .A0 (T12[0]), .A1 (T02[1])) ;
    inv01 ix818 (.Y (nx817), .A (T12[1])) ;
    inv01 ix820 (.Y (nx819), .A (T02[2])) ;
    inv01 ix822 (.Y (nx821), .A (T12[3])) ;
    inv01 ix824 (.Y (nx823), .A (T02[4])) ;
    inv01 ix826 (.Y (nx825), .A (T12[5])) ;
    inv01 ix828 (.Y (nx827), .A (T02[6])) ;
    oai22 ix769 (.Y (nx768), .A0 (nx835), .A1 (nx841), .B0 (nx839), .B1 (nx837)
          ) ;
    xnor2 ix838 (.Y (nx837), .A0 (nx793), .A1 (nx795)) ;
    inv01 ix840 (.Y (nx839), .A (T22[6])) ;
    aoi22 ix842 (.Y (nx841), .A0 (T22[5]), .A1 (nx708), .B0 (nx710), .B1 (nx756)
          ) ;
    xnor2 ix709 (.Y (nx708), .A0 (nx845), .A1 (nx672)) ;
    xnor2 ix846 (.Y (nx845), .A0 (T02[5]), .A1 (T12[4])) ;
    inv01 ix850 (.Y (nx849), .A (T22[5])) ;
    oai22 ix757 (.Y (nx756), .A0 (nx853), .A1 (nx859), .B0 (nx857), .B1 (nx855)
          ) ;
    xnor2 ix856 (.Y (nx855), .A0 (nx803), .A1 (nx805)) ;
    inv01 ix858 (.Y (nx857), .A (T22[4])) ;
    aoi22 ix860 (.Y (nx859), .A0 (T22[3]), .A1 (nx716), .B0 (nx718), .B1 (nx744)
          ) ;
    xnor2 ix717 (.Y (nx716), .A0 (nx863), .A1 (nx660)) ;
    xnor2 ix864 (.Y (nx863), .A0 (T02[3]), .A1 (T12[2])) ;
    inv01 ix868 (.Y (nx867), .A (T22[3])) ;
    oai22 ix745 (.Y (nx744), .A0 (nx871), .A1 (nx877), .B0 (nx875), .B1 (nx873)
          ) ;
    xnor2 ix874 (.Y (nx873), .A0 (nx813), .A1 (nx815)) ;
    inv01 ix876 (.Y (nx875), .A (T22[2])) ;
    aoi32 ix878 (.Y (nx877), .A0 (nx730), .A1 (T22[0]), .A2 (T02[0]), .B0 (
          T22[1]), .B1 (nx728)) ;
    xnor2 ix731 (.Y (nx730), .A0 (nx881), .A1 (T22[1])) ;
    oai21 ix882 (.Y (nx881), .A0 (T02[1]), .A1 (T12[0]), .B0 (nx815)) ;
    inv01 ix886 (.Y (nx885), .A (T02[1])) ;
    xnor2 ix699 (.Y (nx698), .A0 (T12[7]), .A1 (nx889)) ;
    aoi22 ix890 (.Y (nx889), .A0 (T12[6]), .A1 (T02[7]), .B0 (nx642), .B1 (nx684
          )) ;
    inv01 ix894 (.Y (nx893), .A (T12[6])) ;
    mux21 ix1071 (.Y (nx1070), .A0 (nx901), .A1 (nx903), .S0 (nx946)) ;
    mux21 ix904 (.Y (nx903), .A0 (nx948), .A1 (nx1054), .S0 (nx952)) ;
    xnor2 ix949 (.Y (nx948), .A0 (nx907), .A1 (nx768)) ;
    xnor2 ix908 (.Y (nx907), .A0 (nx700), .A1 (T22[7])) ;
    mux21 ix1055 (.Y (nx1054), .A0 (nx911), .A1 (nx915), .S0 (nx958)) ;
    xnor2 ix707 (.Y (nx706), .A0 (nx837), .A1 (T22[6])) ;
    mux21 ix916 (.Y (nx915), .A0 (nx960), .A1 (nx1038), .S0 (nx964)) ;
    xnor2 ix961 (.Y (nx960), .A0 (nx919), .A1 (nx756)) ;
    xnor2 ix920 (.Y (nx919), .A0 (nx708), .A1 (T22[5])) ;
    mux21 ix1039 (.Y (nx1038), .A0 (nx923), .A1 (nx927), .S0 (nx970)) ;
    xnor2 ix715 (.Y (nx714), .A0 (nx855), .A1 (T22[4])) ;
    mux21 ix928 (.Y (nx927), .A0 (nx972), .A1 (nx1022), .S0 (nx976)) ;
    xnor2 ix973 (.Y (nx972), .A0 (nx931), .A1 (nx744)) ;
    xnor2 ix932 (.Y (nx931), .A0 (nx716), .A1 (T22[3])) ;
    mux21 ix1023 (.Y (nx1022), .A0 (nx935), .A1 (nx939), .S0 (nx982)) ;
    xnor2 ix723 (.Y (nx722), .A0 (nx873), .A1 (T22[2])) ;
    mux21 ix940 (.Y (nx939), .A0 (nx984), .A1 (nx1006), .S0 (nx988)) ;
    xnor2 ix985 (.Y (nx984), .A0 (nx730), .A1 (nx943)) ;
    nand02 ix944 (.Y (nx943), .A0 (T22[0]), .A1 (T02[0])) ;
    nor02 ix1007 (.Y (nx1006), .A0 (nx947), .A1 (nx1002)) ;
    oai21 ix948 (.Y (nx947), .A0 (T02[0]), .A1 (T22[0]), .B0 (nx943)) ;
    xnor2 ix1003 (.Y (nx1002), .A0 (nx947), .A1 (nx951)) ;
    oai21 ix952 (.Y (nx951), .A0 (T20[0]), .A1 (T00[0]), .B0 (nx953)) ;
    nand02 ix954 (.Y (nx953), .A0 (T00[0]), .A1 (T20[0])) ;
    xnor2 ix989 (.Y (nx988), .A0 (nx984), .A1 (nx986)) ;
    xnor2 ix987 (.Y (nx986), .A0 (nx868), .A1 (nx953)) ;
    xnor2 ix869 (.Y (nx868), .A0 (nx961), .A1 (T20[1])) ;
    oai21 ix962 (.Y (nx961), .A0 (T10[0]), .A1 (T00[1]), .B0 (nx963)) ;
    nand02 ix964 (.Y (nx963), .A0 (T00[1]), .A1 (T10[0])) ;
    xnor2 ix983 (.Y (nx982), .A0 (nx978), .A1 (nx980)) ;
    xnor2 ix979 (.Y (nx978), .A0 (nx722), .A1 (nx877)) ;
    xnor2 ix981 (.Y (nx980), .A0 (nx860), .A1 (nx977)) ;
    xnor2 ix861 (.Y (nx860), .A0 (nx973), .A1 (T20[2])) ;
    xnor2 ix974 (.Y (nx973), .A0 (nx975), .A1 (nx963)) ;
    xnor2 ix976 (.Y (nx975), .A0 (T00[2]), .A1 (T10[1])) ;
    aoi32 ix978 (.Y (nx977), .A0 (nx868), .A1 (T00[0]), .A2 (T20[0]), .B0 (
          T20[1]), .B1 (nx866)) ;
    xnor2 ix977 (.Y (nx976), .A0 (nx972), .A1 (nx974)) ;
    xnor2 ix975 (.Y (nx974), .A0 (nx987), .A1 (nx882)) ;
    xnor2 ix988 (.Y (nx987), .A0 (nx854), .A1 (T20[3])) ;
    xnor2 ix855 (.Y (nx854), .A0 (nx991), .A1 (nx798)) ;
    xnor2 ix992 (.Y (nx991), .A0 (T00[3]), .A1 (T10[2])) ;
    oai22 ix799 (.Y (nx798), .A0 (nx975), .A1 (nx963), .B0 (nx995), .B1 (nx997)
          ) ;
    inv01 ix996 (.Y (nx995), .A (T00[2])) ;
    inv01 ix998 (.Y (nx997), .A (T10[1])) ;
    oai22 ix883 (.Y (nx882), .A0 (nx1001), .A1 (nx977), .B0 (nx1003), .B1 (nx973
          )) ;
    inv01 ix1004 (.Y (nx1003), .A (T20[2])) ;
    xnor2 ix971 (.Y (nx970), .A0 (nx966), .A1 (nx968)) ;
    xnor2 ix967 (.Y (nx966), .A0 (nx714), .A1 (nx859)) ;
    xnor2 ix969 (.Y (nx968), .A0 (nx852), .A1 (nx1023)) ;
    xnor2 ix853 (.Y (nx852), .A0 (nx1013), .A1 (T20[4])) ;
    xnor2 ix1014 (.Y (nx1013), .A0 (nx1015), .A1 (nx1017)) ;
    xnor2 ix1016 (.Y (nx1015), .A0 (T00[4]), .A1 (T10[3])) ;
    aoi22 ix1018 (.Y (nx1017), .A0 (T00[3]), .A1 (T10[2]), .B0 (nx788), .B1 (
          nx798)) ;
    inv01 ix1022 (.Y (nx1021), .A (T10[2])) ;
    aoi22 ix1024 (.Y (nx1023), .A0 (T20[3]), .A1 (nx854), .B0 (nx856), .B1 (
          nx882)) ;
    inv01 ix1028 (.Y (nx1027), .A (T20[3])) ;
    xnor2 ix965 (.Y (nx964), .A0 (nx960), .A1 (nx962)) ;
    xnor2 ix963 (.Y (nx962), .A0 (nx1033), .A1 (nx894)) ;
    xnor2 ix1034 (.Y (nx1033), .A0 (nx846), .A1 (T20[5])) ;
    xnor2 ix847 (.Y (nx846), .A0 (nx1037), .A1 (nx810)) ;
    xnor2 ix1038 (.Y (nx1037), .A0 (T00[5]), .A1 (T10[4])) ;
    oai22 ix811 (.Y (nx810), .A0 (nx1015), .A1 (nx1017), .B0 (nx1041), .B1 (
          nx1043)) ;
    inv01 ix1042 (.Y (nx1041), .A (T00[4])) ;
    inv01 ix1044 (.Y (nx1043), .A (T10[3])) ;
    oai22 ix895 (.Y (nx894), .A0 (nx1047), .A1 (nx1023), .B0 (nx1049), .B1 (
          nx1013)) ;
    inv01 ix1050 (.Y (nx1049), .A (T20[4])) ;
    xnor2 ix959 (.Y (nx958), .A0 (nx954), .A1 (nx956)) ;
    xnor2 ix955 (.Y (nx954), .A0 (nx706), .A1 (nx841)) ;
    xnor2 ix957 (.Y (nx956), .A0 (nx844), .A1 (nx1069)) ;
    xnor2 ix845 (.Y (nx844), .A0 (nx1059), .A1 (T20[6])) ;
    xnor2 ix1060 (.Y (nx1059), .A0 (nx1061), .A1 (nx1063)) ;
    xnor2 ix1062 (.Y (nx1061), .A0 (T00[6]), .A1 (T10[5])) ;
    aoi22 ix1064 (.Y (nx1063), .A0 (T00[5]), .A1 (T10[4]), .B0 (nx784), .B1 (
          nx810)) ;
    inv01 ix1068 (.Y (nx1067), .A (T10[4])) ;
    aoi22 ix1070 (.Y (nx1069), .A0 (T20[5]), .A1 (nx846), .B0 (nx848), .B1 (
          nx894)) ;
    inv01 ix1074 (.Y (nx1073), .A (T20[5])) ;
    xnor2 ix953 (.Y (nx952), .A0 (nx948), .A1 (nx950)) ;
    xnor2 ix951 (.Y (nx950), .A0 (nx1079), .A1 (nx906)) ;
    xnor2 ix1080 (.Y (nx1079), .A0 (nx838), .A1 (T20[7])) ;
    xnor2 ix839 (.Y (nx838), .A0 (nx1083), .A1 (nx822)) ;
    xnor2 ix1084 (.Y (nx1083), .A0 (T00[7]), .A1 (T10[6])) ;
    oai22 ix823 (.Y (nx822), .A0 (nx1061), .A1 (nx1063), .B0 (nx1087), .B1 (
          nx1089)) ;
    inv01 ix1088 (.Y (nx1087), .A (T00[6])) ;
    inv01 ix1090 (.Y (nx1089), .A (T10[5])) ;
    oai22 ix907 (.Y (nx906), .A0 (nx1093), .A1 (nx1069), .B0 (nx1095), .B1 (
          nx1059)) ;
    inv01 ix1096 (.Y (nx1095), .A (T20[6])) ;
    xnor2 ix947 (.Y (nx946), .A0 (nx938), .A1 (nx944)) ;
    xnor2 ix939 (.Y (nx938), .A0 (nx698), .A1 (nx785)) ;
    xnor2 ix945 (.Y (nx944), .A0 (nx836), .A1 (nx1111)) ;
    xnor2 ix837 (.Y (nx836), .A0 (T10[7]), .A1 (nx1105)) ;
    aoi22 ix1106 (.Y (nx1105), .A0 (T00[7]), .A1 (T10[6]), .B0 (nx780), .B1 (
          nx822)) ;
    inv01 ix1110 (.Y (nx1109), .A (T10[6])) ;
    aoi22 ix1112 (.Y (nx1111), .A0 (T20[7]), .A1 (nx838), .B0 (nx840), .B1 (
          nx906)) ;
    xnor2 ix933 (.Y (nx932), .A0 (nx1119), .A1 (nx1123)) ;
    nor02 ix1122 (.Y (nx1119), .A0 (nx776), .A1 (nx692)) ;
    nor02 ix1126 (.Y (nx1123), .A0 (nx914), .A1 (nx830)) ;
    nor02ii ix915 (.Y (nx914), .A0 (nx1111), .A1 (nx836)) ;
    mux21 ix1136 (.Y (nx1135), .A0 (nx1250), .A1 (nx1564), .S0 (nx1743)) ;
    mux21 ix1251 (.Y (nx1250), .A0 (nx1244), .A1 (nx1166), .S0 (nx3023)) ;
    oai22 ix1245 (.Y (nx1244), .A0 (nx1141), .A1 (nx1145), .B0 (nx1119), .B1 (
          nx926)) ;
    aoi22 ix1146 (.Y (nx1145), .A0 (nx938), .A1 (nx1147), .B0 (nx946), .B1 (
          nx1228)) ;
    oai22 ix1229 (.Y (nx1228), .A0 (nx1151), .A1 (nx1153), .B0 (nx1185), .B1 (
          nx950)) ;
    aoi22 ix1154 (.Y (nx1153), .A0 (nx954), .A1 (nx1155), .B0 (nx958), .B1 (
          nx1212)) ;
    oai22 ix1213 (.Y (nx1212), .A0 (nx1159), .A1 (nx1161), .B0 (nx1183), .B1 (
          nx962)) ;
    aoi22 ix1162 (.Y (nx1161), .A0 (nx966), .A1 (nx1163), .B0 (nx970), .B1 (
          nx1196)) ;
    oai22 ix1197 (.Y (nx1196), .A0 (nx1167), .A1 (nx1169), .B0 (nx1181), .B1 (
          nx974)) ;
    aoi22 ix1170 (.Y (nx1169), .A0 (nx978), .A1 (nx1171), .B0 (nx982), .B1 (
          nx1180)) ;
    oai22 ix1181 (.Y (nx1180), .A0 (nx1175), .A1 (nx1177), .B0 (nx1179), .B1 (
          nx986)) ;
    nor02 ix1178 (.Y (nx1177), .A0 (nx1002), .A1 (nx951)) ;
    oai22 ix1167 (.Y (nx1166), .A0 (nx1189), .A1 (nx1141), .B0 (nx920), .B1 (
          nx1123)) ;
    aoi22 ix1190 (.Y (nx1189), .A0 (nx901), .A1 (nx944), .B0 (nx1150), .B1 (
          nx946)) ;
    oai22 ix1151 (.Y (nx1150), .A0 (nx1193), .A1 (nx1151), .B0 (nx948), .B1 (
          nx1213)) ;
    aoi22 ix1194 (.Y (nx1193), .A0 (nx911), .A1 (nx956), .B0 (nx1134), .B1 (
          nx958)) ;
    oai22 ix1135 (.Y (nx1134), .A0 (nx1197), .A1 (nx1159), .B0 (nx960), .B1 (
          nx1211)) ;
    aoi22 ix1198 (.Y (nx1197), .A0 (nx923), .A1 (nx968), .B0 (nx1118), .B1 (
          nx970)) ;
    oai22 ix1119 (.Y (nx1118), .A0 (nx1201), .A1 (nx1167), .B0 (nx972), .B1 (
          nx1209)) ;
    aoi22 ix1202 (.Y (nx1201), .A0 (nx935), .A1 (nx980), .B0 (nx1102), .B1 (
          nx982)) ;
    oai22 ix1103 (.Y (nx1102), .A0 (nx1205), .A1 (nx1175), .B0 (nx984), .B1 (
          nx1207)) ;
    nor02 ix1206 (.Y (nx1205), .A0 (nx1177), .A1 (nx1002)) ;
    mux21 ix1565 (.Y (nx1564), .A0 (nx1217), .A1 (nx1223), .S0 (nx1729)) ;
    mux21 ix1218 (.Y (nx1217), .A0 (nx1260), .A1 (nx1254), .S0 (nx3023)) ;
    xnor2 ix1261 (.Y (nx1260), .A0 (nx932), .A1 (nx1145)) ;
    xnor2 ix1255 (.Y (nx1254), .A0 (nx1189), .A1 (nx932)) ;
    mux21 ix1224 (.Y (nx1223), .A0 (nx1290), .A1 (nx1548), .S0 (nx1711)) ;
    mux21 ix1291 (.Y (nx1290), .A0 (nx1227), .A1 (nx1229), .S0 (nx3023)) ;
    xnor2 ix1228 (.Y (nx1227), .A0 (nx946), .A1 (nx1228)) ;
    xnor2 ix1230 (.Y (nx1229), .A0 (nx1150), .A1 (nx946)) ;
    mux21 ix1549 (.Y (nx1548), .A0 (nx1233), .A1 (nx1239), .S0 (nx1697)) ;
    mux21 ix1234 (.Y (nx1233), .A0 (nx1312), .A1 (nx1306), .S0 (nx3023)) ;
    xnor2 ix1313 (.Y (nx1312), .A0 (nx952), .A1 (nx1153)) ;
    xnor2 ix1307 (.Y (nx1306), .A0 (nx1193), .A1 (nx952)) ;
    mux21 ix1240 (.Y (nx1239), .A0 (nx1342), .A1 (nx1532), .S0 (nx1679)) ;
    mux21 ix1343 (.Y (nx1342), .A0 (nx1243), .A1 (nx1245), .S0 (nx3023)) ;
    xnor2 ix1244 (.Y (nx1243), .A0 (nx958), .A1 (nx1212)) ;
    xnor2 ix1246 (.Y (nx1245), .A0 (nx1134), .A1 (nx958)) ;
    mux21 ix1533 (.Y (nx1532), .A0 (nx1249), .A1 (nx1255), .S0 (nx1665)) ;
    mux21 ix1250 (.Y (nx1249), .A0 (nx1364), .A1 (nx1358), .S0 (nx3025)) ;
    xnor2 ix1365 (.Y (nx1364), .A0 (nx964), .A1 (nx1161)) ;
    xnor2 ix1359 (.Y (nx1358), .A0 (nx1197), .A1 (nx964)) ;
    mux21 ix1256 (.Y (nx1255), .A0 (nx1394), .A1 (nx1516), .S0 (nx1647)) ;
    mux21 ix1395 (.Y (nx1394), .A0 (nx1259), .A1 (nx1261), .S0 (nx3025)) ;
    xnor2 ix1260 (.Y (nx1259), .A0 (nx970), .A1 (nx1196)) ;
    xnor2 ix1262 (.Y (nx1261), .A0 (nx1118), .A1 (nx970)) ;
    mux21 ix1517 (.Y (nx1516), .A0 (nx1265), .A1 (nx1271), .S0 (nx1633)) ;
    mux21 ix1266 (.Y (nx1265), .A0 (nx1416), .A1 (nx1410), .S0 (nx3025)) ;
    xnor2 ix1417 (.Y (nx1416), .A0 (nx976), .A1 (nx1169)) ;
    xnor2 ix1411 (.Y (nx1410), .A0 (nx1201), .A1 (nx976)) ;
    mux21 ix1272 (.Y (nx1271), .A0 (nx1446), .A1 (nx1500), .S0 (nx1615)) ;
    mux21 ix1447 (.Y (nx1446), .A0 (nx1275), .A1 (nx1277), .S0 (nx3025)) ;
    xnor2 ix1276 (.Y (nx1275), .A0 (nx982), .A1 (nx1180)) ;
    xnor2 ix1278 (.Y (nx1277), .A0 (nx1102), .A1 (nx982)) ;
    mux21 ix1501 (.Y (nx1500), .A0 (nx1281), .A1 (nx1285), .S0 (nx1299)) ;
    mux21 ix1282 (.Y (nx1281), .A0 (nx1468), .A1 (nx1462), .S0 (nx3025)) ;
    xnor2 ix1469 (.Y (nx1468), .A0 (nx988), .A1 (nx1177)) ;
    xnor2 ix1463 (.Y (nx1462), .A0 (nx1205), .A1 (nx988)) ;
    nand02 ix1286 (.Y (nx1285), .A0 (nx1287), .A1 (nx392)) ;
    xnor2 ix393 (.Y (nx392), .A0 (nx1291), .A1 (nx1295)) ;
    oai21 ix1292 (.Y (nx1291), .A0 (T01[0]), .A1 (T10[0]), .B0 (nx1293)) ;
    nand02 ix1294 (.Y (nx1293), .A0 (T10[0]), .A1 (T01[0])) ;
    oai21 ix1296 (.Y (nx1295), .A0 (T12[0]), .A1 (T21[0]), .B0 (nx1297)) ;
    nand02 ix1298 (.Y (nx1297), .A0 (T21[0]), .A1 (T12[0])) ;
    xnor2 ix1300 (.Y (nx1299), .A0 (nx1281), .A1 (nx1301)) ;
    xnor2 ix1481 (.Y (nx1480), .A0 (nx378), .A1 (nx1323)) ;
    xnor2 ix379 (.Y (nx378), .A0 (nx374), .A1 (nx376)) ;
    xnor2 ix375 (.Y (nx374), .A0 (nx120), .A1 (nx1293)) ;
    xnor2 ix121 (.Y (nx120), .A0 (nx1311), .A1 (T01[1])) ;
    oai21 ix1312 (.Y (nx1311), .A0 (T10[1]), .A1 (T00[0]), .B0 (nx1313)) ;
    nand02 ix1314 (.Y (nx1313), .A0 (T00[0]), .A1 (T10[1])) ;
    xnor2 ix377 (.Y (nx376), .A0 (nx258), .A1 (nx1297)) ;
    xnor2 ix259 (.Y (nx258), .A0 (nx1319), .A1 (T12[1])) ;
    oai21 ix1320 (.Y (nx1319), .A0 (T21[1]), .A1 (T22[0]), .B0 (nx1321)) ;
    nand02 ix1322 (.Y (nx1321), .A0 (T22[0]), .A1 (T21[1])) ;
    nor02 ix1324 (.Y (nx1323), .A0 (nx392), .A1 (nx1295)) ;
    xnor2 ix1475 (.Y (nx1474), .A0 (nx1327), .A1 (nx378)) ;
    nor02 ix1328 (.Y (nx1327), .A0 (nx1323), .A1 (nx392)) ;
    nor02ii ix167 (.Y (nx166), .A0 (nx1337), .A1 (nx88)) ;
    aoi22 ix1338 (.Y (nx1337), .A0 (T01[7]), .A1 (nx90), .B0 (nx92), .B1 (nx158)
          ) ;
    xnor2 ix91 (.Y (nx90), .A0 (nx1341), .A1 (nx74)) ;
    xnor2 ix1342 (.Y (nx1341), .A0 (T10[7]), .A1 (T00[6])) ;
    oai22 ix75 (.Y (nx74), .A0 (nx1345), .A1 (nx1347), .B0 (nx1367), .B1 (nx1109
          )) ;
    xnor2 ix1346 (.Y (nx1345), .A0 (T10[6]), .A1 (T00[5])) ;
    aoi22 ix1348 (.Y (nx1347), .A0 (T00[4]), .A1 (T10[5]), .B0 (nx36), .B1 (nx62
          )) ;
    oai22 ix63 (.Y (nx62), .A0 (nx1353), .A1 (nx1355), .B0 (nx1365), .B1 (nx1067
          )) ;
    xnor2 ix1354 (.Y (nx1353), .A0 (T10[4]), .A1 (T00[3])) ;
    aoi22 ix1356 (.Y (nx1355), .A0 (T00[2]), .A1 (T10[3]), .B0 (nx40), .B1 (nx50
          )) ;
    oai22 ix51 (.Y (nx50), .A0 (nx1361), .A1 (nx1313), .B0 (nx1363), .B1 (nx1021
          )) ;
    xnor2 ix1362 (.Y (nx1361), .A0 (T10[2]), .A1 (T00[1])) ;
    inv01 ix1364 (.Y (nx1363), .A (T00[1])) ;
    inv01 ix1366 (.Y (nx1365), .A (T00[3])) ;
    inv01 ix1368 (.Y (nx1367), .A (T00[5])) ;
    oai22 ix159 (.Y (nx158), .A0 (nx1375), .A1 (nx1381), .B0 (nx1379), .B1 (
          nx1377)) ;
    xnor2 ix1378 (.Y (nx1377), .A0 (nx1345), .A1 (nx1347)) ;
    inv01 ix1380 (.Y (nx1379), .A (T01[6])) ;
    aoi22 ix1382 (.Y (nx1381), .A0 (T01[5]), .A1 (nx98), .B0 (nx100), .B1 (nx146
          )) ;
    xnor2 ix99 (.Y (nx98), .A0 (nx1385), .A1 (nx62)) ;
    xnor2 ix1386 (.Y (nx1385), .A0 (T10[5]), .A1 (T00[4])) ;
    inv01 ix1390 (.Y (nx1389), .A (T01[5])) ;
    oai22 ix147 (.Y (nx146), .A0 (nx1393), .A1 (nx1399), .B0 (nx1397), .B1 (
          nx1395)) ;
    xnor2 ix1396 (.Y (nx1395), .A0 (nx1353), .A1 (nx1355)) ;
    inv01 ix1398 (.Y (nx1397), .A (T01[4])) ;
    aoi22 ix1400 (.Y (nx1399), .A0 (T01[3]), .A1 (nx106), .B0 (nx108), .B1 (
          nx134)) ;
    xnor2 ix107 (.Y (nx106), .A0 (nx1403), .A1 (nx50)) ;
    xnor2 ix1404 (.Y (nx1403), .A0 (T10[3]), .A1 (T00[2])) ;
    inv01 ix1408 (.Y (nx1407), .A (T01[3])) ;
    oai22 ix135 (.Y (nx134), .A0 (nx1411), .A1 (nx1417), .B0 (nx1415), .B1 (
          nx1413)) ;
    xnor2 ix1414 (.Y (nx1413), .A0 (nx1361), .A1 (nx1313)) ;
    inv01 ix1416 (.Y (nx1415), .A (T01[2])) ;
    aoi32 ix1418 (.Y (nx1417), .A0 (nx120), .A1 (T10[0]), .A2 (T01[0]), .B0 (
          T01[1]), .B1 (nx118)) ;
    xnor2 ix89 (.Y (nx88), .A0 (T00[7]), .A1 (nx1423)) ;
    aoi22 ix1424 (.Y (nx1423), .A0 (T00[6]), .A1 (T10[7]), .B0 (nx32), .B1 (nx74
          )) ;
    mux21 ix461 (.Y (nx460), .A0 (nx1431), .A1 (nx1433), .S0 (nx336)) ;
    mux21 ix1434 (.Y (nx1433), .A0 (nx338), .A1 (nx444), .S0 (nx342)) ;
    xnor2 ix339 (.Y (nx338), .A0 (nx1437), .A1 (nx158)) ;
    xnor2 ix1438 (.Y (nx1437), .A0 (nx90), .A1 (T01[7])) ;
    mux21 ix445 (.Y (nx444), .A0 (nx1441), .A1 (nx1445), .S0 (nx348)) ;
    xnor2 ix97 (.Y (nx96), .A0 (nx1377), .A1 (T01[6])) ;
    mux21 ix1446 (.Y (nx1445), .A0 (nx350), .A1 (nx428), .S0 (nx354)) ;
    xnor2 ix351 (.Y (nx350), .A0 (nx1449), .A1 (nx146)) ;
    xnor2 ix1450 (.Y (nx1449), .A0 (nx98), .A1 (T01[5])) ;
    mux21 ix429 (.Y (nx428), .A0 (nx1453), .A1 (nx1457), .S0 (nx360)) ;
    xnor2 ix105 (.Y (nx104), .A0 (nx1395), .A1 (T01[4])) ;
    mux21 ix1458 (.Y (nx1457), .A0 (nx362), .A1 (nx412), .S0 (nx366)) ;
    xnor2 ix363 (.Y (nx362), .A0 (nx1461), .A1 (nx134)) ;
    xnor2 ix1462 (.Y (nx1461), .A0 (nx106), .A1 (T01[3])) ;
    mux21 ix413 (.Y (nx412), .A0 (nx1465), .A1 (nx1469), .S0 (nx372)) ;
    xnor2 ix113 (.Y (nx112), .A0 (nx1413), .A1 (T01[2])) ;
    mux21 ix1470 (.Y (nx1469), .A0 (nx374), .A1 (nx396), .S0 (nx378)) ;
    nor02 ix397 (.Y (nx396), .A0 (nx1291), .A1 (nx392)) ;
    xnor2 ix373 (.Y (nx372), .A0 (nx368), .A1 (nx370)) ;
    xnor2 ix369 (.Y (nx368), .A0 (nx112), .A1 (nx1417)) ;
    xnor2 ix371 (.Y (nx370), .A0 (nx250), .A1 (nx1483)) ;
    xnor2 ix251 (.Y (nx250), .A0 (nx1479), .A1 (T12[2])) ;
    xnor2 ix1480 (.Y (nx1479), .A0 (nx1481), .A1 (nx1321)) ;
    xnor2 ix1482 (.Y (nx1481), .A0 (T21[2]), .A1 (T22[1])) ;
    aoi32 ix1484 (.Y (nx1483), .A0 (nx258), .A1 (T21[0]), .A2 (T12[0]), .B0 (
          T12[1]), .B1 (nx256)) ;
    inv01 ix1488 (.Y (nx1487), .A (T21[1])) ;
    xnor2 ix367 (.Y (nx366), .A0 (nx362), .A1 (nx364)) ;
    xnor2 ix365 (.Y (nx364), .A0 (nx1493), .A1 (nx272)) ;
    xnor2 ix1494 (.Y (nx1493), .A0 (nx244), .A1 (T12[3])) ;
    xnor2 ix245 (.Y (nx244), .A0 (nx1497), .A1 (nx188)) ;
    xnor2 ix1498 (.Y (nx1497), .A0 (T21[3]), .A1 (T22[2])) ;
    oai22 ix189 (.Y (nx188), .A0 (nx1481), .A1 (nx1321), .B0 (nx1501), .B1 (
          nx1503)) ;
    inv01 ix1502 (.Y (nx1501), .A (T22[1])) ;
    inv01 ix1504 (.Y (nx1503), .A (T21[2])) ;
    oai22 ix273 (.Y (nx272), .A0 (nx1507), .A1 (nx1483), .B0 (nx809), .B1 (
          nx1479)) ;
    xnor2 ix361 (.Y (nx360), .A0 (nx356), .A1 (nx358)) ;
    xnor2 ix357 (.Y (nx356), .A0 (nx104), .A1 (nx1399)) ;
    xnor2 ix359 (.Y (nx358), .A0 (nx242), .A1 (nx1525)) ;
    xnor2 ix243 (.Y (nx242), .A0 (nx1517), .A1 (T12[4])) ;
    xnor2 ix1518 (.Y (nx1517), .A0 (nx1519), .A1 (nx1521)) ;
    xnor2 ix1520 (.Y (nx1519), .A0 (T21[4]), .A1 (T22[3])) ;
    aoi22 ix1522 (.Y (nx1521), .A0 (T22[2]), .A1 (T21[3]), .B0 (nx178), .B1 (
          nx188)) ;
    aoi22 ix1526 (.Y (nx1525), .A0 (T12[3]), .A1 (nx244), .B0 (nx246), .B1 (
          nx272)) ;
    xnor2 ix355 (.Y (nx354), .A0 (nx350), .A1 (nx352)) ;
    xnor2 ix353 (.Y (nx352), .A0 (nx1533), .A1 (nx284)) ;
    xnor2 ix1534 (.Y (nx1533), .A0 (nx236), .A1 (T12[5])) ;
    xnor2 ix237 (.Y (nx236), .A0 (nx1537), .A1 (nx200)) ;
    xnor2 ix1538 (.Y (nx1537), .A0 (T21[5]), .A1 (T22[4])) ;
    oai22 ix201 (.Y (nx200), .A0 (nx1519), .A1 (nx1521), .B0 (nx867), .B1 (
          nx1541)) ;
    inv01 ix1542 (.Y (nx1541), .A (T21[4])) ;
    oai22 ix285 (.Y (nx284), .A0 (nx1545), .A1 (nx1525), .B0 (nx799), .B1 (
          nx1517)) ;
    xnor2 ix349 (.Y (nx348), .A0 (nx344), .A1 (nx346)) ;
    xnor2 ix345 (.Y (nx344), .A0 (nx96), .A1 (nx1381)) ;
    xnor2 ix347 (.Y (nx346), .A0 (nx234), .A1 (nx1563)) ;
    xnor2 ix235 (.Y (nx234), .A0 (nx1555), .A1 (T12[6])) ;
    xnor2 ix1556 (.Y (nx1555), .A0 (nx1557), .A1 (nx1559)) ;
    xnor2 ix1558 (.Y (nx1557), .A0 (T21[6]), .A1 (T22[5])) ;
    aoi22 ix1560 (.Y (nx1559), .A0 (T22[4]), .A1 (T21[5]), .B0 (nx174), .B1 (
          nx200)) ;
    aoi22 ix1564 (.Y (nx1563), .A0 (T12[5]), .A1 (nx236), .B0 (nx238), .B1 (
          nx284)) ;
    xnor2 ix343 (.Y (nx342), .A0 (nx338), .A1 (nx340)) ;
    xnor2 ix341 (.Y (nx340), .A0 (nx1571), .A1 (nx296)) ;
    xnor2 ix1572 (.Y (nx1571), .A0 (nx228), .A1 (T12[7])) ;
    xnor2 ix229 (.Y (nx228), .A0 (nx1575), .A1 (nx212)) ;
    xnor2 ix1576 (.Y (nx1575), .A0 (T21[7]), .A1 (T22[6])) ;
    oai22 ix213 (.Y (nx212), .A0 (nx1557), .A1 (nx1559), .B0 (nx849), .B1 (
          nx1579)) ;
    inv01 ix1580 (.Y (nx1579), .A (T21[6])) ;
    oai22 ix297 (.Y (nx296), .A0 (nx1583), .A1 (nx1563), .B0 (nx893), .B1 (
          nx1555)) ;
    xnor2 ix337 (.Y (nx336), .A0 (nx328), .A1 (nx334)) ;
    xnor2 ix329 (.Y (nx328), .A0 (nx88), .A1 (nx1337)) ;
    xnor2 ix335 (.Y (nx334), .A0 (nx226), .A1 (nx1597)) ;
    xnor2 ix227 (.Y (nx226), .A0 (T22[7]), .A1 (nx1593)) ;
    aoi22 ix1594 (.Y (nx1593), .A0 (T22[6]), .A1 (T21[7]), .B0 (nx170), .B1 (
          nx212)) ;
    aoi22 ix1598 (.Y (nx1597), .A0 (T12[7]), .A1 (nx228), .B0 (nx230), .B1 (
          nx296)) ;
    xnor2 ix323 (.Y (nx322), .A0 (nx1603), .A1 (nx1607)) ;
    nor02 ix1606 (.Y (nx1603), .A0 (nx166), .A1 (nx82)) ;
    nor02 ix1610 (.Y (nx1607), .A0 (nx304), .A1 (nx220)) ;
    nor02ii ix305 (.Y (nx304), .A0 (nx1597), .A1 (nx226)) ;
    xnor2 ix1616 (.Y (nx1615), .A0 (nx1446), .A1 (nx1458)) ;
    xnor2 ix1620 (.Y (nx1619), .A0 (nx372), .A1 (nx570)) ;
    oai22 ix571 (.Y (nx570), .A0 (nx1623), .A1 (nx1323), .B0 (nx1625), .B1 (
          nx376)) ;
    xnor2 ix1628 (.Y (nx1627), .A0 (nx492), .A1 (nx372)) ;
    oai22 ix493 (.Y (nx492), .A0 (nx1327), .A1 (nx1623), .B0 (nx374), .B1 (
          nx1631)) ;
    xnor2 ix1634 (.Y (nx1633), .A0 (nx1265), .A1 (nx1635)) ;
    xnor2 ix1429 (.Y (nx1428), .A0 (nx366), .A1 (nx1639)) ;
    aoi22 ix1640 (.Y (nx1639), .A0 (nx368), .A1 (nx1641), .B0 (nx372), .B1 (
          nx570)) ;
    xnor2 ix1423 (.Y (nx1422), .A0 (nx1645), .A1 (nx366)) ;
    aoi22 ix1646 (.Y (nx1645), .A0 (nx1465), .A1 (nx370), .B0 (nx492), .B1 (
          nx372)) ;
    xnor2 ix1648 (.Y (nx1647), .A0 (nx1394), .A1 (nx1406)) ;
    xnor2 ix1652 (.Y (nx1651), .A0 (nx360), .A1 (nx586)) ;
    oai22 ix587 (.Y (nx586), .A0 (nx1655), .A1 (nx1639), .B0 (nx1657), .B1 (
          nx364)) ;
    xnor2 ix1660 (.Y (nx1659), .A0 (nx508), .A1 (nx360)) ;
    oai22 ix509 (.Y (nx508), .A0 (nx1645), .A1 (nx1655), .B0 (nx362), .B1 (
          nx1663)) ;
    xnor2 ix1666 (.Y (nx1665), .A0 (nx1249), .A1 (nx1667)) ;
    xnor2 ix1377 (.Y (nx1376), .A0 (nx354), .A1 (nx1671)) ;
    aoi22 ix1672 (.Y (nx1671), .A0 (nx356), .A1 (nx1673), .B0 (nx360), .B1 (
          nx586)) ;
    xnor2 ix1371 (.Y (nx1370), .A0 (nx1677), .A1 (nx354)) ;
    aoi22 ix1678 (.Y (nx1677), .A0 (nx1453), .A1 (nx358), .B0 (nx508), .B1 (
          nx360)) ;
    xnor2 ix1680 (.Y (nx1679), .A0 (nx1342), .A1 (nx1354)) ;
    xnor2 ix1684 (.Y (nx1683), .A0 (nx348), .A1 (nx602)) ;
    oai22 ix603 (.Y (nx602), .A0 (nx1687), .A1 (nx1671), .B0 (nx1689), .B1 (
          nx352)) ;
    xnor2 ix1692 (.Y (nx1691), .A0 (nx524), .A1 (nx348)) ;
    oai22 ix525 (.Y (nx524), .A0 (nx1677), .A1 (nx1687), .B0 (nx350), .B1 (
          nx1695)) ;
    xnor2 ix1698 (.Y (nx1697), .A0 (nx1233), .A1 (nx1699)) ;
    xnor2 ix1325 (.Y (nx1324), .A0 (nx342), .A1 (nx1703)) ;
    aoi22 ix1704 (.Y (nx1703), .A0 (nx344), .A1 (nx1705), .B0 (nx348), .B1 (
          nx602)) ;
    xnor2 ix1319 (.Y (nx1318), .A0 (nx1709), .A1 (nx342)) ;
    aoi22 ix1710 (.Y (nx1709), .A0 (nx1441), .A1 (nx346), .B0 (nx524), .B1 (
          nx348)) ;
    xnor2 ix1712 (.Y (nx1711), .A0 (nx1290), .A1 (nx1302)) ;
    xnor2 ix1716 (.Y (nx1715), .A0 (nx336), .A1 (nx618)) ;
    oai22 ix619 (.Y (nx618), .A0 (nx1719), .A1 (nx1703), .B0 (nx1721), .B1 (
          nx340)) ;
    xnor2 ix1724 (.Y (nx1723), .A0 (nx540), .A1 (nx336)) ;
    oai22 ix541 (.Y (nx540), .A0 (nx1709), .A1 (nx1719), .B0 (nx338), .B1 (
          nx1727)) ;
    xnor2 ix1730 (.Y (nx1729), .A0 (nx1217), .A1 (nx1731)) ;
    xnor2 ix1273 (.Y (nx1272), .A0 (nx322), .A1 (nx1735)) ;
    aoi22 ix1736 (.Y (nx1735), .A0 (nx328), .A1 (nx1737), .B0 (nx336), .B1 (
          nx618)) ;
    xnor2 ix1267 (.Y (nx1266), .A0 (nx1741), .A1 (nx322)) ;
    aoi22 ix1742 (.Y (nx1741), .A0 (nx1431), .A1 (nx334), .B0 (nx540), .B1 (
          nx336)) ;
    xnor2 ix1744 (.Y (nx1743), .A0 (nx1250), .A1 (nx640)) ;
    oai22 ix635 (.Y (nx634), .A0 (nx1749), .A1 (nx1735), .B0 (nx1603), .B1 (
          nx316)) ;
    oai22 ix557 (.Y (nx556), .A0 (nx1741), .A1 (nx1749), .B0 (nx310), .B1 (
          nx1607)) ;
    mux21 ix3403 (.Y (nx3402), .A0 (nx1757), .A1 (nx2509), .S0 (nx2739)) ;
    nor02 ix1758 (.Y (nx1757), .A0 (nx2800), .A1 (nx2190)) ;
    oai22 ix2795 (.Y (nx2794), .A0 (nx1763), .A1 (nx1951), .B0 (nx1765), .B1 (
          nx2476)) ;
    nor02 ix1768 (.Y (nx1765), .A0 (nx2326), .A1 (nx2242)) ;
    nor02ii ix2327 (.Y (nx2326), .A0 (nx1771), .A1 (nx2248)) ;
    aoi22 ix1772 (.Y (nx1771), .A0 (T12[7]), .A1 (nx2250), .B0 (nx2252), .B1 (
          nx2318)) ;
    xnor2 ix2251 (.Y (nx2250), .A0 (nx1775), .A1 (nx2234)) ;
    xnor2 ix1776 (.Y (nx1775), .A0 (T01[7]), .A1 (T02[6])) ;
    oai22 ix2235 (.Y (nx2234), .A0 (nx1779), .A1 (nx1781), .B0 (nx1801), .B1 (
          nx1379)) ;
    xnor2 ix1780 (.Y (nx1779), .A0 (T01[6]), .A1 (T02[5])) ;
    aoi22 ix1782 (.Y (nx1781), .A0 (T02[4]), .A1 (T01[5]), .B0 (nx2196), .B1 (
          nx2222)) ;
    oai22 ix2223 (.Y (nx2222), .A0 (nx1787), .A1 (nx1789), .B0 (nx1799), .B1 (
          nx1397)) ;
    xnor2 ix1788 (.Y (nx1787), .A0 (T01[4]), .A1 (T02[3])) ;
    aoi22 ix1790 (.Y (nx1789), .A0 (T02[2]), .A1 (T01[3]), .B0 (nx2200), .B1 (
          nx2210)) ;
    oai22 ix2211 (.Y (nx2210), .A0 (nx1795), .A1 (nx1797), .B0 (nx885), .B1 (
          nx1415)) ;
    xnor2 ix1796 (.Y (nx1795), .A0 (T01[2]), .A1 (T02[1])) ;
    nand02 ix1798 (.Y (nx1797), .A0 (T02[0]), .A1 (T01[1])) ;
    inv01 ix1800 (.Y (nx1799), .A (T02[3])) ;
    inv01 ix1802 (.Y (nx1801), .A (T02[5])) ;
    oai22 ix2319 (.Y (nx2318), .A0 (nx1807), .A1 (nx1811), .B0 (nx893), .B1 (
          nx1809)) ;
    xnor2 ix1810 (.Y (nx1809), .A0 (nx1779), .A1 (nx1781)) ;
    aoi22 ix1812 (.Y (nx1811), .A0 (T12[5]), .A1 (nx2258), .B0 (nx2260), .B1 (
          nx2306)) ;
    xnor2 ix2259 (.Y (nx2258), .A0 (nx1815), .A1 (nx2222)) ;
    xnor2 ix1816 (.Y (nx1815), .A0 (T01[5]), .A1 (T02[4])) ;
    oai22 ix2307 (.Y (nx2306), .A0 (nx1821), .A1 (nx1825), .B0 (nx799), .B1 (
          nx1823)) ;
    xnor2 ix1824 (.Y (nx1823), .A0 (nx1787), .A1 (nx1789)) ;
    aoi22 ix1826 (.Y (nx1825), .A0 (T12[3]), .A1 (nx2266), .B0 (nx2268), .B1 (
          nx2294)) ;
    xnor2 ix2267 (.Y (nx2266), .A0 (nx1829), .A1 (nx2210)) ;
    xnor2 ix1830 (.Y (nx1829), .A0 (T01[3]), .A1 (T02[2])) ;
    oai22 ix2295 (.Y (nx2294), .A0 (nx1835), .A1 (nx1839), .B0 (nx809), .B1 (
          nx1837)) ;
    xnor2 ix1838 (.Y (nx1837), .A0 (nx1795), .A1 (nx1797)) ;
    aoi32 ix1840 (.Y (nx1839), .A0 (nx2280), .A1 (T12[0]), .A2 (T01[0]), .B0 (
          T12[1]), .B1 (nx2278)) ;
    xnor2 ix2281 (.Y (nx2280), .A0 (nx1843), .A1 (T12[1])) ;
    oai21 ix1844 (.Y (nx1843), .A0 (T01[1]), .A1 (T02[0]), .B0 (nx1797)) ;
    inv01 ix1848 (.Y (nx1847), .A (T01[1])) ;
    xnor2 ix2249 (.Y (nx2248), .A0 (T02[7]), .A1 (nx1851)) ;
    aoi22 ix1852 (.Y (nx1851), .A0 (T02[6]), .A1 (T01[7]), .B0 (nx2192), .B1 (
          nx2234)) ;
    nor02ii ix2465 (.Y (nx2464), .A0 (nx1863), .A1 (nx2386)) ;
    aoi22 ix1864 (.Y (nx1863), .A0 (T21[7]), .A1 (nx2388), .B0 (nx2390), .B1 (
          nx2456)) ;
    xnor2 ix2389 (.Y (nx2388), .A0 (nx1867), .A1 (nx2372)) ;
    xnor2 ix1868 (.Y (nx1867), .A0 (T10[7]), .A1 (T20[6])) ;
    oai22 ix2373 (.Y (nx2372), .A0 (nx1871), .A1 (nx1873), .B0 (nx1073), .B1 (
          nx1109)) ;
    xnor2 ix1872 (.Y (nx1871), .A0 (T10[6]), .A1 (T20[5])) ;
    aoi22 ix1874 (.Y (nx1873), .A0 (T20[4]), .A1 (T10[5]), .B0 (nx2334), .B1 (
          nx2360)) ;
    oai22 ix2361 (.Y (nx2360), .A0 (nx1879), .A1 (nx1881), .B0 (nx1027), .B1 (
          nx1067)) ;
    xnor2 ix1880 (.Y (nx1879), .A0 (T10[4]), .A1 (T20[3])) ;
    aoi22 ix1882 (.Y (nx1881), .A0 (T20[2]), .A1 (T10[3]), .B0 (nx2338), .B1 (
          nx2348)) ;
    oai22 ix2349 (.Y (nx2348), .A0 (nx1887), .A1 (nx1889), .B0 (nx1891), .B1 (
          nx1021)) ;
    xnor2 ix1888 (.Y (nx1887), .A0 (T10[2]), .A1 (T20[1])) ;
    nand02 ix1890 (.Y (nx1889), .A0 (T20[0]), .A1 (T10[1])) ;
    inv01 ix1892 (.Y (nx1891), .A (T20[1])) ;
    oai22 ix2457 (.Y (nx2456), .A0 (nx1899), .A1 (nx1903), .B0 (nx1579), .B1 (
          nx1901)) ;
    xnor2 ix1902 (.Y (nx1901), .A0 (nx1871), .A1 (nx1873)) ;
    aoi22 ix1904 (.Y (nx1903), .A0 (T21[5]), .A1 (nx2396), .B0 (nx2398), .B1 (
          nx2444)) ;
    xnor2 ix2397 (.Y (nx2396), .A0 (nx1907), .A1 (nx2360)) ;
    xnor2 ix1908 (.Y (nx1907), .A0 (T10[5]), .A1 (T20[4])) ;
    inv01 ix1912 (.Y (nx1911), .A (T21[5])) ;
    oai22 ix2445 (.Y (nx2444), .A0 (nx1915), .A1 (nx1919), .B0 (nx1541), .B1 (
          nx1917)) ;
    xnor2 ix1918 (.Y (nx1917), .A0 (nx1879), .A1 (nx1881)) ;
    aoi22 ix1920 (.Y (nx1919), .A0 (T21[3]), .A1 (nx2404), .B0 (nx2406), .B1 (
          nx2432)) ;
    xnor2 ix2405 (.Y (nx2404), .A0 (nx1923), .A1 (nx2348)) ;
    xnor2 ix1924 (.Y (nx1923), .A0 (T10[3]), .A1 (T20[2])) ;
    inv01 ix1928 (.Y (nx1927), .A (T21[3])) ;
    oai22 ix2433 (.Y (nx2432), .A0 (nx1931), .A1 (nx1935), .B0 (nx1503), .B1 (
          nx1933)) ;
    xnor2 ix1934 (.Y (nx1933), .A0 (nx1887), .A1 (nx1889)) ;
    aoi32 ix1936 (.Y (nx1935), .A0 (nx2418), .A1 (T21[0]), .A2 (T10[0]), .B0 (
          T21[1]), .B1 (nx2416)) ;
    xnor2 ix2419 (.Y (nx2418), .A0 (nx1939), .A1 (T21[1])) ;
    oai21 ix1940 (.Y (nx1939), .A0 (T10[1]), .A1 (T20[0]), .B0 (nx1889)) ;
    xnor2 ix2387 (.Y (nx2386), .A0 (T20[7]), .A1 (nx1945)) ;
    aoi22 ix1946 (.Y (nx1945), .A0 (T20[6]), .A1 (T10[7]), .B0 (nx2330), .B1 (
          nx2372)) ;
    aoi22 ix1952 (.Y (nx1951), .A0 (nx2488), .A1 (nx1955), .B0 (nx2496), .B1 (
          nx2778)) ;
    xnor2 ix2489 (.Y (nx2488), .A0 (nx2248), .A1 (nx1771)) ;
    xnor2 ix2497 (.Y (nx2496), .A0 (nx2488), .A1 (nx2494)) ;
    xnor2 ix2495 (.Y (nx2494), .A0 (nx2386), .A1 (nx1863)) ;
    oai22 ix2779 (.Y (nx2778), .A0 (nx1963), .A1 (nx1973), .B0 (nx2065), .B1 (
          nx2500)) ;
    xnor2 ix2499 (.Y (nx2498), .A0 (nx1967), .A1 (nx2318)) ;
    xnor2 ix1968 (.Y (nx1967), .A0 (nx2250), .A1 (T12[7])) ;
    xnor2 ix2501 (.Y (nx2500), .A0 (nx1971), .A1 (nx2456)) ;
    xnor2 ix1972 (.Y (nx1971), .A0 (nx2388), .A1 (T21[7])) ;
    aoi22 ix1974 (.Y (nx1973), .A0 (nx2504), .A1 (nx1979), .B0 (nx2508), .B1 (
          nx2762)) ;
    xnor2 ix2505 (.Y (nx2504), .A0 (nx2256), .A1 (nx1811)) ;
    xnor2 ix2257 (.Y (nx2256), .A0 (nx1809), .A1 (T12[6])) ;
    xnor2 ix2395 (.Y (nx2394), .A0 (nx1901), .A1 (T21[6])) ;
    xnor2 ix2509 (.Y (nx2508), .A0 (nx2504), .A1 (nx2506)) ;
    xnor2 ix2507 (.Y (nx2506), .A0 (nx2394), .A1 (nx1903)) ;
    oai22 ix2763 (.Y (nx2762), .A0 (nx1989), .A1 (nx1999), .B0 (nx2063), .B1 (
          nx2512)) ;
    xnor2 ix2511 (.Y (nx2510), .A0 (nx1993), .A1 (nx2306)) ;
    xnor2 ix1994 (.Y (nx1993), .A0 (nx2258), .A1 (T12[5])) ;
    xnor2 ix2513 (.Y (nx2512), .A0 (nx1997), .A1 (nx2444)) ;
    xnor2 ix1998 (.Y (nx1997), .A0 (nx2396), .A1 (T21[5])) ;
    aoi22 ix2000 (.Y (nx1999), .A0 (nx2516), .A1 (nx2005), .B0 (nx2520), .B1 (
          nx2746)) ;
    xnor2 ix2517 (.Y (nx2516), .A0 (nx2264), .A1 (nx1825)) ;
    xnor2 ix2265 (.Y (nx2264), .A0 (nx1823), .A1 (T12[4])) ;
    xnor2 ix2403 (.Y (nx2402), .A0 (nx1917), .A1 (T21[4])) ;
    xnor2 ix2521 (.Y (nx2520), .A0 (nx2516), .A1 (nx2518)) ;
    xnor2 ix2519 (.Y (nx2518), .A0 (nx2402), .A1 (nx1919)) ;
    oai22 ix2747 (.Y (nx2746), .A0 (nx2015), .A1 (nx2025), .B0 (nx2061), .B1 (
          nx2524)) ;
    xnor2 ix2523 (.Y (nx2522), .A0 (nx2019), .A1 (nx2294)) ;
    xnor2 ix2020 (.Y (nx2019), .A0 (nx2266), .A1 (T12[3])) ;
    xnor2 ix2525 (.Y (nx2524), .A0 (nx2023), .A1 (nx2432)) ;
    xnor2 ix2024 (.Y (nx2023), .A0 (nx2404), .A1 (T21[3])) ;
    aoi22 ix2026 (.Y (nx2025), .A0 (nx2528), .A1 (nx2031), .B0 (nx2532), .B1 (
          nx2730)) ;
    xnor2 ix2529 (.Y (nx2528), .A0 (nx2272), .A1 (nx1839)) ;
    xnor2 ix2273 (.Y (nx2272), .A0 (nx1837), .A1 (T12[2])) ;
    xnor2 ix2411 (.Y (nx2410), .A0 (nx1933), .A1 (T21[2])) ;
    xnor2 ix2533 (.Y (nx2532), .A0 (nx2528), .A1 (nx2530)) ;
    xnor2 ix2531 (.Y (nx2530), .A0 (nx2410), .A1 (nx1935)) ;
    oai22 ix2731 (.Y (nx2730), .A0 (nx2041), .A1 (nx2051), .B0 (nx2059), .B1 (
          nx2536)) ;
    xnor2 ix2535 (.Y (nx2534), .A0 (nx2280), .A1 (nx2045)) ;
    nand02 ix2046 (.Y (nx2045), .A0 (T12[0]), .A1 (T01[0])) ;
    xnor2 ix2537 (.Y (nx2536), .A0 (nx2418), .A1 (nx2049)) ;
    nand02 ix2050 (.Y (nx2049), .A0 (T21[0]), .A1 (T10[0])) ;
    nor02 ix2052 (.Y (nx2051), .A0 (nx2552), .A1 (nx2057)) ;
    xnor2 ix2553 (.Y (nx2552), .A0 (nx2055), .A1 (nx2057)) ;
    oai21 ix2056 (.Y (nx2055), .A0 (T01[0]), .A1 (T12[0]), .B0 (nx2045)) ;
    oai21 ix2058 (.Y (nx2057), .A0 (T10[0]), .A1 (T21[0]), .B0 (nx2049)) ;
    oai22 ix2717 (.Y (nx2716), .A0 (nx2069), .A1 (nx1763), .B0 (nx2470), .B1 (
          nx2105)) ;
    aoi22 ix2070 (.Y (nx2069), .A0 (nx2071), .A1 (nx2494), .B0 (nx2700), .B1 (
          nx2496)) ;
    oai22 ix2701 (.Y (nx2700), .A0 (nx2075), .A1 (nx1963), .B0 (nx2498), .B1 (
          nx2101)) ;
    aoi22 ix2076 (.Y (nx2075), .A0 (nx2077), .A1 (nx2506), .B0 (nx2684), .B1 (
          nx2508)) ;
    oai22 ix2685 (.Y (nx2684), .A0 (nx2081), .A1 (nx1989), .B0 (nx2510), .B1 (
          nx2099)) ;
    aoi22 ix2082 (.Y (nx2081), .A0 (nx2083), .A1 (nx2518), .B0 (nx2668), .B1 (
          nx2520)) ;
    oai22 ix2669 (.Y (nx2668), .A0 (nx2087), .A1 (nx2015), .B0 (nx2522), .B1 (
          nx2097)) ;
    aoi22 ix2088 (.Y (nx2087), .A0 (nx2089), .A1 (nx2530), .B0 (nx2652), .B1 (
          nx2532)) ;
    oai22 ix2653 (.Y (nx2652), .A0 (nx2093), .A1 (nx2041), .B0 (nx2534), .B1 (
          nx2095)) ;
    nor02 ix2094 (.Y (nx2093), .A0 (nx2051), .A1 (nx2552)) ;
    nor02 ix2108 (.Y (nx2105), .A0 (nx2464), .A1 (nx2380)) ;
    mux21 ix2621 (.Y (nx2620), .A0 (nx2071), .A1 (nx2115), .S0 (nx2496)) ;
    mux21 ix2116 (.Y (nx2115), .A0 (nx2498), .A1 (nx2604), .S0 (nx2502)) ;
    mux21 ix2605 (.Y (nx2604), .A0 (nx2077), .A1 (nx2119), .S0 (nx2508)) ;
    mux21 ix2120 (.Y (nx2119), .A0 (nx2510), .A1 (nx2588), .S0 (nx2514)) ;
    mux21 ix2589 (.Y (nx2588), .A0 (nx2083), .A1 (nx2123), .S0 (nx2520)) ;
    mux21 ix2124 (.Y (nx2123), .A0 (nx2522), .A1 (nx2572), .S0 (nx2526)) ;
    mux21 ix2573 (.Y (nx2572), .A0 (nx2089), .A1 (nx2127), .S0 (nx2532)) ;
    mux21 ix2128 (.Y (nx2127), .A0 (nx2534), .A1 (nx2556), .S0 (nx2538)) ;
    nor02 ix2557 (.Y (nx2556), .A0 (nx2055), .A1 (nx2552)) ;
    xnor2 ix2539 (.Y (nx2538), .A0 (nx2534), .A1 (nx2536)) ;
    xnor2 ix2527 (.Y (nx2526), .A0 (nx2522), .A1 (nx2524)) ;
    xnor2 ix2515 (.Y (nx2514), .A0 (nx2510), .A1 (nx2512)) ;
    xnor2 ix2503 (.Y (nx2502), .A0 (nx2498), .A1 (nx2500)) ;
    xnor2 ix2483 (.Y (nx2482), .A0 (nx1765), .A1 (nx2105)) ;
    mux21 ix2191 (.Y (nx2190), .A0 (nx2184), .A1 (nx2106), .S0 (nx3043)) ;
    oai22 ix2185 (.Y (nx2184), .A0 (nx2145), .A1 (nx2319), .B0 (nx2147), .B1 (
          nx1866)) ;
    nor02 ix2150 (.Y (nx2147), .A0 (nx1716), .A1 (nx1632)) ;
    nor02ii ix1717 (.Y (nx1716), .A0 (nx2153), .A1 (nx1638)) ;
    aoi22 ix2154 (.Y (nx2153), .A0 (T02[7]), .A1 (nx1640), .B0 (nx1642), .B1 (
          nx1708)) ;
    xnor2 ix1641 (.Y (nx1640), .A0 (nx2157), .A1 (nx1624)) ;
    xnor2 ix2158 (.Y (nx2157), .A0 (T00[7]), .A1 (T01[6])) ;
    oai22 ix1625 (.Y (nx1624), .A0 (nx2161), .A1 (nx2163), .B0 (nx1087), .B1 (
          nx1389)) ;
    xnor2 ix2162 (.Y (nx2161), .A0 (T00[6]), .A1 (T01[5])) ;
    aoi22 ix2164 (.Y (nx2163), .A0 (T00[5]), .A1 (T01[4]), .B0 (nx1586), .B1 (
          nx1612)) ;
    oai22 ix1613 (.Y (nx1612), .A0 (nx2169), .A1 (nx2171), .B0 (nx1041), .B1 (
          nx1407)) ;
    xnor2 ix2170 (.Y (nx2169), .A0 (T00[4]), .A1 (T01[3])) ;
    aoi22 ix2172 (.Y (nx2171), .A0 (T00[3]), .A1 (T01[2]), .B0 (nx1590), .B1 (
          nx1600)) ;
    oai22 ix1601 (.Y (nx1600), .A0 (nx2177), .A1 (nx2179), .B0 (nx995), .B1 (
          nx1847)) ;
    xnor2 ix2178 (.Y (nx2177), .A0 (T00[2]), .A1 (T01[1])) ;
    nand02 ix2180 (.Y (nx2179), .A0 (T00[1]), .A1 (T01[0])) ;
    oai22 ix1709 (.Y (nx1708), .A0 (nx2185), .A1 (nx2189), .B0 (nx827), .B1 (
          nx2187)) ;
    xnor2 ix2188 (.Y (nx2187), .A0 (nx2161), .A1 (nx2163)) ;
    aoi22 ix2190 (.Y (nx2189), .A0 (T02[5]), .A1 (nx1648), .B0 (nx1650), .B1 (
          nx1696)) ;
    xnor2 ix1649 (.Y (nx1648), .A0 (nx2193), .A1 (nx1612)) ;
    xnor2 ix2194 (.Y (nx2193), .A0 (T00[5]), .A1 (T01[4])) ;
    oai22 ix1697 (.Y (nx1696), .A0 (nx2199), .A1 (nx2203), .B0 (nx823), .B1 (
          nx2201)) ;
    xnor2 ix2202 (.Y (nx2201), .A0 (nx2169), .A1 (nx2171)) ;
    aoi22 ix2204 (.Y (nx2203), .A0 (T02[3]), .A1 (nx1656), .B0 (nx1658), .B1 (
          nx1684)) ;
    xnor2 ix1657 (.Y (nx1656), .A0 (nx2207), .A1 (nx1600)) ;
    xnor2 ix2208 (.Y (nx2207), .A0 (T00[3]), .A1 (T01[2])) ;
    oai22 ix1685 (.Y (nx1684), .A0 (nx2213), .A1 (nx2217), .B0 (nx819), .B1 (
          nx2215)) ;
    xnor2 ix2216 (.Y (nx2215), .A0 (nx2177), .A1 (nx2179)) ;
    aoi32 ix2218 (.Y (nx2217), .A0 (nx1670), .A1 (T00[0]), .A2 (T02[0]), .B0 (
          T02[1]), .B1 (nx1668)) ;
    xnor2 ix1671 (.Y (nx1670), .A0 (nx2221), .A1 (T02[1])) ;
    oai21 ix2222 (.Y (nx2221), .A0 (T01[0]), .A1 (T00[1]), .B0 (nx2179)) ;
    xnor2 ix1639 (.Y (nx1638), .A0 (T01[7]), .A1 (nx2229)) ;
    aoi22 ix2230 (.Y (nx2229), .A0 (T00[7]), .A1 (T01[6]), .B0 (nx1582), .B1 (
          nx1624)) ;
    nor02ii ix1855 (.Y (nx1854), .A0 (nx2239), .A1 (nx1776)) ;
    aoi22 ix2240 (.Y (nx2239), .A0 (T22[7]), .A1 (nx1778), .B0 (nx1780), .B1 (
          nx1846)) ;
    xnor2 ix1779 (.Y (nx1778), .A0 (nx2243), .A1 (nx1762)) ;
    xnor2 ix2244 (.Y (nx2243), .A0 (T20[7]), .A1 (T21[6])) ;
    oai22 ix1763 (.Y (nx1762), .A0 (nx2247), .A1 (nx2249), .B0 (nx1911), .B1 (
          nx1095)) ;
    xnor2 ix2248 (.Y (nx2247), .A0 (T20[6]), .A1 (T21[5])) ;
    aoi22 ix2250 (.Y (nx2249), .A0 (T21[4]), .A1 (T20[5]), .B0 (nx1724), .B1 (
          nx1750)) ;
    oai22 ix1751 (.Y (nx1750), .A0 (nx2255), .A1 (nx2257), .B0 (nx1927), .B1 (
          nx1049)) ;
    xnor2 ix2256 (.Y (nx2255), .A0 (T20[4]), .A1 (T21[3])) ;
    aoi22 ix2258 (.Y (nx2257), .A0 (T21[2]), .A1 (T20[3]), .B0 (nx1728), .B1 (
          nx1738)) ;
    oai22 ix1739 (.Y (nx1738), .A0 (nx2263), .A1 (nx2265), .B0 (nx1487), .B1 (
          nx1003)) ;
    xnor2 ix2264 (.Y (nx2263), .A0 (T20[2]), .A1 (T21[1])) ;
    nand02 ix2266 (.Y (nx2265), .A0 (T21[0]), .A1 (T20[1])) ;
    oai22 ix1847 (.Y (nx1846), .A0 (nx2271), .A1 (nx2275), .B0 (nx839), .B1 (
          nx2273)) ;
    xnor2 ix2274 (.Y (nx2273), .A0 (nx2247), .A1 (nx2249)) ;
    aoi22 ix2276 (.Y (nx2275), .A0 (T22[5]), .A1 (nx1786), .B0 (nx1788), .B1 (
          nx1834)) ;
    xnor2 ix1787 (.Y (nx1786), .A0 (nx2279), .A1 (nx1750)) ;
    xnor2 ix2280 (.Y (nx2279), .A0 (T20[5]), .A1 (T21[4])) ;
    oai22 ix1835 (.Y (nx1834), .A0 (nx2285), .A1 (nx2289), .B0 (nx857), .B1 (
          nx2287)) ;
    xnor2 ix2288 (.Y (nx2287), .A0 (nx2255), .A1 (nx2257)) ;
    aoi22 ix2290 (.Y (nx2289), .A0 (T22[3]), .A1 (nx1794), .B0 (nx1796), .B1 (
          nx1822)) ;
    xnor2 ix1795 (.Y (nx1794), .A0 (nx2293), .A1 (nx1738)) ;
    xnor2 ix2294 (.Y (nx2293), .A0 (T20[3]), .A1 (T21[2])) ;
    oai22 ix1823 (.Y (nx1822), .A0 (nx2299), .A1 (nx2303), .B0 (nx875), .B1 (
          nx2301)) ;
    xnor2 ix2302 (.Y (nx2301), .A0 (nx2263), .A1 (nx2265)) ;
    aoi32 ix2304 (.Y (nx2303), .A0 (nx1808), .A1 (T22[0]), .A2 (T20[0]), .B0 (
          T22[1]), .B1 (nx1806)) ;
    xnor2 ix1809 (.Y (nx1808), .A0 (nx2307), .A1 (T22[1])) ;
    oai21 ix2308 (.Y (nx2307), .A0 (T20[1]), .A1 (T21[0]), .B0 (nx2265)) ;
    xnor2 ix1777 (.Y (nx1776), .A0 (T21[7]), .A1 (nx2313)) ;
    aoi22 ix2314 (.Y (nx2313), .A0 (T21[6]), .A1 (T20[7]), .B0 (nx1720), .B1 (
          nx1762)) ;
    aoi22 ix2320 (.Y (nx2319), .A0 (nx1878), .A1 (nx2323), .B0 (nx1886), .B1 (
          nx2168)) ;
    xnor2 ix1879 (.Y (nx1878), .A0 (nx1638), .A1 (nx2153)) ;
    xnor2 ix1887 (.Y (nx1886), .A0 (nx1878), .A1 (nx1884)) ;
    xnor2 ix1885 (.Y (nx1884), .A0 (nx1776), .A1 (nx2239)) ;
    oai22 ix2169 (.Y (nx2168), .A0 (nx2331), .A1 (nx2341), .B0 (nx2433), .B1 (
          nx1890)) ;
    xnor2 ix1889 (.Y (nx1888), .A0 (nx2335), .A1 (nx1708)) ;
    xnor2 ix2336 (.Y (nx2335), .A0 (nx1640), .A1 (T02[7])) ;
    xnor2 ix1891 (.Y (nx1890), .A0 (nx2339), .A1 (nx1846)) ;
    xnor2 ix2340 (.Y (nx2339), .A0 (nx1778), .A1 (T22[7])) ;
    aoi22 ix2342 (.Y (nx2341), .A0 (nx1894), .A1 (nx2347), .B0 (nx1898), .B1 (
          nx2152)) ;
    xnor2 ix1895 (.Y (nx1894), .A0 (nx1646), .A1 (nx2189)) ;
    xnor2 ix1647 (.Y (nx1646), .A0 (nx2187), .A1 (T02[6])) ;
    xnor2 ix1785 (.Y (nx1784), .A0 (nx2273), .A1 (T22[6])) ;
    xnor2 ix1899 (.Y (nx1898), .A0 (nx1894), .A1 (nx1896)) ;
    xnor2 ix1897 (.Y (nx1896), .A0 (nx1784), .A1 (nx2275)) ;
    oai22 ix2153 (.Y (nx2152), .A0 (nx2357), .A1 (nx2367), .B0 (nx2431), .B1 (
          nx1902)) ;
    xnor2 ix1901 (.Y (nx1900), .A0 (nx2361), .A1 (nx1696)) ;
    xnor2 ix2362 (.Y (nx2361), .A0 (nx1648), .A1 (T02[5])) ;
    xnor2 ix1903 (.Y (nx1902), .A0 (nx2365), .A1 (nx1834)) ;
    xnor2 ix2366 (.Y (nx2365), .A0 (nx1786), .A1 (T22[5])) ;
    aoi22 ix2368 (.Y (nx2367), .A0 (nx1906), .A1 (nx2373), .B0 (nx1910), .B1 (
          nx2136)) ;
    xnor2 ix1907 (.Y (nx1906), .A0 (nx1654), .A1 (nx2203)) ;
    xnor2 ix1655 (.Y (nx1654), .A0 (nx2201), .A1 (T02[4])) ;
    xnor2 ix1793 (.Y (nx1792), .A0 (nx2287), .A1 (T22[4])) ;
    xnor2 ix1911 (.Y (nx1910), .A0 (nx1906), .A1 (nx1908)) ;
    xnor2 ix1909 (.Y (nx1908), .A0 (nx1792), .A1 (nx2289)) ;
    oai22 ix2137 (.Y (nx2136), .A0 (nx2383), .A1 (nx2393), .B0 (nx2429), .B1 (
          nx1914)) ;
    xnor2 ix1913 (.Y (nx1912), .A0 (nx2387), .A1 (nx1684)) ;
    xnor2 ix2388 (.Y (nx2387), .A0 (nx1656), .A1 (T02[3])) ;
    xnor2 ix1915 (.Y (nx1914), .A0 (nx2391), .A1 (nx1822)) ;
    xnor2 ix2392 (.Y (nx2391), .A0 (nx1794), .A1 (T22[3])) ;
    aoi22 ix2394 (.Y (nx2393), .A0 (nx1918), .A1 (nx2399), .B0 (nx1922), .B1 (
          nx2120)) ;
    xnor2 ix1919 (.Y (nx1918), .A0 (nx1662), .A1 (nx2217)) ;
    xnor2 ix1663 (.Y (nx1662), .A0 (nx2215), .A1 (T02[2])) ;
    xnor2 ix1801 (.Y (nx1800), .A0 (nx2301), .A1 (T22[2])) ;
    xnor2 ix1923 (.Y (nx1922), .A0 (nx1918), .A1 (nx1920)) ;
    xnor2 ix1921 (.Y (nx1920), .A0 (nx1800), .A1 (nx2303)) ;
    oai22 ix2121 (.Y (nx2120), .A0 (nx2409), .A1 (nx2419), .B0 (nx2427), .B1 (
          nx1926)) ;
    xnor2 ix1925 (.Y (nx1924), .A0 (nx1670), .A1 (nx2413)) ;
    nand02 ix2414 (.Y (nx2413), .A0 (T00[0]), .A1 (T02[0])) ;
    xnor2 ix1927 (.Y (nx1926), .A0 (nx1808), .A1 (nx2417)) ;
    nand02 ix2418 (.Y (nx2417), .A0 (T22[0]), .A1 (T20[0])) ;
    nor02 ix2420 (.Y (nx2419), .A0 (nx1942), .A1 (nx2425)) ;
    xnor2 ix1943 (.Y (nx1942), .A0 (nx2423), .A1 (nx2425)) ;
    oai21 ix2424 (.Y (nx2423), .A0 (T02[0]), .A1 (T00[0]), .B0 (nx2413)) ;
    oai21 ix2426 (.Y (nx2425), .A0 (T20[0]), .A1 (T22[0]), .B0 (nx2417)) ;
    oai22 ix2107 (.Y (nx2106), .A0 (nx2437), .A1 (nx2145), .B0 (nx1860), .B1 (
          nx2473)) ;
    aoi22 ix2438 (.Y (nx2437), .A0 (nx2439), .A1 (nx1884), .B0 (nx2090), .B1 (
          nx1886)) ;
    oai22 ix2091 (.Y (nx2090), .A0 (nx2443), .A1 (nx2331), .B0 (nx1888), .B1 (
          nx2469)) ;
    aoi22 ix2444 (.Y (nx2443), .A0 (nx2445), .A1 (nx1896), .B0 (nx2074), .B1 (
          nx1898)) ;
    oai22 ix2075 (.Y (nx2074), .A0 (nx2449), .A1 (nx2357), .B0 (nx1900), .B1 (
          nx2467)) ;
    aoi22 ix2450 (.Y (nx2449), .A0 (nx2451), .A1 (nx1908), .B0 (nx2058), .B1 (
          nx1910)) ;
    oai22 ix2059 (.Y (nx2058), .A0 (nx2455), .A1 (nx2383), .B0 (nx1912), .B1 (
          nx2465)) ;
    aoi22 ix2456 (.Y (nx2455), .A0 (nx2457), .A1 (nx1920), .B0 (nx2042), .B1 (
          nx1922)) ;
    oai22 ix2043 (.Y (nx2042), .A0 (nx2461), .A1 (nx2409), .B0 (nx1924), .B1 (
          nx2463)) ;
    nor02 ix2462 (.Y (nx2461), .A0 (nx2419), .A1 (nx1942)) ;
    nor02 ix2476 (.Y (nx2473), .A0 (nx1854), .A1 (nx1770)) ;
    mux21 ix2480 (.Y (nx2477), .A0 (nx1860), .A1 (nx2010), .S0 (nx1872)) ;
    mux21 ix2011 (.Y (nx2010), .A0 (nx2439), .A1 (nx2483), .S0 (nx1886)) ;
    mux21 ix2484 (.Y (nx2483), .A0 (nx1888), .A1 (nx1994), .S0 (nx1892)) ;
    mux21 ix1995 (.Y (nx1994), .A0 (nx2445), .A1 (nx2487), .S0 (nx1898)) ;
    mux21 ix2488 (.Y (nx2487), .A0 (nx1900), .A1 (nx1978), .S0 (nx1904)) ;
    mux21 ix1979 (.Y (nx1978), .A0 (nx2451), .A1 (nx2491), .S0 (nx1910)) ;
    mux21 ix2492 (.Y (nx2491), .A0 (nx1912), .A1 (nx1962), .S0 (nx1916)) ;
    mux21 ix1963 (.Y (nx1962), .A0 (nx2457), .A1 (nx2495), .S0 (nx1922)) ;
    mux21 ix2496 (.Y (nx2495), .A0 (nx1924), .A1 (nx1946), .S0 (nx1928)) ;
    nor02 ix1947 (.Y (nx1946), .A0 (nx2423), .A1 (nx1942)) ;
    xnor2 ix1929 (.Y (nx1928), .A0 (nx1924), .A1 (nx1926)) ;
    xnor2 ix1917 (.Y (nx1916), .A0 (nx1912), .A1 (nx1914)) ;
    xnor2 ix1905 (.Y (nx1904), .A0 (nx1900), .A1 (nx1902)) ;
    xnor2 ix1893 (.Y (nx1892), .A0 (nx1888), .A1 (nx1890)) ;
    xnor2 ix1873 (.Y (nx1872), .A0 (nx2147), .A1 (nx2473)) ;
    mux21 ix2510 (.Y (nx2509), .A0 (nx3140), .A1 (nx3386), .S0 (nx2735)) ;
    mux21 ix3141 (.Y (nx3140), .A0 (nx2513), .A1 (nx2519), .S0 (nx3047)) ;
    xnor2 ix2811 (.Y (nx2810), .A0 (nx2482), .A1 (nx1951)) ;
    xnor2 ix2805 (.Y (nx2804), .A0 (nx2069), .A1 (nx2482)) ;
    mux21 ix2520 (.Y (nx2519), .A0 (nx2822), .A1 (nx2816), .S0 (nx3043)) ;
    xnor2 ix2823 (.Y (nx2822), .A0 (nx1872), .A1 (nx2319)) ;
    xnor2 ix2817 (.Y (nx2816), .A0 (nx2437), .A1 (nx1872)) ;
    mux21 ix2526 (.Y (nx2525), .A0 (nx2800), .A1 (nx3114), .S0 (nx2663)) ;
    mux21 ix3115 (.Y (nx3114), .A0 (nx2513), .A1 (nx2529), .S0 (nx2661)) ;
    mux21 ix2530 (.Y (nx2529), .A0 (nx2840), .A1 (nx3098), .S0 (nx2653)) ;
    xnor2 ix2534 (.Y (nx2533), .A0 (nx2496), .A1 (nx2778)) ;
    xnor2 ix2536 (.Y (nx2535), .A0 (nx2700), .A1 (nx2496)) ;
    mux21 ix3099 (.Y (nx3098), .A0 (nx2539), .A1 (nx2545), .S0 (nx2645)) ;
    xnor2 ix2863 (.Y (nx2862), .A0 (nx2502), .A1 (nx1973)) ;
    xnor2 ix2857 (.Y (nx2856), .A0 (nx2075), .A1 (nx2502)) ;
    mux21 ix2546 (.Y (nx2545), .A0 (nx2892), .A1 (nx3082), .S0 (nx2637)) ;
    xnor2 ix2550 (.Y (nx2549), .A0 (nx2508), .A1 (nx2762)) ;
    xnor2 ix2552 (.Y (nx2551), .A0 (nx2684), .A1 (nx2508)) ;
    mux21 ix3083 (.Y (nx3082), .A0 (nx2555), .A1 (nx2561), .S0 (nx2629)) ;
    xnor2 ix2915 (.Y (nx2914), .A0 (nx2514), .A1 (nx1999)) ;
    xnor2 ix2909 (.Y (nx2908), .A0 (nx2081), .A1 (nx2514)) ;
    mux21 ix2562 (.Y (nx2561), .A0 (nx2944), .A1 (nx3066), .S0 (nx2621)) ;
    xnor2 ix2566 (.Y (nx2565), .A0 (nx2520), .A1 (nx2746)) ;
    xnor2 ix2568 (.Y (nx2567), .A0 (nx2668), .A1 (nx2520)) ;
    mux21 ix3067 (.Y (nx3066), .A0 (nx2571), .A1 (nx2577), .S0 (nx2613)) ;
    xnor2 ix2967 (.Y (nx2966), .A0 (nx2526), .A1 (nx2025)) ;
    xnor2 ix2961 (.Y (nx2960), .A0 (nx2087), .A1 (nx2526)) ;
    mux21 ix2578 (.Y (nx2577), .A0 (nx2996), .A1 (nx3050), .S0 (nx2605)) ;
    xnor2 ix2582 (.Y (nx2581), .A0 (nx2532), .A1 (nx2730)) ;
    xnor2 ix2584 (.Y (nx2583), .A0 (nx2652), .A1 (nx2532)) ;
    mux21 ix3051 (.Y (nx3050), .A0 (nx2587), .A1 (nx2593), .S0 (nx2597)) ;
    xnor2 ix3019 (.Y (nx3018), .A0 (nx2538), .A1 (nx2051)) ;
    xnor2 ix3013 (.Y (nx3012), .A0 (nx2093), .A1 (nx2538)) ;
    nand02 ix2594 (.Y (nx2593), .A0 (nx2595), .A1 (nx1942)) ;
    xnor2 ix2598 (.Y (nx2597), .A0 (nx2587), .A1 (nx2599)) ;
    mux21 ix2600 (.Y (nx2599), .A0 (nx3030), .A1 (nx3024), .S0 (nx3043)) ;
    xnor2 ix3031 (.Y (nx3030), .A0 (nx1928), .A1 (nx2419)) ;
    xnor2 ix3025 (.Y (nx3024), .A0 (nx2461), .A1 (nx1928)) ;
    xnor2 ix2606 (.Y (nx2605), .A0 (nx2996), .A1 (nx3008)) ;
    mux21 ix3009 (.Y (nx3008), .A0 (nx2609), .A1 (nx2611), .S0 (nx3043)) ;
    xnor2 ix2610 (.Y (nx2609), .A0 (nx1922), .A1 (nx2120)) ;
    xnor2 ix2612 (.Y (nx2611), .A0 (nx2042), .A1 (nx1922)) ;
    xnor2 ix2614 (.Y (nx2613), .A0 (nx2571), .A1 (nx2615)) ;
    mux21 ix2616 (.Y (nx2615), .A0 (nx2978), .A1 (nx2972), .S0 (nx3043)) ;
    xnor2 ix2979 (.Y (nx2978), .A0 (nx1916), .A1 (nx2393)) ;
    xnor2 ix2973 (.Y (nx2972), .A0 (nx2455), .A1 (nx1916)) ;
    xnor2 ix2622 (.Y (nx2621), .A0 (nx2944), .A1 (nx2956)) ;
    mux21 ix2957 (.Y (nx2956), .A0 (nx2625), .A1 (nx2627), .S0 (nx3043)) ;
    xnor2 ix2626 (.Y (nx2625), .A0 (nx1910), .A1 (nx2136)) ;
    xnor2 ix2628 (.Y (nx2627), .A0 (nx2058), .A1 (nx1910)) ;
    xnor2 ix2630 (.Y (nx2629), .A0 (nx2555), .A1 (nx2631)) ;
    mux21 ix2632 (.Y (nx2631), .A0 (nx2926), .A1 (nx2920), .S0 (nx3045)) ;
    xnor2 ix2927 (.Y (nx2926), .A0 (nx1904), .A1 (nx2367)) ;
    xnor2 ix2921 (.Y (nx2920), .A0 (nx2449), .A1 (nx1904)) ;
    xnor2 ix2638 (.Y (nx2637), .A0 (nx2892), .A1 (nx2904)) ;
    mux21 ix2905 (.Y (nx2904), .A0 (nx2641), .A1 (nx2643), .S0 (nx3045)) ;
    xnor2 ix2642 (.Y (nx2641), .A0 (nx1898), .A1 (nx2152)) ;
    xnor2 ix2644 (.Y (nx2643), .A0 (nx2074), .A1 (nx1898)) ;
    xnor2 ix2646 (.Y (nx2645), .A0 (nx2539), .A1 (nx2647)) ;
    mux21 ix2648 (.Y (nx2647), .A0 (nx2874), .A1 (nx2868), .S0 (nx3045)) ;
    xnor2 ix2875 (.Y (nx2874), .A0 (nx1892), .A1 (nx2341)) ;
    xnor2 ix2869 (.Y (nx2868), .A0 (nx2443), .A1 (nx1892)) ;
    xnor2 ix2654 (.Y (nx2653), .A0 (nx2840), .A1 (nx2852)) ;
    mux21 ix2853 (.Y (nx2852), .A0 (nx2657), .A1 (nx2659), .S0 (nx3045)) ;
    xnor2 ix2658 (.Y (nx2657), .A0 (nx1886), .A1 (nx2168)) ;
    xnor2 ix2660 (.Y (nx2659), .A0 (nx2090), .A1 (nx1886)) ;
    xnor2 ix2662 (.Y (nx2661), .A0 (nx2513), .A1 (nx2519)) ;
    xnor2 ix2664 (.Y (nx2663), .A0 (nx2800), .A1 (nx2190)) ;
    mux21 ix3387 (.Y (nx3386), .A0 (nx2667), .A1 (nx2669), .S0 (nx2731)) ;
    mux21 ix2668 (.Y (nx2667), .A0 (nx2840), .A1 (nx2852), .S0 (nx3047)) ;
    mux21 ix2670 (.Y (nx2669), .A0 (nx3176), .A1 (nx3370), .S0 (nx2727)) ;
    mux21 ix3177 (.Y (nx3176), .A0 (nx2539), .A1 (nx2647), .S0 (nx3047)) ;
    mux21 ix3371 (.Y (nx3370), .A0 (nx2675), .A1 (nx2677), .S0 (nx2723)) ;
    mux21 ix2676 (.Y (nx2675), .A0 (nx2892), .A1 (nx2904), .S0 (nx3047)) ;
    mux21 ix2678 (.Y (nx2677), .A0 (nx3212), .A1 (nx3354), .S0 (nx2719)) ;
    mux21 ix3213 (.Y (nx3212), .A0 (nx2555), .A1 (nx2631), .S0 (nx3047)) ;
    mux21 ix3355 (.Y (nx3354), .A0 (nx2683), .A1 (nx2685), .S0 (nx2715)) ;
    mux21 ix2684 (.Y (nx2683), .A0 (nx2944), .A1 (nx2956), .S0 (nx3047)) ;
    mux21 ix2686 (.Y (nx2685), .A0 (nx3248), .A1 (nx3338), .S0 (nx2711)) ;
    mux21 ix3249 (.Y (nx3248), .A0 (nx2571), .A1 (nx2615), .S0 (nx3049)) ;
    mux21 ix3339 (.Y (nx3338), .A0 (nx2691), .A1 (nx2693), .S0 (nx2707)) ;
    mux21 ix2692 (.Y (nx2691), .A0 (nx2996), .A1 (nx3008), .S0 (nx3049)) ;
    mux21 ix2694 (.Y (nx2693), .A0 (nx3284), .A1 (nx3322), .S0 (nx2703)) ;
    mux21 ix3285 (.Y (nx3284), .A0 (nx2587), .A1 (nx2599), .S0 (nx3049)) ;
    nor02ii ix3323 (.Y (nx3322), .A0 (nx3318), .A1 (nx3306)) ;
    mux21 ix3307 (.Y (nx3306), .A0 (nx2552), .A1 (nx1942), .S0 (nx3049)) ;
    xnor2 ix2704 (.Y (nx2703), .A0 (nx3284), .A1 (nx3292)) ;
    xnor2 ix2708 (.Y (nx2707), .A0 (nx2691), .A1 (nx2709)) ;
    xnor2 ix2712 (.Y (nx2711), .A0 (nx3248), .A1 (nx3256)) ;
    xnor2 ix2716 (.Y (nx2715), .A0 (nx2683), .A1 (nx2717)) ;
    xnor2 ix2720 (.Y (nx2719), .A0 (nx3212), .A1 (nx3220)) ;
    xnor2 ix2724 (.Y (nx2723), .A0 (nx2675), .A1 (nx2725)) ;
    xnor2 ix2728 (.Y (nx2727), .A0 (nx3176), .A1 (nx3184)) ;
    xnor2 ix2732 (.Y (nx2731), .A0 (nx2667), .A1 (nx2733)) ;
    xnor2 ix2736 (.Y (nx2735), .A0 (nx3140), .A1 (nx3148)) ;
    xnor2 ix2740 (.Y (nx2739), .A0 (nx1757), .A1 (nx2741)) ;
    nor02 ix2742 (.Y (nx2741), .A0 (nx1250), .A1 (nx640)) ;
    oai22 ix3859 (.Y (nx3858), .A0 (nx3056), .A1 (nx2757), .B0 (nx3060), .B1 (
          nx2765)) ;
    nor02 ix3839 (.Y (EDGE), .A0 (THRESHOLD[12]), .A1 (nx2769)) ;
    mux21 ix2770 (.Y (nx2769), .A0 (nx3826), .A1 (nx3682), .S0 (nx3684)) ;
    oai22 ix3827 (.Y (nx3826), .A0 (nx3692), .A1 (nx2909), .B0 (nx2775), .B1 (
          THRESHOLD[10])) ;
    xnor2 ix3693 (.Y (nx3692), .A0 (nx2775), .A1 (THRESHOLD[10])) ;
    xnor2 ix2776 (.Y (nx2775), .A0 (nx3410), .A1 (nx3680)) ;
    nand02 ix3411 (.Y (nx3410), .A0 (nx1757), .A1 (nx2741)) ;
    nor02 ix3681 (.Y (nx3680), .A0 (nx2781), .A1 (nx2783)) ;
    nand02 ix2784 (.Y (nx2783), .A0 (nx3426), .A1 (nx3676)) ;
    oai22 ix3677 (.Y (nx3676), .A0 (nx2789), .A1 (nx2803), .B0 (nx2791), .B1 (
          nx2793)) ;
    xnor2 ix2790 (.Y (nx2789), .A0 (nx2791), .A1 (nx2793)) ;
    aoi221 ix2794 (.Y (nx2793), .A0 (nx640), .A1 (nx3021), .B0 (nx2800), .B1 (
           nx3019), .C0 (nx3462)) ;
    ao22 ix3463 (.Y (nx3462), .A0 (nx1250), .A1 (nx3458), .B0 (nx2190), .B1 (
         nx3450)) ;
    aoi22 ix2804 (.Y (nx2803), .A0 (nx3474), .A1 (nx3488), .B0 (nx3490), .B1 (
          nx3664)) ;
    nand02 ix2812 (.Y (nx2811), .A0 (nx3049), .A1 (nx3013)) ;
    xnor2 ix3491 (.Y (nx3490), .A0 (nx3474), .A1 (nx2821)) ;
    aoi221 ix2822 (.Y (nx2821), .A0 (nx1276), .A1 (nx3021), .B0 (nx2814), .B1 (
           nx3019), .C0 (nx3486)) ;
    oai22 ix3487 (.Y (nx3486), .A0 (nx1217), .A1 (nx2757), .B0 (nx2519), .B1 (
          nx2765)) ;
    oai22 ix3665 (.Y (nx3664), .A0 (nx2831), .A1 (nx2839), .B0 (nx2833), .B1 (
          nx2835)) ;
    xnor2 ix2832 (.Y (nx2831), .A0 (nx2833), .A1 (nx2835)) ;
    aoi221 ix2836 (.Y (nx2835), .A0 (nx1302), .A1 (nx3021), .B0 (nx2840), .B1 (
           nx3019), .C0 (nx3510)) ;
    ao22 ix3511 (.Y (nx3510), .A0 (nx1290), .A1 (nx3458), .B0 (nx2852), .B1 (
         nx3450)) ;
    aoi22 ix2840 (.Y (nx2839), .A0 (nx3522), .A1 (nx3536), .B0 (nx3538), .B1 (
          nx3652)) ;
    xnor2 ix3539 (.Y (nx3538), .A0 (nx3522), .A1 (nx2853)) ;
    aoi221 ix2854 (.Y (nx2853), .A0 (nx1328), .A1 (nx3021), .B0 (nx2866), .B1 (
           nx3019), .C0 (nx3534)) ;
    oai22 ix3535 (.Y (nx3534), .A0 (nx1233), .A1 (nx2757), .B0 (nx2647), .B1 (
          nx2765)) ;
    oai22 ix3653 (.Y (nx3652), .A0 (nx2861), .A1 (nx2869), .B0 (nx2863), .B1 (
          nx2865)) ;
    xnor2 ix2862 (.Y (nx2861), .A0 (nx2863), .A1 (nx2865)) ;
    aoi221 ix2866 (.Y (nx2865), .A0 (nx1354), .A1 (nx3021), .B0 (nx2892), .B1 (
           nx3019), .C0 (nx3558)) ;
    ao22 ix3559 (.Y (nx3558), .A0 (nx1342), .A1 (nx3458), .B0 (nx2904), .B1 (
         nx3450)) ;
    aoi22 ix2870 (.Y (nx2869), .A0 (nx3570), .A1 (nx3584), .B0 (nx3586), .B1 (
          nx3640)) ;
    xnor2 ix3587 (.Y (nx3586), .A0 (nx3570), .A1 (nx2881)) ;
    aoi221 ix2882 (.Y (nx2881), .A0 (nx1380), .A1 (nx3444), .B0 (nx2918), .B1 (
           nx3438), .C0 (nx3582)) ;
    oai22 ix3583 (.Y (nx3582), .A0 (nx1249), .A1 (nx2757), .B0 (nx2631), .B1 (
          nx2765)) ;
    oai22 ix3641 (.Y (nx3640), .A0 (nx2889), .A1 (nx2897), .B0 (nx2891), .B1 (
          nx2893)) ;
    xnor2 ix2890 (.Y (nx2889), .A0 (nx2891), .A1 (nx2893)) ;
    aoi221 ix2894 (.Y (nx2893), .A0 (nx1406), .A1 (nx3444), .B0 (nx2944), .B1 (
           nx3438), .C0 (nx3606)) ;
    ao22 ix3607 (.Y (nx3606), .A0 (nx1394), .A1 (nx3458), .B0 (nx2956), .B1 (
         nx3450)) ;
    aoi221 ix2902 (.Y (nx2901), .A0 (nx1432), .A1 (nx3444), .B0 (nx2970), .B1 (
           nx3438), .C0 (nx3630)) ;
    oai22 ix3631 (.Y (nx3630), .A0 (nx1265), .A1 (nx2757), .B0 (nx2615), .B1 (
          nx2765)) ;
    mux21 ix2910 (.Y (nx2909), .A0 (nx3810), .A1 (nx3698), .S0 (nx3700)) ;
    oai22 ix3811 (.Y (nx3810), .A0 (nx3708), .A1 (nx2915), .B0 (nx2913), .B1 (
          THRESHOLD[8])) ;
    xnor2 ix3709 (.Y (nx3708), .A0 (nx2913), .A1 (THRESHOLD[8])) ;
    xnor2 ix2914 (.Y (nx2913), .A0 (nx3426), .A1 (nx3676)) ;
    mux21 ix2916 (.Y (nx2915), .A0 (nx3794), .A1 (nx3710), .S0 (nx3712)) ;
    oai22 ix3795 (.Y (nx3794), .A0 (nx3716), .A1 (nx2923), .B0 (nx2921), .B1 (
          THRESHOLD[6])) ;
    xnor2 ix3717 (.Y (nx3716), .A0 (nx2921), .A1 (THRESHOLD[6])) ;
    xnor2 ix2922 (.Y (nx2921), .A0 (nx3490), .A1 (nx3664)) ;
    mux21 ix2924 (.Y (nx2923), .A0 (nx3778), .A1 (nx3718), .S0 (nx3720)) ;
    oai22 ix3779 (.Y (nx3778), .A0 (nx3724), .A1 (nx2931), .B0 (nx2929), .B1 (
          THRESHOLD[4])) ;
    xnor2 ix3725 (.Y (nx3724), .A0 (nx2929), .A1 (THRESHOLD[4])) ;
    xnor2 ix2930 (.Y (nx2929), .A0 (nx3538), .A1 (nx3652)) ;
    mux21 ix2932 (.Y (nx2931), .A0 (nx3762), .A1 (nx3726), .S0 (nx3728)) ;
    oai22 ix3763 (.Y (nx3762), .A0 (nx3732), .A1 (nx2939), .B0 (nx2937), .B1 (
          THRESHOLD[2])) ;
    xnor2 ix3733 (.Y (nx3732), .A0 (nx2937), .A1 (THRESHOLD[2])) ;
    xnor2 ix2938 (.Y (nx2937), .A0 (nx3586), .A1 (nx3640)) ;
    mux21 ix2940 (.Y (nx2939), .A0 (nx3734), .A1 (nx3746), .S0 (nx2949)) ;
    xnor2 ix3735 (.Y (nx3734), .A0 (nx2889), .A1 (nx3634)) ;
    nor02 ix3635 (.Y (nx3634), .A0 (nx2899), .A1 (nx2901)) ;
    nor02 ix3747 (.Y (nx3746), .A0 (nx2947), .A1 (THRESHOLD[0])) ;
    xnor2 ix2948 (.Y (nx2947), .A0 (nx2899), .A1 (nx2901)) ;
    xnor2 ix2950 (.Y (nx2949), .A0 (nx3734), .A1 (THRESHOLD[1])) ;
    xnor2 ix3729 (.Y (nx3728), .A0 (nx2955), .A1 (THRESHOLD[3])) ;
    xnor2 ix2956 (.Y (nx2955), .A0 (nx2861), .A1 (nx2869)) ;
    xnor2 ix3721 (.Y (nx3720), .A0 (nx2961), .A1 (THRESHOLD[5])) ;
    xnor2 ix2962 (.Y (nx2961), .A0 (nx2831), .A1 (nx2839)) ;
    xnor2 ix3713 (.Y (nx3712), .A0 (nx2965), .A1 (THRESHOLD[7])) ;
    xnor2 ix2966 (.Y (nx2965), .A0 (nx2789), .A1 (nx2803)) ;
    xnor2 ix3701 (.Y (nx3700), .A0 (nx2971), .A1 (THRESHOLD[9])) ;
    xnor2 ix2972 (.Y (nx2971), .A0 (nx2781), .A1 (nx2783)) ;
    xnor2 ix3685 (.Y (nx3684), .A0 (nx2977), .A1 (THRESHOLD[11])) ;
    nand02 ix2978 (.Y (nx2977), .A0 (nx3410), .A1 (nx3680)) ;
    aoi21 ix3869 (.Y (DIRECTION[2]), .A0 (nx2765), .A1 (nx2757), .B0 (nx2983)) ;
    dffr fsm_inst_reg_state_4 (.Q (O_VALID), .QB (\$dummy [0]), .D (
         fsm_inst_state_3), .CLK (CLOCK), .R (RESET)) ;
    dffr fsm_inst_reg_state_3 (.Q (fsm_inst_state_3), .QB (\$dummy [1]), .D (
         fsm_inst_state_2), .CLK (CLOCK), .R (RESET)) ;
    dffr fsm_inst_reg_state_2 (.Q (fsm_inst_state_2), .QB (\$dummy [2]), .D (
         nx18), .CLK (CLOCK), .R (RESET)) ;
    and02 ix19 (.Y (nx18), .A0 (I_VALID), .A1 (READY)) ;
    dffr fsm_inst_reg_state_1 (.Q (READY), .QB (\$dummy [3]), .D (nx12), .CLK (
         CLOCK), .R (RESET)) ;
    or03 ix13 (.Y (nx12), .A0 (nx8), .A1 (fsm_inst_state_0), .A2 (O_VALID)) ;
    nor02ii ix9 (.Y (nx8), .A0 (I_VALID), .A1 (READY)) ;
    dffs_ni fsm_inst_reg_state_0 (.Q (fsm_inst_state_0), .QB (\$dummy [4]), .D (
            nx679), .CLK (CLOCK), .S (RESET)) ;
    inv01 ix3727 (.Y (nx3726), .A (nx2955)) ;
    inv01 ix3719 (.Y (nx3718), .A (nx2961)) ;
    inv01 ix3711 (.Y (nx3710), .A (nx2965)) ;
    inv01 ix3699 (.Y (nx3698), .A (nx2971)) ;
    inv01 ix3683 (.Y (nx3682), .A (nx2977)) ;
    inv01 ix2898 (.Y (nx2897), .A (nx3634)) ;
    inv01 ix3585 (.Y (nx3584), .A (nx2881)) ;
    inv01 ix3537 (.Y (nx3536), .A (nx2853)) ;
    inv01 ix3489 (.Y (nx3488), .A (nx2821)) ;
    inv01 ix3459 (.Y (nx3458), .A (nx2757)) ;
    inv01 ix2766 (.Y (nx2765), .A (nx3450)) ;
    inv01 ix3439 (.Y (nx3438), .A (nx2811)) ;
    inv01 ix2748 (.Y (nx2747), .A (nx3402)) ;
    inv01 ix2971 (.Y (nx2970), .A (nx2571)) ;
    inv01 ix2919 (.Y (nx2918), .A (nx2555)) ;
    inv01 ix2867 (.Y (nx2866), .A (nx2539)) ;
    inv01 ix2815 (.Y (nx2814), .A (nx2513)) ;
    inv01 ix2596 (.Y (nx2595), .A (nx2552)) ;
    inv01 ix2042 (.Y (nx2041), .A (nx2538)) ;
    inv01 ix2096 (.Y (nx2095), .A (nx2536)) ;
    inv01 ix2060 (.Y (nx2059), .A (nx2534)) ;
    inv01 ix2032 (.Y (nx2031), .A (nx2530)) ;
    inv01 ix2090 (.Y (nx2089), .A (nx2528)) ;
    inv01 ix2016 (.Y (nx2015), .A (nx2526)) ;
    inv01 ix2098 (.Y (nx2097), .A (nx2524)) ;
    inv01 ix2062 (.Y (nx2061), .A (nx2522)) ;
    inv01 ix2006 (.Y (nx2005), .A (nx2518)) ;
    inv01 ix2084 (.Y (nx2083), .A (nx2516)) ;
    inv01 ix1990 (.Y (nx1989), .A (nx2514)) ;
    inv01 ix2100 (.Y (nx2099), .A (nx2512)) ;
    inv01 ix2064 (.Y (nx2063), .A (nx2510)) ;
    inv01 ix1980 (.Y (nx1979), .A (nx2506)) ;
    inv01 ix2078 (.Y (nx2077), .A (nx2504)) ;
    inv01 ix1964 (.Y (nx1963), .A (nx2502)) ;
    inv01 ix2102 (.Y (nx2101), .A (nx2500)) ;
    inv01 ix2066 (.Y (nx2065), .A (nx2498)) ;
    inv01 ix1956 (.Y (nx1955), .A (nx2494)) ;
    inv01 ix2072 (.Y (nx2071), .A (nx2488)) ;
    inv01 ix1764 (.Y (nx1763), .A (nx2482)) ;
    inv01 ix2477 (.Y (nx2476), .A (nx2105)) ;
    inv01 ix2471 (.Y (nx2470), .A (nx1765)) ;
    inv01 ix2417 (.Y (nx2416), .A (nx1939)) ;
    inv01 ix1932 (.Y (nx1931), .A (nx2410)) ;
    inv01 ix2407 (.Y (nx2406), .A (nx2023)) ;
    inv01 ix1916 (.Y (nx1915), .A (nx2402)) ;
    inv01 ix2399 (.Y (nx2398), .A (nx1997)) ;
    inv01 ix1900 (.Y (nx1899), .A (nx2394)) ;
    inv01 ix2391 (.Y (nx2390), .A (nx1971)) ;
    inv01 ix2339 (.Y (nx2338), .A (nx1923)) ;
    inv01 ix2335 (.Y (nx2334), .A (nx1907)) ;
    inv01 ix2331 (.Y (nx2330), .A (nx1867)) ;
    inv01 ix2279 (.Y (nx2278), .A (nx1843)) ;
    inv01 ix1836 (.Y (nx1835), .A (nx2272)) ;
    inv01 ix2269 (.Y (nx2268), .A (nx2019)) ;
    inv01 ix1822 (.Y (nx1821), .A (nx2264)) ;
    inv01 ix2261 (.Y (nx2260), .A (nx1993)) ;
    inv01 ix1808 (.Y (nx1807), .A (nx2256)) ;
    inv01 ix2253 (.Y (nx2252), .A (nx1967)) ;
    inv01 ix2201 (.Y (nx2200), .A (nx1829)) ;
    inv01 ix2197 (.Y (nx2196), .A (nx1815)) ;
    inv01 ix2193 (.Y (nx2192), .A (nx1775)) ;
    inv01 ix2410 (.Y (nx2409), .A (nx1928)) ;
    inv01 ix2464 (.Y (nx2463), .A (nx1926)) ;
    inv01 ix2428 (.Y (nx2427), .A (nx1924)) ;
    inv01 ix2400 (.Y (nx2399), .A (nx1920)) ;
    inv01 ix2458 (.Y (nx2457), .A (nx1918)) ;
    inv01 ix2384 (.Y (nx2383), .A (nx1916)) ;
    inv01 ix2466 (.Y (nx2465), .A (nx1914)) ;
    inv01 ix2430 (.Y (nx2429), .A (nx1912)) ;
    inv01 ix2374 (.Y (nx2373), .A (nx1908)) ;
    inv01 ix2452 (.Y (nx2451), .A (nx1906)) ;
    inv01 ix2358 (.Y (nx2357), .A (nx1904)) ;
    inv01 ix2468 (.Y (nx2467), .A (nx1902)) ;
    inv01 ix2432 (.Y (nx2431), .A (nx1900)) ;
    inv01 ix2348 (.Y (nx2347), .A (nx1896)) ;
    inv01 ix2446 (.Y (nx2445), .A (nx1894)) ;
    inv01 ix2332 (.Y (nx2331), .A (nx1892)) ;
    inv01 ix2470 (.Y (nx2469), .A (nx1890)) ;
    inv01 ix2434 (.Y (nx2433), .A (nx1888)) ;
    inv01 ix2324 (.Y (nx2323), .A (nx1884)) ;
    inv01 ix2440 (.Y (nx2439), .A (nx1878)) ;
    inv01 ix2146 (.Y (nx2145), .A (nx1872)) ;
    inv01 ix1867 (.Y (nx1866), .A (nx2473)) ;
    inv01 ix1861 (.Y (nx1860), .A (nx2147)) ;
    inv01 ix1807 (.Y (nx1806), .A (nx2307)) ;
    inv01 ix2300 (.Y (nx2299), .A (nx1800)) ;
    inv01 ix1797 (.Y (nx1796), .A (nx2391)) ;
    inv01 ix2286 (.Y (nx2285), .A (nx1792)) ;
    inv01 ix1789 (.Y (nx1788), .A (nx2365)) ;
    inv01 ix2272 (.Y (nx2271), .A (nx1784)) ;
    inv01 ix1781 (.Y (nx1780), .A (nx2339)) ;
    inv01 ix1729 (.Y (nx1728), .A (nx2293)) ;
    inv01 ix1725 (.Y (nx1724), .A (nx2279)) ;
    inv01 ix1721 (.Y (nx1720), .A (nx2243)) ;
    inv01 ix1669 (.Y (nx1668), .A (nx2221)) ;
    inv01 ix2214 (.Y (nx2213), .A (nx1662)) ;
    inv01 ix1659 (.Y (nx1658), .A (nx2387)) ;
    inv01 ix2200 (.Y (nx2199), .A (nx1654)) ;
    inv01 ix1651 (.Y (nx1650), .A (nx2361)) ;
    inv01 ix2186 (.Y (nx2185), .A (nx1646)) ;
    inv01 ix1643 (.Y (nx1642), .A (nx2335)) ;
    inv01 ix1591 (.Y (nx1590), .A (nx2207)) ;
    inv01 ix1587 (.Y (nx1586), .A (nx2193)) ;
    inv01 ix1583 (.Y (nx1582), .A (nx2157)) ;
    inv01 ix1433 (.Y (nx1432), .A (nx1635)) ;
    inv01 ix1381 (.Y (nx1380), .A (nx1667)) ;
    inv01 ix1329 (.Y (nx1328), .A (nx1699)) ;
    inv01 ix1277 (.Y (nx1276), .A (nx1731)) ;
    inv01 ix1288 (.Y (nx1287), .A (nx1002)) ;
    inv01 ix1176 (.Y (nx1175), .A (nx988)) ;
    inv01 ix1208 (.Y (nx1207), .A (nx986)) ;
    inv01 ix1180 (.Y (nx1179), .A (nx984)) ;
    inv01 ix1172 (.Y (nx1171), .A (nx980)) ;
    inv01 ix936 (.Y (nx935), .A (nx978)) ;
    inv01 ix1168 (.Y (nx1167), .A (nx976)) ;
    inv01 ix1210 (.Y (nx1209), .A (nx974)) ;
    inv01 ix1182 (.Y (nx1181), .A (nx972)) ;
    inv01 ix1164 (.Y (nx1163), .A (nx968)) ;
    inv01 ix924 (.Y (nx923), .A (nx966)) ;
    inv01 ix1160 (.Y (nx1159), .A (nx964)) ;
    inv01 ix1212 (.Y (nx1211), .A (nx962)) ;
    inv01 ix1184 (.Y (nx1183), .A (nx960)) ;
    inv01 ix1156 (.Y (nx1155), .A (nx956)) ;
    inv01 ix912 (.Y (nx911), .A (nx954)) ;
    inv01 ix1152 (.Y (nx1151), .A (nx952)) ;
    inv01 ix1214 (.Y (nx1213), .A (nx950)) ;
    inv01 ix1186 (.Y (nx1185), .A (nx948)) ;
    inv01 ix1148 (.Y (nx1147), .A (nx944)) ;
    inv01 ix902 (.Y (nx901), .A (nx938)) ;
    inv01 ix1142 (.Y (nx1141), .A (nx932)) ;
    inv01 ix927 (.Y (nx926), .A (nx1123)) ;
    inv01 ix921 (.Y (nx920), .A (nx1119)) ;
    inv01 ix867 (.Y (nx866), .A (nx961)) ;
    inv01 ix1002 (.Y (nx1001), .A (nx860)) ;
    inv01 ix857 (.Y (nx856), .A (nx987)) ;
    inv01 ix1048 (.Y (nx1047), .A (nx852)) ;
    inv01 ix849 (.Y (nx848), .A (nx1033)) ;
    inv01 ix1094 (.Y (nx1093), .A (nx844)) ;
    inv01 ix841 (.Y (nx840), .A (nx1079)) ;
    inv01 ix789 (.Y (nx788), .A (nx991)) ;
    inv01 ix785 (.Y (nx784), .A (nx1037)) ;
    inv01 ix781 (.Y (nx780), .A (nx1083)) ;
    inv01 ix729 (.Y (nx728), .A (nx881)) ;
    inv01 ix872 (.Y (nx871), .A (nx722)) ;
    inv01 ix719 (.Y (nx718), .A (nx931)) ;
    inv01 ix854 (.Y (nx853), .A (nx714)) ;
    inv01 ix711 (.Y (nx710), .A (nx919)) ;
    inv01 ix836 (.Y (nx835), .A (nx706)) ;
    inv01 ix703 (.Y (nx702), .A (nx907)) ;
    inv01 ix651 (.Y (nx650), .A (nx863)) ;
    inv01 ix647 (.Y (nx646), .A (nx845)) ;
    inv01 ix643 (.Y (nx642), .A (nx789)) ;
    inv01 ix1624 (.Y (nx1623), .A (nx378)) ;
    inv01 ix1632 (.Y (nx1631), .A (nx376)) ;
    inv01 ix1626 (.Y (nx1625), .A (nx374)) ;
    inv01 ix1642 (.Y (nx1641), .A (nx370)) ;
    inv01 ix1466 (.Y (nx1465), .A (nx368)) ;
    inv01 ix1656 (.Y (nx1655), .A (nx366)) ;
    inv01 ix1664 (.Y (nx1663), .A (nx364)) ;
    inv01 ix1658 (.Y (nx1657), .A (nx362)) ;
    inv01 ix1674 (.Y (nx1673), .A (nx358)) ;
    inv01 ix1454 (.Y (nx1453), .A (nx356)) ;
    inv01 ix1688 (.Y (nx1687), .A (nx354)) ;
    inv01 ix1696 (.Y (nx1695), .A (nx352)) ;
    inv01 ix1690 (.Y (nx1689), .A (nx350)) ;
    inv01 ix1706 (.Y (nx1705), .A (nx346)) ;
    inv01 ix1442 (.Y (nx1441), .A (nx344)) ;
    inv01 ix1720 (.Y (nx1719), .A (nx342)) ;
    inv01 ix1728 (.Y (nx1727), .A (nx340)) ;
    inv01 ix1722 (.Y (nx1721), .A (nx338)) ;
    inv01 ix1738 (.Y (nx1737), .A (nx334)) ;
    inv01 ix1432 (.Y (nx1431), .A (nx328)) ;
    inv01 ix1750 (.Y (nx1749), .A (nx322)) ;
    inv01 ix317 (.Y (nx316), .A (nx1607)) ;
    inv01 ix311 (.Y (nx310), .A (nx1603)) ;
    inv01 ix257 (.Y (nx256), .A (nx1319)) ;
    inv01 ix1508 (.Y (nx1507), .A (nx250)) ;
    inv01 ix247 (.Y (nx246), .A (nx1493)) ;
    inv01 ix1546 (.Y (nx1545), .A (nx242)) ;
    inv01 ix239 (.Y (nx238), .A (nx1533)) ;
    inv01 ix1584 (.Y (nx1583), .A (nx234)) ;
    inv01 ix231 (.Y (nx230), .A (nx1571)) ;
    inv01 ix179 (.Y (nx178), .A (nx1497)) ;
    inv01 ix175 (.Y (nx174), .A (nx1537)) ;
    inv01 ix171 (.Y (nx170), .A (nx1575)) ;
    inv01 ix119 (.Y (nx118), .A (nx1311)) ;
    inv01 ix1412 (.Y (nx1411), .A (nx112)) ;
    inv01 ix109 (.Y (nx108), .A (nx1461)) ;
    inv01 ix1394 (.Y (nx1393), .A (nx104)) ;
    inv01 ix101 (.Y (nx100), .A (nx1449)) ;
    inv01 ix1376 (.Y (nx1375), .A (nx96)) ;
    inv01 ix93 (.Y (nx92), .A (nx1437)) ;
    inv01 ix41 (.Y (nx40), .A (nx1403)) ;
    inv01 ix37 (.Y (nx36), .A (nx1385)) ;
    inv01 ix33 (.Y (nx32), .A (nx1341)) ;
    inv01 ix2984 (.Y (nx2983), .A (EDGE)) ;
    inv01 ix3011 (.Y (nx3013), .A (nx3064)) ;
    inv01 ix3018 (.Y (nx3019), .A (nx2811)) ;
    buf02 ix3022 (.Y (nx3023), .A (nx775)) ;
    buf02 ix3024 (.Y (nx3025), .A (nx775)) ;
    inv01 ix3026 (.Y (nx3027), .A (nx1135)) ;
    buf02 ix3042 (.Y (nx3043), .A (nx2477)) ;
    buf02 ix3044 (.Y (nx3045), .A (nx2477)) ;
    buf02 ix3046 (.Y (nx3047), .A (nx2525)) ;
    buf02 ix3048 (.Y (nx3049), .A (nx2525)) ;
    nor02ii ix693 (.Y (nx692), .A0 (nx889), .A1 (T12[7])) ;
    nor02ii ix831 (.Y (nx830), .A0 (nx1105), .A1 (T10[7])) ;
    and02 ix3445 (.Y (nx3444), .A0 (nx3069), .A1 (nx3064)) ;
    mux21 ix1302 (.Y (nx1301), .A0 (nx1474), .A1 (nx1480), .S0 (nx3056)) ;
    mux21_ni ix1334 (.Y (nx468), .A0 (nx310), .A1 (nx460), .S0 (nx322)) ;
    nor02ii ix83 (.Y (nx82), .A0 (nx1423), .A1 (T00[7])) ;
    nor02ii ix221 (.Y (nx220), .A0 (nx1593), .A1 (T22[7])) ;
    mux21 ix1459 (.Y (nx1458), .A0 (nx1627), .A1 (nx1619), .S0 (nx3056)) ;
    mux21 ix1636 (.Y (nx1635), .A0 (nx1422), .A1 (nx1428), .S0 (nx3056)) ;
    mux21 ix1407 (.Y (nx1406), .A0 (nx1659), .A1 (nx1651), .S0 (nx3056)) ;
    mux21 ix1668 (.Y (nx1667), .A0 (nx1370), .A1 (nx1376), .S0 (nx3056)) ;
    mux21 ix1355 (.Y (nx1354), .A0 (nx1691), .A1 (nx1683), .S0 (nx3058)) ;
    mux21 ix1700 (.Y (nx1699), .A0 (nx1318), .A1 (nx1324), .S0 (nx3058)) ;
    mux21 ix1303 (.Y (nx1302), .A0 (nx1723), .A1 (nx1715), .S0 (nx3058)) ;
    mux21 ix1732 (.Y (nx1731), .A0 (nx1266), .A1 (nx1272), .S0 (nx3058)) ;
    mux21 ix641 (.Y (nx640), .A0 (nx556), .A1 (nx634), .S0 (nx3058)) ;
    mux21 ix2801 (.Y (nx2800), .A0 (nx2716), .A1 (nx2794), .S0 (nx3060)) ;
    nor02ii ix2243 (.Y (nx2242), .A0 (nx1851), .A1 (T02[7])) ;
    nor02ii ix2381 (.Y (nx2380), .A0 (nx1945), .A1 (T20[7])) ;
    mux21_ni ix2112 (.Y (nx2628), .A0 (nx2470), .A1 (nx2620), .S0 (nx2482)) ;
    nor02ii ix1633 (.Y (nx1632), .A0 (nx2229), .A1 (T01[7])) ;
    nor02ii ix1771 (.Y (nx1770), .A0 (nx2313), .A1 (T21[7])) ;
    mux21 ix2514 (.Y (nx2513), .A0 (nx2804), .A1 (nx2810), .S0 (nx3060)) ;
    mux21 ix2841 (.Y (nx2840), .A0 (nx2535), .A1 (nx2533), .S0 (nx3060)) ;
    mux21 ix2540 (.Y (nx2539), .A0 (nx2856), .A1 (nx2862), .S0 (nx3060)) ;
    mux21 ix2893 (.Y (nx2892), .A0 (nx2551), .A1 (nx2549), .S0 (nx3060)) ;
    mux21 ix2556 (.Y (nx2555), .A0 (nx2908), .A1 (nx2914), .S0 (nx3062)) ;
    mux21 ix2945 (.Y (nx2944), .A0 (nx2567), .A1 (nx2565), .S0 (nx3062)) ;
    mux21 ix2572 (.Y (nx2571), .A0 (nx2960), .A1 (nx2966), .S0 (nx3062)) ;
    mux21 ix2997 (.Y (nx2996), .A0 (nx2583), .A1 (nx2581), .S0 (nx3062)) ;
    mux21 ix2588 (.Y (nx2587), .A0 (nx3012), .A1 (nx3018), .S0 (nx3062)) ;
    mux21 ix3319 (.Y (nx3318), .A0 (nx392), .A1 (nx1002), .S0 (nx3069)) ;
    mux21 ix3293 (.Y (nx3292), .A0 (nx1301), .A1 (nx1281), .S0 (nx3069)) ;
    mux21 ix2710 (.Y (nx2709), .A0 (nx1458), .A1 (nx1446), .S0 (nx3069)) ;
    mux21 ix3257 (.Y (nx3256), .A0 (nx1635), .A1 (nx1265), .S0 (nx3069)) ;
    mux21 ix2718 (.Y (nx2717), .A0 (nx1406), .A1 (nx1394), .S0 (nx3069)) ;
    mux21 ix3221 (.Y (nx3220), .A0 (nx1667), .A1 (nx1249), .S0 (nx3071)) ;
    mux21 ix2726 (.Y (nx2725), .A0 (nx1354), .A1 (nx1342), .S0 (nx3071)) ;
    mux21 ix3185 (.Y (nx3184), .A0 (nx1699), .A1 (nx1233), .S0 (nx3071)) ;
    mux21 ix2734 (.Y (nx2733), .A0 (nx1302), .A1 (nx1290), .S0 (nx3071)) ;
    mux21 ix3149 (.Y (nx3148), .A0 (nx1731), .A1 (nx1217), .S0 (nx3071)) ;
    or02 ix2758 (.Y (nx2757), .A0 (nx3071), .A1 (nx3402)) ;
    mux21 ix2782 (.Y (nx2781), .A0 (nx3140), .A1 (nx3148), .S0 (nx3064)) ;
    mux21 ix3427 (.Y (nx3426), .A0 (nx2667), .A1 (nx2733), .S0 (nx3064)) ;
    mux21 ix2792 (.Y (nx2791), .A0 (nx3176), .A1 (nx3184), .S0 (nx3064)) ;
    nor02ii ix3451 (.Y (nx3450), .A0 (nx3049), .A1 (nx3402)) ;
    mux21 ix3475 (.Y (nx3474), .A0 (nx2675), .A1 (nx2725), .S0 (nx3064)) ;
    mux21 ix2834 (.Y (nx2833), .A0 (nx3212), .A1 (nx3220), .S0 (nx3067)) ;
    mux21 ix3523 (.Y (nx3522), .A0 (nx2683), .A1 (nx2717), .S0 (nx3067)) ;
    mux21 ix2864 (.Y (nx2863), .A0 (nx3248), .A1 (nx3256), .S0 (nx3067)) ;
    mux21 ix3571 (.Y (nx3570), .A0 (nx2691), .A1 (nx2709), .S0 (nx3067)) ;
    mux21 ix2892 (.Y (nx2891), .A0 (nx3284), .A1 (nx3292), .S0 (nx3067)) ;
    mux21 ix2900 (.Y (nx2899), .A0 (nx3306), .A1 (nx3318), .S0 (nx3067)) ;
    nor02ii ix3865 (.Y (DIRECTION[1]), .A0 (nx2747), .A1 (EDGE)) ;
    and02 ix3020 (.Y (nx3021), .A0 (nx3027), .A1 (nx2747)) ;
    buf02 ix3055 (.Y (nx3056), .A (nx468)) ;
    buf02 ix3057 (.Y (nx3058), .A (nx468)) ;
    buf02 ix3059 (.Y (nx3060), .A (nx2628)) ;
    buf02 ix3061 (.Y (nx3062), .A (nx2628)) ;
    inv01 ix3063 (.Y (nx3064), .A (nx3402)) ;
    inv01 ix3065 (.Y (nx3067), .A (nx3402)) ;
    inv01 ix3068 (.Y (nx3069), .A (nx1135)) ;
    inv01 ix3070 (.Y (nx3071), .A (nx1135)) ;
endmodule

