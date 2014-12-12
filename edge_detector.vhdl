
-- 
-- Definition of  filter
-- 
--      Fri Dec 12 16:11:30 2014
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
   signal READY_dup0, O_VALID_dup0, EDGE_dup0, nx1586, fsm_inst_state_3, 
      fsm_inst_state_2, fsm_inst_state_0, nx8, nx12, nx18, nx56, nx70, nx78, 
      nx88, nx94, nx104, nx110, nx120, nx126, nx128, nx140, nx150, nx158, 
      nx166, nx174, nx182, nx192, nx220, nx234, nx242, nx252, nx258, nx268, 
      nx274, nx284, nx290, nx292, nx304, nx314, nx322, nx330, nx338, nx346, 
      nx356, nx360, nx368, nx374, nx380, nx392, nx398, nx400, nx408, nx410, 
      nx412, nx420, nx422, nx424, nx432, nx434, nx436, nx444, nx446, nx448, 
      nx456, nx458, nx460, nx472, nx480, nx482, nx484, nx510, nx518, nx526, 
      nx534, nx542, nx544, nx608, nx616, nx624, nx632, nx640, nx646, nx678, 
      nx692, nx700, nx710, nx716, nx726, nx732, nx742, nx748, nx750, nx762, 
      nx772, nx780, nx788, nx796, nx804, nx814, nx842, nx856, nx864, nx874, 
      nx880, nx890, nx896, nx906, nx912, nx914, nx926, nx936, nx944, nx952, 
      nx960, nx968, nx978, nx990, nx996, nx1002, nx1014, nx1020, nx1022, 
      nx1030, nx1032, nx1034, nx1042, nx1044, nx1046, nx1054, nx1056, nx1058, 
      nx1066, nx1068, nx1070, nx1078, nx1080, nx1082, nx1094, nx1102, nx1104, 
      nx1106, nx1132, nx1140, nx1148, nx1156, nx1164, nx1166, nx1230, nx1238, 
      nx1246, nx1254, nx1262, nx1268, nx1278, nx1284, nx1288, nx1290, nx1296, 
      nx1314, nx1326, nx1330, nx1336, nx1340, nx1342, nx1348, nx1366, nx1378, 
      nx1382, nx1388, nx1392, nx1394, nx1400, nx1418, nx1430, nx1434, nx1440, 
      nx1444, nx1446, nx1452, nx1470, nx1482, nx1486, nx1492, nx1498, nx1504, 
      nx1516, nx1534, nx1550, nx1566, nx1582, nx1598, nx1640, nx1654, nx1662, 
      nx1672, nx1678, nx1688, nx1694, nx1704, nx1710, nx1712, nx1724, nx1734, 
      nx1742, nx1750, nx1758, nx1766, nx1776, nx1804, nx1818, nx1826, nx1836, 
      nx1842, nx1852, nx1858, nx1868, nx1874, nx1876, nx1888, nx1898, nx1906, 
      nx1914, nx1922, nx1930, nx1940, nx1952, nx1958, nx1964, nx1976, nx1982, 
      nx1984, nx1992, nx1994, nx1996, nx2004, nx2006, nx2008, nx2016, nx2018, 
      nx2020, nx2028, nx2030, nx2032, nx2040, nx2042, nx2044, nx2056, nx2064, 
      nx2066, nx2068, nx2094, nx2102, nx2110, nx2118, nx2126, nx2128, nx2192, 
      nx2200, nx2208, nx2216, nx2224, nx2230, nx2262, nx2276, nx2284, nx2294, 
      nx2300, nx2310, nx2316, nx2326, nx2332, nx2334, nx2346, nx2356, nx2364, 
      nx2372, nx2380, nx2388, nx2398, nx2426, nx2440, nx2448, nx2458, nx2464, 
      nx2474, nx2480, nx2490, nx2496, nx2498, nx2510, nx2520, nx2528, nx2536, 
      nx2544, nx2552, nx2562, nx2574, nx2580, nx2586, nx2598, nx2604, nx2606, 
      nx2614, nx2616, nx2618, nx2626, nx2628, nx2630, nx2638, nx2640, nx2642, 
      nx2650, nx2652, nx2654, nx2662, nx2664, nx2666, nx2678, nx2686, nx2688, 
      nx2690, nx2716, nx2724, nx2732, nx2740, nx2748, nx2750, nx2814, nx2822, 
      nx2830, nx2838, nx2846, nx2852, nx2862, nx2868, nx2874, nx2880, nx2884, 
      nx2898, nx2910, nx2914, nx2920, nx2926, nx2932, nx2936, nx2950, nx2962, 
      nx2966, nx2972, nx2978, nx2984, nx2988, nx3002, nx3014, nx3018, nx3024, 
      nx3030, nx3036, nx3040, nx3054, nx3066, nx3070, nx3076, nx3082, nx3088, 
      nx3100, nx3118, nx3134, nx3150, nx3166, nx3182, nx3208, nx3216, nx3244, 
      nx3252, nx3280, nx3288, nx3316, nx3324, nx3352, nx3360, nx3370, nx3378, 
      nx3382, nx3398, nx3414, nx3430, nx3446, nx3462, nx3466, nx3472, nx3478, 
      nx3486, nx3490, nx3518, nx3520, nx3528, nx3530, nx3546, nx3574, nx3576, 
      nx3584, nx3586, nx3602, nx3630, nx3632, nx3640, nx3642, nx3658, nx3694, 
      nx3698, nx3702, nx3710, nx3718, nx3726, nx3734, nx3746, nx3754, nx3758, 
      nx3766, nx3774, nx3778, nx3782, nx3786, nx3790, nx3794, nx3798, nx3800, 
      nx3802, nx3820, nx3828, nx3836, nx3844, nx3852, nx3860, nx3868, nx3876, 
      nx3884, nx3904, nx1683, nx1691, nx1695, nx1699, nx1703, nx1709, nx1711, 
      nx1713, nx1715, nx1717, nx1719, nx1721, nx1723, nx1729, nx1731, nx1735, 
      nx1737, nx1741, nx1743, nx1747, nx1749, nx1753, nx1755, nx1761, nx1767, 
      nx1773, nx1779, nx1781, nx1783, nx1789, nx1791, nx1797, nx1799, nx1805, 
      nx1807, nx1813, nx1815, nx1817, nx1819, nx1827, nx1829, nx1833, nx1839, 
      nx1841, nx1847, nx1853, nx1855, nx1861, nx1869, nx1875, nx1877, nx1885, 
      nx1889, nx1891, nx1893, nx1901, nx1907, nx1909, nx1917, nx1921, nx1923, 
      nx1925, nx1933, nx1937, nx1943, nx1949, nx1951, nx1957, nx1969, nx1971, 
      nx1975, nx1977, nx1981, nx1983, nx1987, nx1991, nx1995, nx2001, nx2007, 
      nx2011, nx2013, nx2017, nx2023, nx2027, nx2029, nx2033, nx2039, nx2043, 
      nx2045, nx2049, nx2055, nx2059, nx2061, nx2065, nx2071, nx2075, nx2077, 
      nx2079, nx2081, nx2083, nx2085, nx2087, nx2089, nx2091, nx2101, nx2103, 
      nx2109, nx2111, nx2115, nx2123, nx2127, nx2131, nx2135, nx2139, nx2141, 
      nx2143, nx2145, nx2147, nx2149, nx2151, nx2153, nx2159, nx2161, nx2165, 
      nx2167, nx2171, nx2173, nx2177, nx2183, nx2189, nx2195, nx2201, nx2203, 
      nx2205, nx2211, nx2213, nx2219, nx2221, nx2227, nx2229, nx2235, nx2241, 
      nx2243, nx2249, nx2255, nx2257, nx2263, nx2271, nx2277, nx2279, nx2287, 
      nx2291, nx2293, nx2295, nx2303, nx2309, nx2311, nx2319, nx2323, nx2325, 
      nx2327, nx2335, nx2339, nx2345, nx2351, nx2353, nx2361, nx2365, nx2367, 
      nx2371, nx2373, nx2379, nx2381, nx2385, nx2387, nx2391, nx2393, nx2399, 
      nx2401, nx2403, nx2407, nx2409, nx2413, nx2415, nx2421, nx2423, nx2425, 
      nx2429, nx2431, nx2435, nx2437, nx2443, nx2445, nx2447, nx2465, nx2475, 
      nx2479, nx2483, nx2487, nx2491, nx2493, nx2495, nx2497, nx2499, nx2501, 
      nx2503, nx2505, nx2507, nx2513, nx2515, nx2519, nx2521, nx2525, nx2527, 
      nx2531, nx2533, nx2537, nx2539, nx2545, nx2551, nx2557, nx2563, nx2565, 
      nx2567, nx2573, nx2575, nx2579, nx2581, nx2587, nx2589, nx2595, nx2597, 
      nx2599, nx2601, nx2609, nx2611, nx2615, nx2621, nx2623, nx2629, nx2635, 
      nx2637, nx2641, nx2649, nx2655, nx2663, nx2667, nx2669, nx2671, nx2679, 
      nx2685, nx2693, nx2697, nx2699, nx2701, nx2709, nx2717, nx2723, nx2725, 
      nx2739, nx2741, nx2745, nx2747, nx2751, nx2753, nx2757, nx2761, nx2769, 
      nx2773, nx2777, nx2781, nx2787, nx2789, nx2791, nx2793, nx2795, nx2797, 
      nx2799, nx2805, nx2807, nx2811, nx2813, nx2817, nx2819, nx2823, nx2825, 
      nx2829, nx2831, nx2837, nx2843, nx2849, nx2855, nx2857, nx2859, nx2865, 
      nx2867, nx2873, nx2875, nx2879, nx2881, nx2887, nx2889, nx2891, nx2893, 
      nx2901, nx2903, nx2907, nx2913, nx2915, nx2919, nx2925, nx2927, nx2933, 
      nx2941, nx2945, nx2947, nx2955, nx2959, nx2961, nx2963, nx2971, nx2977, 
      nx2979, nx2985, nx2989, nx2991, nx2993, nx2999, nx3003, nx3009, nx3015, 
      nx3017, nx3031, nx3033, nx3037, nx3039, nx3043, nx3045, nx3049, nx3053, 
      nx3055, nx3059, nx3065, nx3071, nx3075, nx3081, nx3085, nx3089, nx3091, 
      nx3095, nx3101, nx3105, nx3107, nx3111, nx3117, nx3121, nx3123, nx3127, 
      nx3133, nx3137, nx3139, nx3143, nx3149, nx3153, nx3155, nx3157, nx3163, 
      nx3167, nx3169, nx3171, nx3173, nx3179, nx3183, nx3185, nx3187, nx3189, 
      nx3195, nx3199, nx3201, nx3203, nx3205, nx3211, nx3215, nx3217, nx3219, 
      nx3221, nx3225, nx3227, nx3231, nx3233, nx3239, nx3241, nx3247, nx3249, 
      nx3257, nx3261, nx3263, nx3267, nx3269, nx3271, nx3275, nx3277, nx3279, 
      nx3283, nx3285, nx3287, nx3291, nx3293, nx3295, nx3299, nx3301, nx3307, 
      nx3313, nx3319, nx3323, nx3327, nx3335, nx3357, nx3381, nx3405, nx3407, 
      nx3409, nx3429, nx3433, nx3435, nx3441, nx3461, nx3465, nx3467, nx3473, 
      nx3493, nx3497, nx3499, nx3505, nx3525, nx3537, nx3539, nx3543, nx3547, 
      nx3553, nx3555, nx3561, nx3563, nx3569, nx3571, nx3577, nx3579, nx3587, 
      nx3589, nx3595, nx3601, nx3607, nx3613, nx3619, nx3623, nx3627, nx3631, 
      nx3635, nx3641, nx3680, nx3686, nx3688, nx3690, nx3715, nx3717, nx3719, 
      nx3721, nx3727, nx3729, nx3731, nx3733, nx3735, nx3737, nx3739, nx3741
   : std_logic ;

begin
   READY <= READY_dup0 ;
   O_VALID <= O_VALID_dup0 ;
   EDGE <= EDGE_dup0 ;
   ix1676 : fake_vcc port map ( Y=>nx360);
   ix1587 : fake_gnd port map ( Y=>nx1586);
   ix3909 : nor02ii port map ( Y=>DIRECTION(0), A0=>nx1683, A1=>EDGE_dup0);
   ix1684 : aoi221 port map ( Y=>nx1683, A0=>nx3733, A1=>nx3688, B0=>nx3729, 
      B1=>nx3686, C0=>nx3904);
   ix2749 : mux21 port map ( Y=>nx2748, A0=>nx2574, A1=>nx1779, S0=>nx2586);
   ix1692 : nand02 port map ( Y=>nx1691, A0=>T12(7), A1=>nx2388);
   ix2389 : mux21 port map ( Y=>nx2388, A0=>nx1695, A1=>nx1721, S0=>nx1723);
   ix1696 : mux21 port map ( Y=>nx1695, A0=>nx2284, A1=>T02(6), S0=>nx1719);
   ix2285 : mux21 port map ( Y=>nx2284, A0=>nx1699, A1=>nx1715, S0=>nx1717);
   ix1700 : mux21 port map ( Y=>nx1699, A0=>nx2276, A1=>T02(4), S0=>nx1713);
   ix2277 : mux21 port map ( Y=>nx2276, A0=>nx1703, A1=>nx1709, S0=>nx1711);
   ix1704 : aoi32 port map ( Y=>nx1703, A0=>T12(0), A1=>T02(1), A2=>nx2262, 
      B0=>T02(2), B1=>T12(1));
   ix1710 : inv01 port map ( Y=>nx1709, A=>T02(3));
   ix1712 : xnor2 port map ( Y=>nx1711, A0=>T12(2), A1=>T02(3));
   ix1714 : xnor2 port map ( Y=>nx1713, A0=>T12(3), A1=>T02(4));
   ix1716 : inv01 port map ( Y=>nx1715, A=>T02(5));
   ix1718 : xnor2 port map ( Y=>nx1717, A0=>T12(4), A1=>T02(5));
   ix1720 : xnor2 port map ( Y=>nx1719, A0=>T12(5), A1=>T02(6));
   ix1722 : inv01 port map ( Y=>nx1721, A=>T02(7));
   ix1724 : xnor2 port map ( Y=>nx1723, A0=>T12(6), A1=>T02(7));
   ix2381 : mux21 port map ( Y=>nx2380, A0=>nx1729, A1=>nx1731, S0=>nx2294);
   ix1730 : xnor2 port map ( Y=>nx1729, A0=>nx1695, A1=>nx1723);
   ix1732 : mux21 port map ( Y=>nx1731, A0=>nx2372, A1=>nx2300, S0=>nx1773);
   ix2373 : mux21 port map ( Y=>nx2372, A0=>nx1735, A1=>nx1737, S0=>nx2310);
   ix1736 : xnor2 port map ( Y=>nx1735, A0=>nx1699, A1=>nx1717);
   ix1738 : mux21 port map ( Y=>nx1737, A0=>nx2364, A1=>nx2316, S0=>nx1767);
   ix2365 : mux21 port map ( Y=>nx2364, A0=>nx1741, A1=>nx1743, S0=>nx2326);
   ix1742 : xnor2 port map ( Y=>nx1741, A0=>nx1703, A1=>nx1711);
   ix1744 : aoi22 port map ( Y=>nx1743, A0=>nx2332, A1=>T22(2), B0=>nx2356, 
      B1=>nx2334);
   ix1748 : nand02 port map ( Y=>nx1747, A0=>T12(0), A1=>T02(1));
   ix1750 : xnor2 port map ( Y=>nx1749, A0=>T12(1), A1=>T02(2));
   ix2357 : mux21 port map ( Y=>nx2356, A0=>nx1753, A1=>nx1755, S0=>nx2346);
   ix1754 : oai21 port map ( Y=>nx1753, A0=>T02(1), A1=>T12(0), B0=>nx1747);
   ix1756 : nand02 port map ( Y=>nx1755, A0=>T22(0), A1=>T02(0));
   ix2347 : xnor2 port map ( Y=>nx2346, A0=>T22(1), A1=>nx1753);
   ix2335 : xnor2 port map ( Y=>nx2334, A0=>T22(2), A1=>nx1761);
   ix1762 : xnor2 port map ( Y=>nx1761, A0=>nx1747, A1=>nx1749);
   ix2327 : xnor2 port map ( Y=>nx2326, A0=>T22(3), A1=>nx1741);
   ix2317 : xnor2 port map ( Y=>nx2316, A0=>nx2276, A1=>nx1713);
   ix1768 : xnor2 port map ( Y=>nx1767, A0=>T22(4), A1=>nx2316);
   ix2311 : xnor2 port map ( Y=>nx2310, A0=>T22(5), A1=>nx1735);
   ix2301 : xnor2 port map ( Y=>nx2300, A0=>nx2284, A1=>nx1719);
   ix1774 : xnor2 port map ( Y=>nx1773, A0=>T22(6), A1=>nx2300);
   ix2295 : xnor2 port map ( Y=>nx2294, A0=>T22(7), A1=>nx1729);
   ix1780 : mux21 port map ( Y=>nx1779, A0=>nx1781, A1=>nx2740, S0=>nx2606);
   ix1784 : xnor2 port map ( Y=>nx1783, A0=>T12(7), A1=>nx2388);
   ix2741 : mux21 port map ( Y=>nx2740, A0=>nx2614, A1=>nx1789, S0=>nx2618);
   ix2615 : xnor2 port map ( Y=>nx2614, A0=>nx1731, A1=>nx2294);
   ix1790 : mux21 port map ( Y=>nx1789, A0=>nx1791, A1=>nx2732, S0=>nx2630);
   ix2733 : mux21 port map ( Y=>nx2732, A0=>nx2638, A1=>nx1797, S0=>nx2642);
   ix2639 : xnor2 port map ( Y=>nx2638, A0=>nx1737, A1=>nx2310);
   ix1798 : mux21 port map ( Y=>nx1797, A0=>nx1799, A1=>nx2724, S0=>nx2654);
   ix2725 : mux21 port map ( Y=>nx2724, A0=>nx2662, A1=>nx1805, S0=>nx2666);
   ix2663 : xnor2 port map ( Y=>nx2662, A0=>nx1743, A1=>nx2326);
   ix1806 : mux21 port map ( Y=>nx1805, A0=>nx1807, A1=>nx2716, S0=>nx2678);
   ix1808 : xnor2 port map ( Y=>nx1807, A0=>nx2356, A1=>nx2334);
   ix2717 : mux21 port map ( Y=>nx2716, A0=>nx2686, A1=>nx1813, S0=>nx2690);
   ix2687 : xnor2 port map ( Y=>nx2686, A0=>nx1755, A1=>nx2346);
   ix1814 : nor02ii port map ( Y=>nx1813, A0=>nx1815, A1=>nx1817);
   ix1816 : oai21 port map ( Y=>nx1815, A0=>T02(0), A1=>T22(0), B0=>nx1755);
   ix1818 : oai21 port map ( Y=>nx1817, A0=>T20(0), A1=>T00(0), B0=>nx1819);
   ix1820 : nand02 port map ( Y=>nx1819, A0=>T00(0), A1=>T20(0));
   ix2691 : xnor2 port map ( Y=>nx2690, A0=>nx2688, A1=>nx2686);
   ix2689 : xnor2 port map ( Y=>nx2688, A0=>nx1819, A1=>nx2510);
   ix2511 : xnor2 port map ( Y=>nx2510, A0=>T20(1), A1=>nx1827);
   ix1828 : oai21 port map ( Y=>nx1827, A0=>T10(0), A1=>T00(1), B0=>nx1829);
   ix1830 : nand02 port map ( Y=>nx1829, A0=>T00(1), A1=>T10(0));
   ix2679 : xnor2 port map ( Y=>nx2678, A0=>nx1833, A1=>nx1807);
   ix1834 : xnor2 port map ( Y=>nx1833, A0=>nx2520, A1=>nx2498);
   ix2521 : mux21 port map ( Y=>nx2520, A0=>nx1827, A1=>nx1819, S0=>nx2510);
   ix2499 : xnor2 port map ( Y=>nx2498, A0=>T20(2), A1=>nx1839);
   ix1840 : xnor2 port map ( Y=>nx1839, A0=>nx1829, A1=>nx1841);
   ix1842 : xnor2 port map ( Y=>nx1841, A0=>T00(2), A1=>T10(1));
   ix2667 : xnor2 port map ( Y=>nx2666, A0=>nx2664, A1=>nx2662);
   ix2665 : xnor2 port map ( Y=>nx2664, A0=>nx1847, A1=>nx2490);
   ix1848 : aoi22 port map ( Y=>nx1847, A0=>nx2496, A1=>T20(2), B0=>nx2520, 
      B1=>nx2498);
   ix2491 : xnor2 port map ( Y=>nx2490, A0=>T20(3), A1=>nx1853);
   ix1854 : xnor2 port map ( Y=>nx1853, A0=>nx1855, A1=>nx1861);
   ix1856 : aoi32 port map ( Y=>nx1855, A0=>T00(1), A1=>T10(0), A2=>nx2426, 
      B0=>T10(1), B1=>T00(2));
   ix1862 : xnor2 port map ( Y=>nx1861, A0=>T00(3), A1=>T10(2));
   ix2655 : xnor2 port map ( Y=>nx2654, A0=>nx2652, A1=>nx2650);
   ix2653 : xnor2 port map ( Y=>nx2652, A0=>nx2528, A1=>nx1869);
   ix2529 : mux21 port map ( Y=>nx2528, A0=>nx1853, A1=>nx1847, S0=>nx2490);
   ix1870 : xnor2 port map ( Y=>nx1869, A0=>T20(4), A1=>nx2480);
   ix2481 : xnor2 port map ( Y=>nx2480, A0=>nx2440, A1=>nx1877);
   ix2441 : mux21 port map ( Y=>nx2440, A0=>nx1855, A1=>nx1875, S0=>nx1861);
   ix1876 : inv01 port map ( Y=>nx1875, A=>T10(2));
   ix1878 : xnor2 port map ( Y=>nx1877, A0=>T00(4), A1=>T10(3));
   ix2651 : xnor2 port map ( Y=>nx2650, A0=>nx2364, A1=>nx1767);
   ix2643 : xnor2 port map ( Y=>nx2642, A0=>nx2640, A1=>nx2638);
   ix2641 : xnor2 port map ( Y=>nx2640, A0=>nx1885, A1=>nx2474);
   ix1886 : mux21 port map ( Y=>nx1885, A0=>nx2528, A1=>nx2480, S0=>nx1869);
   ix2475 : xnor2 port map ( Y=>nx2474, A0=>T20(5), A1=>nx1889);
   ix1890 : xnor2 port map ( Y=>nx1889, A0=>nx1891, A1=>nx1893);
   ix1892 : mux21 port map ( Y=>nx1891, A0=>nx2440, A1=>T10(3), S0=>nx1877);
   ix1894 : xnor2 port map ( Y=>nx1893, A0=>T00(5), A1=>T10(4));
   ix2631 : xnor2 port map ( Y=>nx2630, A0=>nx2628, A1=>nx2626);
   ix2629 : xnor2 port map ( Y=>nx2628, A0=>nx2536, A1=>nx1901);
   ix2537 : mux21 port map ( Y=>nx2536, A0=>nx1889, A1=>nx1885, S0=>nx2474);
   ix1902 : xnor2 port map ( Y=>nx1901, A0=>T20(6), A1=>nx2464);
   ix2465 : xnor2 port map ( Y=>nx2464, A0=>nx2448, A1=>nx1909);
   ix2449 : mux21 port map ( Y=>nx2448, A0=>nx1891, A1=>nx1907, S0=>nx1893);
   ix1908 : inv01 port map ( Y=>nx1907, A=>T10(4));
   ix1910 : xnor2 port map ( Y=>nx1909, A0=>T00(6), A1=>T10(5));
   ix2627 : xnor2 port map ( Y=>nx2626, A0=>nx2372, A1=>nx1773);
   ix2619 : xnor2 port map ( Y=>nx2618, A0=>nx2616, A1=>nx2614);
   ix2617 : xnor2 port map ( Y=>nx2616, A0=>nx1917, A1=>nx2458);
   ix1918 : mux21 port map ( Y=>nx1917, A0=>nx2536, A1=>nx2464, S0=>nx1901);
   ix2459 : xnor2 port map ( Y=>nx2458, A0=>T20(7), A1=>nx1921);
   ix1922 : xnor2 port map ( Y=>nx1921, A0=>nx1923, A1=>nx1925);
   ix1924 : mux21 port map ( Y=>nx1923, A0=>nx2448, A1=>T10(5), S0=>nx1909);
   ix1926 : xnor2 port map ( Y=>nx1925, A0=>T00(7), A1=>T10(6));
   ix2607 : xnor2 port map ( Y=>nx2606, A0=>nx2604, A1=>nx2598);
   ix2605 : xnor2 port map ( Y=>nx2604, A0=>nx2544, A1=>nx1933);
   ix2545 : mux21 port map ( Y=>nx2544, A0=>nx1921, A1=>nx1917, S0=>nx2458);
   ix1934 : xnor2 port map ( Y=>nx1933, A0=>T10(7), A1=>nx2552);
   ix2553 : mux21 port map ( Y=>nx2552, A0=>nx1923, A1=>nx1937, S0=>nx1925);
   ix1938 : inv01 port map ( Y=>nx1937, A=>T10(6));
   ix2599 : xnor2 port map ( Y=>nx2598, A0=>nx2380, A1=>nx1783);
   ix2587 : xnor2 port map ( Y=>nx2586, A0=>nx1943, A1=>nx1951);
   ix1946 : nor02ii port map ( Y=>nx1943, A0=>nx2562, A1=>nx1949);
   ix2563 : nor02ii port map ( Y=>nx2562, A0=>nx1933, A1=>nx2544);
   ix1950 : nand02 port map ( Y=>nx1949, A0=>T10(7), A1=>nx2552);
   ix1954 : nor02ii port map ( Y=>nx1951, A0=>nx2398, A1=>nx1691);
   ix2399 : nor02ii port map ( Y=>nx2398, A0=>nx1783, A1=>nx2380);
   ix1958 : mux21 port map ( Y=>nx1957, A0=>nx2852, A1=>nx3182, S0=>nx2447);
   ix2847 : mux21 port map ( Y=>nx2846, A0=>nx2580, A1=>nx1969, S0=>nx2586);
   ix1970 : mux21 port map ( Y=>nx1969, A0=>nx1971, A1=>nx2838, S0=>nx2606);
   ix2839 : mux21 port map ( Y=>nx2838, A0=>nx2616, A1=>nx1975, S0=>nx2618);
   ix1976 : mux21 port map ( Y=>nx1975, A0=>nx1977, A1=>nx2830, S0=>nx2630);
   ix2831 : mux21 port map ( Y=>nx2830, A0=>nx2640, A1=>nx1981, S0=>nx2642);
   ix1982 : mux21 port map ( Y=>nx1981, A0=>nx1983, A1=>nx2822, S0=>nx2654);
   ix2823 : mux21 port map ( Y=>nx2822, A0=>nx2664, A1=>nx1987, S0=>nx2666);
   ix1988 : mux21 port map ( Y=>nx1987, A0=>nx1833, A1=>nx2814, S0=>nx2678);
   ix2815 : mux21 port map ( Y=>nx2814, A0=>nx2688, A1=>nx1991, S0=>nx2690);
   ix1992 : nor02ii port map ( Y=>nx1991, A0=>nx1817, A1=>nx1815);
   ix3183 : mux21 port map ( Y=>nx3182, A0=>nx1995, A1=>nx2007, S0=>nx2435);
   ix2869 : xnor2 port map ( Y=>nx2868, A0=>nx1779, A1=>nx2586);
   ix2863 : xnor2 port map ( Y=>nx2862, A0=>nx1969, A1=>nx2586);
   ix2004 : nand02 port map ( Y=>nx2001, A0=>nx2748, A1=>nx360);
   ix2008 : mux21 port map ( Y=>nx2007, A0=>nx2898, A1=>nx3166, S0=>nx2425);
   ix2012 : xnor2 port map ( Y=>nx2011, A0=>nx2740, A1=>nx2606);
   ix2014 : xnor2 port map ( Y=>nx2013, A0=>nx2838, A1=>nx2606);
   ix3167 : mux21 port map ( Y=>nx3166, A0=>nx2017, A1=>nx2023, S0=>nx2413);
   ix2921 : xnor2 port map ( Y=>nx2920, A0=>nx1789, A1=>nx2618);
   ix2915 : xnor2 port map ( Y=>nx2914, A0=>nx1975, A1=>nx2618);
   ix2024 : mux21 port map ( Y=>nx2023, A0=>nx2950, A1=>nx3150, S0=>nx2403);
   ix2028 : xnor2 port map ( Y=>nx2027, A0=>nx2732, A1=>nx2630);
   ix2030 : xnor2 port map ( Y=>nx2029, A0=>nx2830, A1=>nx2630);
   ix3151 : mux21 port map ( Y=>nx3150, A0=>nx2033, A1=>nx2039, S0=>nx2391);
   ix2973 : xnor2 port map ( Y=>nx2972, A0=>nx1797, A1=>nx2642);
   ix2967 : xnor2 port map ( Y=>nx2966, A0=>nx1981, A1=>nx2642);
   ix2040 : mux21 port map ( Y=>nx2039, A0=>nx3002, A1=>nx3134, S0=>nx2381);
   ix2044 : xnor2 port map ( Y=>nx2043, A0=>nx2724, A1=>nx2654);
   ix2046 : xnor2 port map ( Y=>nx2045, A0=>nx2822, A1=>nx2654);
   ix3135 : mux21 port map ( Y=>nx3134, A0=>nx2049, A1=>nx2055, S0=>nx2371);
   ix3025 : xnor2 port map ( Y=>nx3024, A0=>nx1805, A1=>nx2666);
   ix3019 : xnor2 port map ( Y=>nx3018, A0=>nx1987, A1=>nx2666);
   ix2056 : mux21 port map ( Y=>nx2055, A0=>nx3054, A1=>nx3118, S0=>nx2361);
   ix2060 : xnor2 port map ( Y=>nx2059, A0=>nx2716, A1=>nx2678);
   ix2062 : xnor2 port map ( Y=>nx2061, A0=>nx2814, A1=>nx2678);
   ix3119 : mux21 port map ( Y=>nx3118, A0=>nx2065, A1=>nx2071, S0=>nx2089);
   ix3077 : xnor2 port map ( Y=>nx3076, A0=>nx1813, A1=>nx2690);
   ix3071 : xnor2 port map ( Y=>nx3070, A0=>nx1991, A1=>nx2690);
   ix2072 : nand02 port map ( Y=>nx2071, A0=>nx3100, A1=>nx2075);
   ix2076 : nor02 port map ( Y=>nx2075, A0=>nx2077, A1=>nx2087);
   ix2078 : nor02ii port map ( Y=>nx2077, A0=>nx2079, A1=>nx2083);
   ix2080 : oai21 port map ( Y=>nx2079, A0=>T12(0), A1=>T21(0), B0=>nx2081);
   ix2082 : nand02 port map ( Y=>nx2081, A0=>T21(0), A1=>T12(0));
   ix2084 : oai21 port map ( Y=>nx2083, A0=>T01(0), A1=>T10(0), B0=>nx2085);
   ix2086 : nand02 port map ( Y=>nx2085, A0=>T10(0), A1=>T01(0));
   ix2088 : nor02ii port map ( Y=>nx2087, A0=>nx2083, A1=>nx2079);
   ix2090 : xnor2 port map ( Y=>nx2089, A0=>nx2065, A1=>nx2091);
   ix3089 : xnor2 port map ( Y=>nx3088, A0=>nx2087, A1=>nx2068);
   ix2069 : xnor2 port map ( Y=>nx2068, A0=>nx2066, A1=>nx2064);
   ix2067 : xnor2 port map ( Y=>nx2066, A0=>nx2081, A1=>nx1888);
   ix1889 : xnor2 port map ( Y=>nx1888, A0=>T12(1), A1=>nx2101);
   ix2102 : oai21 port map ( Y=>nx2101, A0=>T21(1), A1=>T22(0), B0=>nx2103);
   ix2104 : nand02 port map ( Y=>nx2103, A0=>T22(0), A1=>T21(1));
   ix2065 : xnor2 port map ( Y=>nx2064, A0=>nx2085, A1=>nx1724);
   ix1725 : xnor2 port map ( Y=>nx1724, A0=>T01(1), A1=>nx2109);
   ix2110 : oai21 port map ( Y=>nx2109, A0=>T10(1), A1=>T00(0), B0=>nx2111);
   ix2112 : nand02 port map ( Y=>nx2111, A0=>T00(0), A1=>T10(1));
   ix3083 : xnor2 port map ( Y=>nx3082, A0=>nx2077, A1=>nx2068);
   ix2118 : nand02 port map ( Y=>nx2115, A0=>nx2126, A1=>nx360);
   ix2127 : mux21 port map ( Y=>nx2126, A0=>nx1952, A1=>nx2201, S0=>nx1964);
   ix2124 : nand02 port map ( Y=>nx2123, A0=>T00(7), A1=>nx1766);
   ix1767 : mux21 port map ( Y=>nx1766, A0=>nx2127, A1=>nx2151, S0=>nx2153);
   ix2128 : mux21 port map ( Y=>nx2127, A0=>nx1662, A1=>T10(6), S0=>nx2149);
   ix1663 : mux21 port map ( Y=>nx1662, A0=>nx2131, A1=>nx2145, S0=>nx2147);
   ix2132 : mux21 port map ( Y=>nx2131, A0=>nx1654, A1=>T10(4), S0=>nx2143);
   ix1655 : mux21 port map ( Y=>nx1654, A0=>nx2135, A1=>nx2139, S0=>nx2141);
   ix2136 : aoi32 port map ( Y=>nx2135, A0=>T00(0), A1=>T10(1), A2=>nx1640, 
      B0=>T10(2), B1=>T00(1));
   ix2140 : inv01 port map ( Y=>nx2139, A=>T10(3));
   ix2142 : xnor2 port map ( Y=>nx2141, A0=>T00(2), A1=>T10(3));
   ix2144 : xnor2 port map ( Y=>nx2143, A0=>T00(3), A1=>T10(4));
   ix2146 : inv01 port map ( Y=>nx2145, A=>T10(5));
   ix2148 : xnor2 port map ( Y=>nx2147, A0=>T00(4), A1=>T10(5));
   ix2150 : xnor2 port map ( Y=>nx2149, A0=>T00(5), A1=>T10(6));
   ix2152 : inv01 port map ( Y=>nx2151, A=>T10(7));
   ix2154 : xnor2 port map ( Y=>nx2153, A0=>T00(6), A1=>T10(7));
   ix1759 : mux21 port map ( Y=>nx1758, A0=>nx2159, A1=>nx2161, S0=>nx1672);
   ix2160 : xnor2 port map ( Y=>nx2159, A0=>nx2127, A1=>nx2153);
   ix2162 : mux21 port map ( Y=>nx2161, A0=>nx1750, A1=>nx1678, S0=>nx2195);
   ix1751 : mux21 port map ( Y=>nx1750, A0=>nx2165, A1=>nx2167, S0=>nx1688);
   ix2166 : xnor2 port map ( Y=>nx2165, A0=>nx2131, A1=>nx2147);
   ix2168 : mux21 port map ( Y=>nx2167, A0=>nx1742, A1=>nx1694, S0=>nx2189);
   ix1743 : mux21 port map ( Y=>nx1742, A0=>nx2171, A1=>nx2173, S0=>nx1704);
   ix2172 : xnor2 port map ( Y=>nx2171, A0=>nx2135, A1=>nx2141);
   ix2174 : aoi22 port map ( Y=>nx2173, A0=>nx1710, A1=>T01(2), B0=>nx1734, 
      B1=>nx1712);
   ix2178 : xnor2 port map ( Y=>nx2177, A0=>T00(1), A1=>T10(2));
   ix1735 : mux21 port map ( Y=>nx1734, A0=>nx2109, A1=>nx2085, S0=>nx1724);
   ix1713 : xnor2 port map ( Y=>nx1712, A0=>T01(2), A1=>nx2183);
   ix2184 : xnor2 port map ( Y=>nx2183, A0=>nx2111, A1=>nx2177);
   ix1705 : xnor2 port map ( Y=>nx1704, A0=>T01(3), A1=>nx2171);
   ix1695 : xnor2 port map ( Y=>nx1694, A0=>nx1654, A1=>nx2143);
   ix2190 : xnor2 port map ( Y=>nx2189, A0=>T01(4), A1=>nx1694);
   ix1689 : xnor2 port map ( Y=>nx1688, A0=>T01(5), A1=>nx2165);
   ix1679 : xnor2 port map ( Y=>nx1678, A0=>nx1662, A1=>nx2149);
   ix2196 : xnor2 port map ( Y=>nx2195, A0=>T01(6), A1=>nx1678);
   ix1673 : xnor2 port map ( Y=>nx1672, A0=>T01(7), A1=>nx2159);
   ix2202 : mux21 port map ( Y=>nx2201, A0=>nx2203, A1=>nx2118, S0=>nx1984);
   ix2206 : xnor2 port map ( Y=>nx2205, A0=>T00(7), A1=>nx1766);
   ix2119 : mux21 port map ( Y=>nx2118, A0=>nx1992, A1=>nx2211, S0=>nx1996);
   ix1993 : xnor2 port map ( Y=>nx1992, A0=>nx2161, A1=>nx1672);
   ix2212 : mux21 port map ( Y=>nx2211, A0=>nx2213, A1=>nx2110, S0=>nx2008);
   ix2111 : mux21 port map ( Y=>nx2110, A0=>nx2016, A1=>nx2219, S0=>nx2020);
   ix2017 : xnor2 port map ( Y=>nx2016, A0=>nx2167, A1=>nx1688);
   ix2220 : mux21 port map ( Y=>nx2219, A0=>nx2221, A1=>nx2102, S0=>nx2032);
   ix2103 : mux21 port map ( Y=>nx2102, A0=>nx2040, A1=>nx2227, S0=>nx2044);
   ix2041 : xnor2 port map ( Y=>nx2040, A0=>nx2173, A1=>nx1704);
   ix2228 : mux21 port map ( Y=>nx2227, A0=>nx2229, A1=>nx2094, S0=>nx2056);
   ix2230 : xnor2 port map ( Y=>nx2229, A0=>nx1734, A1=>nx1712);
   ix2095 : mux21 port map ( Y=>nx2094, A0=>nx2064, A1=>nx2087, S0=>nx2068);
   ix2057 : xnor2 port map ( Y=>nx2056, A0=>nx2235, A1=>nx2229);
   ix2236 : xnor2 port map ( Y=>nx2235, A0=>nx1898, A1=>nx1876);
   ix1899 : mux21 port map ( Y=>nx1898, A0=>nx2101, A1=>nx2081, S0=>nx1888);
   ix1877 : xnor2 port map ( Y=>nx1876, A0=>T12(2), A1=>nx2241);
   ix2242 : xnor2 port map ( Y=>nx2241, A0=>nx2103, A1=>nx2243);
   ix2244 : xnor2 port map ( Y=>nx2243, A0=>T22(1), A1=>T21(2));
   ix2045 : xnor2 port map ( Y=>nx2044, A0=>nx2042, A1=>nx2040);
   ix2043 : xnor2 port map ( Y=>nx2042, A0=>nx2249, A1=>nx1868);
   ix2250 : aoi22 port map ( Y=>nx2249, A0=>nx1874, A1=>T12(2), B0=>nx1898, 
      B1=>nx1876);
   ix1869 : xnor2 port map ( Y=>nx1868, A0=>T12(3), A1=>nx2255);
   ix2256 : xnor2 port map ( Y=>nx2255, A0=>nx2257, A1=>nx2263);
   ix2258 : aoi32 port map ( Y=>nx2257, A0=>T22(0), A1=>T21(1), A2=>nx1804, 
      B0=>T21(2), B1=>T22(1));
   ix2264 : xnor2 port map ( Y=>nx2263, A0=>T22(2), A1=>T21(3));
   ix2033 : xnor2 port map ( Y=>nx2032, A0=>nx2030, A1=>nx2028);
   ix2031 : xnor2 port map ( Y=>nx2030, A0=>nx1906, A1=>nx2271);
   ix1907 : mux21 port map ( Y=>nx1906, A0=>nx2255, A1=>nx2249, S0=>nx1868);
   ix2272 : xnor2 port map ( Y=>nx2271, A0=>T12(4), A1=>nx1858);
   ix1859 : xnor2 port map ( Y=>nx1858, A0=>nx1818, A1=>nx2279);
   ix1819 : mux21 port map ( Y=>nx1818, A0=>nx2257, A1=>nx2277, S0=>nx2263);
   ix2278 : inv01 port map ( Y=>nx2277, A=>T21(3));
   ix2280 : xnor2 port map ( Y=>nx2279, A0=>T22(3), A1=>T21(4));
   ix2029 : xnor2 port map ( Y=>nx2028, A0=>nx1742, A1=>nx2189);
   ix2021 : xnor2 port map ( Y=>nx2020, A0=>nx2018, A1=>nx2016);
   ix2019 : xnor2 port map ( Y=>nx2018, A0=>nx2287, A1=>nx1852);
   ix2288 : mux21 port map ( Y=>nx2287, A0=>nx1906, A1=>nx1858, S0=>nx2271);
   ix1853 : xnor2 port map ( Y=>nx1852, A0=>T12(5), A1=>nx2291);
   ix2292 : xnor2 port map ( Y=>nx2291, A0=>nx2293, A1=>nx2295);
   ix2294 : mux21 port map ( Y=>nx2293, A0=>nx1818, A1=>T21(4), S0=>nx2279);
   ix2296 : xnor2 port map ( Y=>nx2295, A0=>T22(4), A1=>T21(5));
   ix2009 : xnor2 port map ( Y=>nx2008, A0=>nx2006, A1=>nx2004);
   ix2007 : xnor2 port map ( Y=>nx2006, A0=>nx1914, A1=>nx2303);
   ix1915 : mux21 port map ( Y=>nx1914, A0=>nx2291, A1=>nx2287, S0=>nx1852);
   ix2304 : xnor2 port map ( Y=>nx2303, A0=>T12(6), A1=>nx1842);
   ix1843 : xnor2 port map ( Y=>nx1842, A0=>nx1826, A1=>nx2311);
   ix1827 : mux21 port map ( Y=>nx1826, A0=>nx2293, A1=>nx2309, S0=>nx2295);
   ix2310 : inv01 port map ( Y=>nx2309, A=>T21(5));
   ix2312 : xnor2 port map ( Y=>nx2311, A0=>T22(5), A1=>T21(6));
   ix2005 : xnor2 port map ( Y=>nx2004, A0=>nx1750, A1=>nx2195);
   ix1997 : xnor2 port map ( Y=>nx1996, A0=>nx1994, A1=>nx1992);
   ix1995 : xnor2 port map ( Y=>nx1994, A0=>nx2319, A1=>nx1836);
   ix2320 : mux21 port map ( Y=>nx2319, A0=>nx1914, A1=>nx1842, S0=>nx2303);
   ix1837 : xnor2 port map ( Y=>nx1836, A0=>T12(7), A1=>nx2323);
   ix2324 : xnor2 port map ( Y=>nx2323, A0=>nx2325, A1=>nx2327);
   ix2326 : mux21 port map ( Y=>nx2325, A0=>nx1826, A1=>T21(6), S0=>nx2311);
   ix2328 : xnor2 port map ( Y=>nx2327, A0=>T22(6), A1=>T21(7));
   ix1985 : xnor2 port map ( Y=>nx1984, A0=>nx1982, A1=>nx1976);
   ix1983 : xnor2 port map ( Y=>nx1982, A0=>nx1922, A1=>nx2335);
   ix1923 : mux21 port map ( Y=>nx1922, A0=>nx2323, A1=>nx2319, S0=>nx1836);
   ix2336 : xnor2 port map ( Y=>nx2335, A0=>T22(7), A1=>nx1930);
   ix1931 : mux21 port map ( Y=>nx1930, A0=>nx2325, A1=>nx2339, S0=>nx2327);
   ix2340 : inv01 port map ( Y=>nx2339, A=>T21(7));
   ix1977 : xnor2 port map ( Y=>nx1976, A0=>nx1758, A1=>nx2205);
   ix1965 : xnor2 port map ( Y=>nx1964, A0=>nx2345, A1=>nx2353);
   ix2348 : nor02ii port map ( Y=>nx2345, A0=>nx1940, A1=>nx2351);
   ix1941 : nor02ii port map ( Y=>nx1940, A0=>nx2335, A1=>nx1922);
   ix2352 : nand02 port map ( Y=>nx2351, A0=>T22(7), A1=>nx1930);
   ix2356 : nor02ii port map ( Y=>nx2353, A0=>nx1776, A1=>nx2123);
   ix1777 : nor02ii port map ( Y=>nx1776, A0=>nx2205, A1=>nx1758);
   ix2362 : xnor2 port map ( Y=>nx2361, A0=>nx3054, A1=>nx3066);
   ix2366 : xnor2 port map ( Y=>nx2365, A0=>nx2094, A1=>nx2056);
   ix2368 : xnor2 port map ( Y=>nx2367, A0=>nx2192, A1=>nx2056);
   ix2193 : mux21 port map ( Y=>nx2192, A0=>nx2066, A1=>nx2077, S0=>nx2068);
   ix2372 : xnor2 port map ( Y=>nx2371, A0=>nx2049, A1=>nx2373);
   ix3037 : xnor2 port map ( Y=>nx3036, A0=>nx2227, A1=>nx2044);
   ix3031 : xnor2 port map ( Y=>nx3030, A0=>nx2379, A1=>nx2044);
   ix2380 : mux21 port map ( Y=>nx2379, A0=>nx2235, A1=>nx2192, S0=>nx2056);
   ix2382 : xnor2 port map ( Y=>nx2381, A0=>nx3002, A1=>nx3014);
   ix2386 : xnor2 port map ( Y=>nx2385, A0=>nx2102, A1=>nx2032);
   ix2388 : xnor2 port map ( Y=>nx2387, A0=>nx2200, A1=>nx2032);
   ix2201 : mux21 port map ( Y=>nx2200, A0=>nx2042, A1=>nx2379, S0=>nx2044);
   ix2392 : xnor2 port map ( Y=>nx2391, A0=>nx2033, A1=>nx2393);
   ix2985 : xnor2 port map ( Y=>nx2984, A0=>nx2219, A1=>nx2020);
   ix2979 : xnor2 port map ( Y=>nx2978, A0=>nx2399, A1=>nx2020);
   ix2400 : mux21 port map ( Y=>nx2399, A0=>nx2401, A1=>nx2200, S0=>nx2032);
   ix2404 : xnor2 port map ( Y=>nx2403, A0=>nx2950, A1=>nx2962);
   ix2408 : xnor2 port map ( Y=>nx2407, A0=>nx2110, A1=>nx2008);
   ix2410 : xnor2 port map ( Y=>nx2409, A0=>nx2208, A1=>nx2008);
   ix2209 : mux21 port map ( Y=>nx2208, A0=>nx2018, A1=>nx2399, S0=>nx2020);
   ix2414 : xnor2 port map ( Y=>nx2413, A0=>nx2017, A1=>nx2415);
   ix2933 : xnor2 port map ( Y=>nx2932, A0=>nx2211, A1=>nx1996);
   ix2927 : xnor2 port map ( Y=>nx2926, A0=>nx2421, A1=>nx1996);
   ix2422 : mux21 port map ( Y=>nx2421, A0=>nx2423, A1=>nx2208, S0=>nx2008);
   ix2426 : xnor2 port map ( Y=>nx2425, A0=>nx2898, A1=>nx2910);
   ix2430 : xnor2 port map ( Y=>nx2429, A0=>nx2118, A1=>nx1984);
   ix2432 : xnor2 port map ( Y=>nx2431, A0=>nx2216, A1=>nx1984);
   ix2217 : mux21 port map ( Y=>nx2216, A0=>nx1994, A1=>nx2421, S0=>nx1996);
   ix2436 : xnor2 port map ( Y=>nx2435, A0=>nx1995, A1=>nx2437);
   ix2881 : xnor2 port map ( Y=>nx2880, A0=>nx2201, A1=>nx1964);
   ix2875 : xnor2 port map ( Y=>nx2874, A0=>nx2443, A1=>nx1964);
   ix2444 : mux21 port map ( Y=>nx2443, A0=>nx2445, A1=>nx2216, S0=>nx1984);
   ix2448 : xnor2 port map ( Y=>nx2447, A0=>nx2852, A1=>nx2230);
   ix2225 : mux21 port map ( Y=>nx2224, A0=>nx1958, A1=>nx2443, S0=>nx1964);
   ix3463 : mux21 port map ( Y=>nx3462, A0=>nx2465, A1=>nx3055, S0=>nx3299);
   ix2466 : nor02 port map ( Y=>nx2465, A0=>nx646, A1=>nx1268);
   ix543 : mux21 port map ( Y=>nx542, A0=>nx368, A1=>nx2563, S0=>nx380);
   ix2476 : nand02 port map ( Y=>nx2475, A0=>T02(7), A1=>nx182);
   ix183 : mux21 port map ( Y=>nx182, A0=>nx2479, A1=>nx2505, S0=>nx2507);
   ix2480 : mux21 port map ( Y=>nx2479, A0=>nx78, A1=>T01(6), S0=>nx2503);
   ix79 : mux21 port map ( Y=>nx78, A0=>nx2483, A1=>nx2499, S0=>nx2501);
   ix2484 : mux21 port map ( Y=>nx2483, A0=>nx70, A1=>T01(4), S0=>nx2497);
   ix71 : mux21 port map ( Y=>nx70, A0=>nx2487, A1=>nx2493, S0=>nx2495);
   ix2488 : aoi32 port map ( Y=>nx2487, A0=>T02(0), A1=>T01(1), A2=>nx56, B0
      =>T01(2), B1=>T02(1));
   ix2492 : inv01 port map ( Y=>nx2491, A=>T01(2));
   ix2494 : inv01 port map ( Y=>nx2493, A=>T01(3));
   ix2496 : xnor2 port map ( Y=>nx2495, A0=>T02(2), A1=>T01(3));
   ix2498 : xnor2 port map ( Y=>nx2497, A0=>T02(3), A1=>T01(4));
   ix2500 : inv01 port map ( Y=>nx2499, A=>T01(5));
   ix2502 : xnor2 port map ( Y=>nx2501, A0=>T02(4), A1=>T01(5));
   ix2504 : xnor2 port map ( Y=>nx2503, A0=>T02(5), A1=>T01(6));
   ix2506 : inv01 port map ( Y=>nx2505, A=>T01(7));
   ix2508 : xnor2 port map ( Y=>nx2507, A0=>T02(6), A1=>T01(7));
   ix175 : mux21 port map ( Y=>nx174, A0=>nx2513, A1=>nx2515, S0=>nx88);
   ix2514 : xnor2 port map ( Y=>nx2513, A0=>nx2479, A1=>nx2507);
   ix2516 : mux21 port map ( Y=>nx2515, A0=>nx166, A1=>nx94, S0=>nx2557);
   ix167 : mux21 port map ( Y=>nx166, A0=>nx2519, A1=>nx2521, S0=>nx104);
   ix2520 : xnor2 port map ( Y=>nx2519, A0=>nx2483, A1=>nx2501);
   ix2522 : mux21 port map ( Y=>nx2521, A0=>nx158, A1=>nx110, S0=>nx2551);
   ix159 : mux21 port map ( Y=>nx158, A0=>nx2525, A1=>nx2527, S0=>nx120);
   ix2526 : xnor2 port map ( Y=>nx2525, A0=>nx2487, A1=>nx2495);
   ix2528 : aoi22 port map ( Y=>nx2527, A0=>nx126, A1=>T12(2), B0=>nx150, B1
      =>nx128);
   ix2532 : nand02 port map ( Y=>nx2531, A0=>T02(0), A1=>T01(1));
   ix2534 : xnor2 port map ( Y=>nx2533, A0=>T02(1), A1=>T01(2));
   ix151 : mux21 port map ( Y=>nx150, A0=>nx2537, A1=>nx2539, S0=>nx140);
   ix2538 : oai21 port map ( Y=>nx2537, A0=>T01(1), A1=>T02(0), B0=>nx2531);
   ix2540 : nand02 port map ( Y=>nx2539, A0=>T12(0), A1=>T01(0));
   ix141 : xnor2 port map ( Y=>nx140, A0=>T12(1), A1=>nx2537);
   ix129 : xnor2 port map ( Y=>nx128, A0=>T12(2), A1=>nx2545);
   ix2546 : xnor2 port map ( Y=>nx2545, A0=>nx2531, A1=>nx2533);
   ix121 : xnor2 port map ( Y=>nx120, A0=>T12(3), A1=>nx2525);
   ix111 : xnor2 port map ( Y=>nx110, A0=>nx70, A1=>nx2497);
   ix2552 : xnor2 port map ( Y=>nx2551, A0=>T12(4), A1=>nx110);
   ix105 : xnor2 port map ( Y=>nx104, A0=>T12(5), A1=>nx2519);
   ix95 : xnor2 port map ( Y=>nx94, A0=>nx78, A1=>nx2503);
   ix2558 : xnor2 port map ( Y=>nx2557, A0=>T12(6), A1=>nx94);
   ix89 : xnor2 port map ( Y=>nx88, A0=>T12(7), A1=>nx2513);
   ix2564 : mux21 port map ( Y=>nx2563, A0=>nx2565, A1=>nx534, S0=>nx400);
   ix2568 : xnor2 port map ( Y=>nx2567, A0=>T02(7), A1=>nx182);
   ix535 : mux21 port map ( Y=>nx534, A0=>nx408, A1=>nx2573, S0=>nx412);
   ix409 : xnor2 port map ( Y=>nx408, A0=>nx2515, A1=>nx88);
   ix2574 : mux21 port map ( Y=>nx2573, A0=>nx2575, A1=>nx526, S0=>nx424);
   ix527 : mux21 port map ( Y=>nx526, A0=>nx432, A1=>nx2579, S0=>nx436);
   ix433 : xnor2 port map ( Y=>nx432, A0=>nx2521, A1=>nx104);
   ix2580 : mux21 port map ( Y=>nx2579, A0=>nx2581, A1=>nx518, S0=>nx448);
   ix519 : mux21 port map ( Y=>nx518, A0=>nx456, A1=>nx2587, S0=>nx460);
   ix457 : xnor2 port map ( Y=>nx456, A0=>nx2527, A1=>nx120);
   ix2588 : mux21 port map ( Y=>nx2587, A0=>nx2589, A1=>nx510, S0=>nx472);
   ix2590 : xnor2 port map ( Y=>nx2589, A0=>nx150, A1=>nx128);
   ix511 : mux21 port map ( Y=>nx510, A0=>nx480, A1=>nx2595, S0=>nx484);
   ix481 : xnor2 port map ( Y=>nx480, A0=>nx2539, A1=>nx140);
   ix2596 : nor02ii port map ( Y=>nx2595, A0=>nx2597, A1=>nx2599);
   ix2598 : oai21 port map ( Y=>nx2597, A0=>T01(0), A1=>T12(0), B0=>nx2539);
   ix2600 : oai21 port map ( Y=>nx2599, A0=>T10(0), A1=>T21(0), B0=>nx2601);
   ix2602 : nand02 port map ( Y=>nx2601, A0=>T21(0), A1=>T10(0));
   ix485 : xnor2 port map ( Y=>nx484, A0=>nx482, A1=>nx480);
   ix483 : xnor2 port map ( Y=>nx482, A0=>nx2601, A1=>nx304);
   ix305 : xnor2 port map ( Y=>nx304, A0=>T21(1), A1=>nx2609);
   ix2610 : oai21 port map ( Y=>nx2609, A0=>T10(1), A1=>T20(0), B0=>nx2611);
   ix2612 : nand02 port map ( Y=>nx2611, A0=>T20(0), A1=>T10(1));
   ix473 : xnor2 port map ( Y=>nx472, A0=>nx2615, A1=>nx2589);
   ix2616 : xnor2 port map ( Y=>nx2615, A0=>nx314, A1=>nx292);
   ix315 : mux21 port map ( Y=>nx314, A0=>nx2609, A1=>nx2601, S0=>nx304);
   ix293 : xnor2 port map ( Y=>nx292, A0=>T21(2), A1=>nx2621);
   ix2622 : xnor2 port map ( Y=>nx2621, A0=>nx2611, A1=>nx2623);
   ix2624 : xnor2 port map ( Y=>nx2623, A0=>T20(1), A1=>T10(2));
   ix461 : xnor2 port map ( Y=>nx460, A0=>nx458, A1=>nx456);
   ix459 : xnor2 port map ( Y=>nx458, A0=>nx2629, A1=>nx284);
   ix2630 : aoi22 port map ( Y=>nx2629, A0=>nx290, A1=>T21(2), B0=>nx314, B1
      =>nx292);
   ix285 : xnor2 port map ( Y=>nx284, A0=>T21(3), A1=>nx2635);
   ix2636 : xnor2 port map ( Y=>nx2635, A0=>nx2637, A1=>nx2641);
   ix2638 : aoi32 port map ( Y=>nx2637, A0=>T20(0), A1=>T10(1), A2=>nx220, 
      B0=>T10(2), B1=>T20(1));
   ix2642 : xnor2 port map ( Y=>nx2641, A0=>T20(2), A1=>T10(3));
   ix449 : xnor2 port map ( Y=>nx448, A0=>nx446, A1=>nx444);
   ix447 : xnor2 port map ( Y=>nx446, A0=>nx322, A1=>nx2649);
   ix323 : mux21 port map ( Y=>nx322, A0=>nx2635, A1=>nx2629, S0=>nx284);
   ix2650 : xnor2 port map ( Y=>nx2649, A0=>T21(4), A1=>nx274);
   ix275 : xnor2 port map ( Y=>nx274, A0=>nx234, A1=>nx2655);
   ix235 : mux21 port map ( Y=>nx234, A0=>nx2637, A1=>nx2139, S0=>nx2641);
   ix2656 : xnor2 port map ( Y=>nx2655, A0=>T20(3), A1=>T10(4));
   ix445 : xnor2 port map ( Y=>nx444, A0=>nx158, A1=>nx2551);
   ix437 : xnor2 port map ( Y=>nx436, A0=>nx434, A1=>nx432);
   ix435 : xnor2 port map ( Y=>nx434, A0=>nx2663, A1=>nx268);
   ix2664 : mux21 port map ( Y=>nx2663, A0=>nx322, A1=>nx274, S0=>nx2649);
   ix269 : xnor2 port map ( Y=>nx268, A0=>T21(5), A1=>nx2667);
   ix2668 : xnor2 port map ( Y=>nx2667, A0=>nx2669, A1=>nx2671);
   ix2670 : mux21 port map ( Y=>nx2669, A0=>nx234, A1=>T10(4), S0=>nx2655);
   ix2672 : xnor2 port map ( Y=>nx2671, A0=>T20(4), A1=>T10(5));
   ix425 : xnor2 port map ( Y=>nx424, A0=>nx422, A1=>nx420);
   ix423 : xnor2 port map ( Y=>nx422, A0=>nx330, A1=>nx2679);
   ix331 : mux21 port map ( Y=>nx330, A0=>nx2667, A1=>nx2663, S0=>nx268);
   ix2680 : xnor2 port map ( Y=>nx2679, A0=>T21(6), A1=>nx258);
   ix259 : xnor2 port map ( Y=>nx258, A0=>nx242, A1=>nx2685);
   ix243 : mux21 port map ( Y=>nx242, A0=>nx2669, A1=>nx2145, S0=>nx2671);
   ix2686 : xnor2 port map ( Y=>nx2685, A0=>T20(5), A1=>T10(6));
   ix421 : xnor2 port map ( Y=>nx420, A0=>nx166, A1=>nx2557);
   ix413 : xnor2 port map ( Y=>nx412, A0=>nx410, A1=>nx408);
   ix411 : xnor2 port map ( Y=>nx410, A0=>nx2693, A1=>nx252);
   ix2694 : mux21 port map ( Y=>nx2693, A0=>nx330, A1=>nx258, S0=>nx2679);
   ix253 : xnor2 port map ( Y=>nx252, A0=>T21(7), A1=>nx2697);
   ix2698 : xnor2 port map ( Y=>nx2697, A0=>nx2699, A1=>nx2701);
   ix2700 : mux21 port map ( Y=>nx2699, A0=>nx242, A1=>T10(6), S0=>nx2685);
   ix2702 : xnor2 port map ( Y=>nx2701, A0=>T20(6), A1=>T10(7));
   ix401 : xnor2 port map ( Y=>nx400, A0=>nx398, A1=>nx392);
   ix399 : xnor2 port map ( Y=>nx398, A0=>nx338, A1=>nx2709);
   ix339 : mux21 port map ( Y=>nx338, A0=>nx2697, A1=>nx2693, S0=>nx252);
   ix2710 : xnor2 port map ( Y=>nx2709, A0=>T20(7), A1=>nx346);
   ix347 : mux21 port map ( Y=>nx346, A0=>nx2699, A1=>nx2151, S0=>nx2701);
   ix393 : xnor2 port map ( Y=>nx392, A0=>nx174, A1=>nx2567);
   ix381 : xnor2 port map ( Y=>nx380, A0=>nx2717, A1=>nx2725);
   ix2720 : nor02ii port map ( Y=>nx2717, A0=>nx356, A1=>nx2723);
   ix357 : nor02ii port map ( Y=>nx356, A0=>nx2709, A1=>nx338);
   ix2724 : nand02 port map ( Y=>nx2723, A0=>T20(7), A1=>nx346);
   ix2728 : nor02ii port map ( Y=>nx2725, A0=>nx192, A1=>nx2475);
   ix193 : nor02ii port map ( Y=>nx192, A0=>nx2567, A1=>nx174);
   ix641 : mux21 port map ( Y=>nx640, A0=>nx374, A1=>nx2739, S0=>nx380);
   ix2740 : mux21 port map ( Y=>nx2739, A0=>nx2741, A1=>nx632, S0=>nx400);
   ix633 : mux21 port map ( Y=>nx632, A0=>nx410, A1=>nx2745, S0=>nx412);
   ix2746 : mux21 port map ( Y=>nx2745, A0=>nx2747, A1=>nx624, S0=>nx424);
   ix625 : mux21 port map ( Y=>nx624, A0=>nx434, A1=>nx2751, S0=>nx436);
   ix2752 : mux21 port map ( Y=>nx2751, A0=>nx2753, A1=>nx616, S0=>nx448);
   ix617 : mux21 port map ( Y=>nx616, A0=>nx458, A1=>nx2757, S0=>nx460);
   ix2758 : mux21 port map ( Y=>nx2757, A0=>nx2615, A1=>nx608, S0=>nx472);
   ix609 : mux21 port map ( Y=>nx608, A0=>nx482, A1=>nx2761, S0=>nx484);
   ix2762 : nor02ii port map ( Y=>nx2761, A0=>nx2599, A1=>nx2597);
   ix1165 : mux21 port map ( Y=>nx1164, A0=>nx990, A1=>nx2855, S0=>nx1002);
   ix2770 : nand02 port map ( Y=>nx2769, A0=>T01(7), A1=>nx804);
   ix805 : mux21 port map ( Y=>nx804, A0=>nx2773, A1=>nx2797, S0=>nx2799);
   ix2774 : mux21 port map ( Y=>nx2773, A0=>nx700, A1=>T01(5), S0=>nx2795);
   ix701 : mux21 port map ( Y=>nx700, A0=>nx2777, A1=>nx2791, S0=>nx2793);
   ix2778 : mux21 port map ( Y=>nx2777, A0=>nx692, A1=>T01(3), S0=>nx2789);
   ix693 : mux21 port map ( Y=>nx692, A0=>nx2781, A1=>nx2491, S0=>nx2787);
   ix2782 : aoi32 port map ( Y=>nx2781, A0=>T00(1), A1=>T01(0), A2=>nx678, 
      B0=>T01(1), B1=>T00(2));
   ix2788 : xnor2 port map ( Y=>nx2787, A0=>T00(3), A1=>T01(2));
   ix2790 : xnor2 port map ( Y=>nx2789, A0=>T00(4), A1=>T01(3));
   ix2792 : inv01 port map ( Y=>nx2791, A=>T01(4));
   ix2794 : xnor2 port map ( Y=>nx2793, A0=>T00(5), A1=>T01(4));
   ix2796 : xnor2 port map ( Y=>nx2795, A0=>T00(6), A1=>T01(5));
   ix2798 : inv01 port map ( Y=>nx2797, A=>T01(6));
   ix2800 : xnor2 port map ( Y=>nx2799, A0=>T00(7), A1=>T01(6));
   ix797 : mux21 port map ( Y=>nx796, A0=>nx2805, A1=>nx2807, S0=>nx710);
   ix2806 : xnor2 port map ( Y=>nx2805, A0=>nx2773, A1=>nx2799);
   ix2808 : mux21 port map ( Y=>nx2807, A0=>nx788, A1=>nx716, S0=>nx2849);
   ix789 : mux21 port map ( Y=>nx788, A0=>nx2811, A1=>nx2813, S0=>nx726);
   ix2812 : xnor2 port map ( Y=>nx2811, A0=>nx2777, A1=>nx2793);
   ix2814 : mux21 port map ( Y=>nx2813, A0=>nx780, A1=>nx732, S0=>nx2843);
   ix781 : mux21 port map ( Y=>nx780, A0=>nx2817, A1=>nx2819, S0=>nx742);
   ix2818 : xnor2 port map ( Y=>nx2817, A0=>nx2781, A1=>nx2787);
   ix2820 : aoi22 port map ( Y=>nx2819, A0=>nx748, A1=>T02(2), B0=>nx772, B1
      =>nx750);
   ix2824 : nand02 port map ( Y=>nx2823, A0=>T00(1), A1=>T01(0));
   ix2826 : xnor2 port map ( Y=>nx2825, A0=>T00(2), A1=>T01(1));
   ix773 : mux21 port map ( Y=>nx772, A0=>nx2829, A1=>nx2831, S0=>nx762);
   ix2830 : oai21 port map ( Y=>nx2829, A0=>T01(0), A1=>T00(1), B0=>nx2823);
   ix2832 : nand02 port map ( Y=>nx2831, A0=>T00(0), A1=>T02(0));
   ix763 : xnor2 port map ( Y=>nx762, A0=>T02(1), A1=>nx2829);
   ix751 : xnor2 port map ( Y=>nx750, A0=>T02(2), A1=>nx2837);
   ix2838 : xnor2 port map ( Y=>nx2837, A0=>nx2823, A1=>nx2825);
   ix743 : xnor2 port map ( Y=>nx742, A0=>T02(3), A1=>nx2817);
   ix733 : xnor2 port map ( Y=>nx732, A0=>nx692, A1=>nx2789);
   ix2844 : xnor2 port map ( Y=>nx2843, A0=>T02(4), A1=>nx732);
   ix727 : xnor2 port map ( Y=>nx726, A0=>T02(5), A1=>nx2811);
   ix717 : xnor2 port map ( Y=>nx716, A0=>nx700, A1=>nx2795);
   ix2850 : xnor2 port map ( Y=>nx2849, A0=>T02(6), A1=>nx716);
   ix711 : xnor2 port map ( Y=>nx710, A0=>T02(7), A1=>nx2805);
   ix2856 : mux21 port map ( Y=>nx2855, A0=>nx2857, A1=>nx1156, S0=>nx1022);
   ix2860 : xnor2 port map ( Y=>nx2859, A0=>T01(7), A1=>nx804);
   ix1157 : mux21 port map ( Y=>nx1156, A0=>nx1030, A1=>nx2865, S0=>nx1034);
   ix1031 : xnor2 port map ( Y=>nx1030, A0=>nx2807, A1=>nx710);
   ix2866 : mux21 port map ( Y=>nx2865, A0=>nx2867, A1=>nx1148, S0=>nx1046);
   ix1149 : mux21 port map ( Y=>nx1148, A0=>nx1054, A1=>nx2873, S0=>nx1058);
   ix1055 : xnor2 port map ( Y=>nx1054, A0=>nx2813, A1=>nx726);
   ix2874 : mux21 port map ( Y=>nx2873, A0=>nx2875, A1=>nx1140, S0=>nx1070);
   ix1141 : mux21 port map ( Y=>nx1140, A0=>nx1078, A1=>nx2879, S0=>nx1082);
   ix1079 : xnor2 port map ( Y=>nx1078, A0=>nx2819, A1=>nx742);
   ix2880 : mux21 port map ( Y=>nx2879, A0=>nx2881, A1=>nx1132, S0=>nx1094);
   ix2882 : xnor2 port map ( Y=>nx2881, A0=>nx772, A1=>nx750);
   ix1133 : mux21 port map ( Y=>nx1132, A0=>nx1102, A1=>nx2887, S0=>nx1106);
   ix1103 : xnor2 port map ( Y=>nx1102, A0=>nx2831, A1=>nx762);
   ix2888 : nor02ii port map ( Y=>nx2887, A0=>nx2889, A1=>nx2891);
   ix2890 : oai21 port map ( Y=>nx2889, A0=>T02(0), A1=>T00(0), B0=>nx2831);
   ix2892 : oai21 port map ( Y=>nx2891, A0=>T20(0), A1=>T22(0), B0=>nx2893);
   ix2894 : nand02 port map ( Y=>nx2893, A0=>T22(0), A1=>T20(0));
   ix1107 : xnor2 port map ( Y=>nx1106, A0=>nx1104, A1=>nx1102);
   ix1105 : xnor2 port map ( Y=>nx1104, A0=>nx2893, A1=>nx926);
   ix927 : xnor2 port map ( Y=>nx926, A0=>T22(1), A1=>nx2901);
   ix2902 : oai21 port map ( Y=>nx2901, A0=>T20(1), A1=>T21(0), B0=>nx2903);
   ix2904 : nand02 port map ( Y=>nx2903, A0=>T21(0), A1=>T20(1));
   ix1095 : xnor2 port map ( Y=>nx1094, A0=>nx2907, A1=>nx2881);
   ix2908 : xnor2 port map ( Y=>nx2907, A0=>nx936, A1=>nx914);
   ix937 : mux21 port map ( Y=>nx936, A0=>nx2901, A1=>nx2893, S0=>nx926);
   ix915 : xnor2 port map ( Y=>nx914, A0=>T22(2), A1=>nx2913);
   ix2914 : xnor2 port map ( Y=>nx2913, A0=>nx2903, A1=>nx2915);
   ix2916 : xnor2 port map ( Y=>nx2915, A0=>T21(1), A1=>T20(2));
   ix1083 : xnor2 port map ( Y=>nx1082, A0=>nx1080, A1=>nx1078);
   ix1081 : xnor2 port map ( Y=>nx1080, A0=>nx2919, A1=>nx906);
   ix2920 : aoi22 port map ( Y=>nx2919, A0=>nx912, A1=>T22(2), B0=>nx936, B1
      =>nx914);
   ix907 : xnor2 port map ( Y=>nx906, A0=>T22(3), A1=>nx2925);
   ix2926 : xnor2 port map ( Y=>nx2925, A0=>nx2927, A1=>nx2933);
   ix2928 : aoi32 port map ( Y=>nx2927, A0=>T21(0), A1=>T20(1), A2=>nx842, 
      B0=>T20(2), B1=>T21(1));
   ix2934 : xnor2 port map ( Y=>nx2933, A0=>T21(2), A1=>T20(3));
   ix1071 : xnor2 port map ( Y=>nx1070, A0=>nx1068, A1=>nx1066);
   ix1069 : xnor2 port map ( Y=>nx1068, A0=>nx944, A1=>nx2941);
   ix945 : mux21 port map ( Y=>nx944, A0=>nx2925, A1=>nx2919, S0=>nx906);
   ix2942 : xnor2 port map ( Y=>nx2941, A0=>T22(4), A1=>nx896);
   ix897 : xnor2 port map ( Y=>nx896, A0=>nx856, A1=>nx2947);
   ix857 : mux21 port map ( Y=>nx856, A0=>nx2927, A1=>nx2945, S0=>nx2933);
   ix2946 : inv01 port map ( Y=>nx2945, A=>T20(3));
   ix2948 : xnor2 port map ( Y=>nx2947, A0=>T21(3), A1=>T20(4));
   ix1067 : xnor2 port map ( Y=>nx1066, A0=>nx780, A1=>nx2843);
   ix1059 : xnor2 port map ( Y=>nx1058, A0=>nx1056, A1=>nx1054);
   ix1057 : xnor2 port map ( Y=>nx1056, A0=>nx2955, A1=>nx890);
   ix2956 : mux21 port map ( Y=>nx2955, A0=>nx944, A1=>nx896, S0=>nx2941);
   ix891 : xnor2 port map ( Y=>nx890, A0=>T22(5), A1=>nx2959);
   ix2960 : xnor2 port map ( Y=>nx2959, A0=>nx2961, A1=>nx2963);
   ix2962 : mux21 port map ( Y=>nx2961, A0=>nx856, A1=>T20(4), S0=>nx2947);
   ix2964 : xnor2 port map ( Y=>nx2963, A0=>T21(4), A1=>T20(5));
   ix1047 : xnor2 port map ( Y=>nx1046, A0=>nx1044, A1=>nx1042);
   ix1045 : xnor2 port map ( Y=>nx1044, A0=>nx952, A1=>nx2971);
   ix953 : mux21 port map ( Y=>nx952, A0=>nx2959, A1=>nx2955, S0=>nx890);
   ix2972 : xnor2 port map ( Y=>nx2971, A0=>T22(6), A1=>nx880);
   ix881 : xnor2 port map ( Y=>nx880, A0=>nx864, A1=>nx2979);
   ix865 : mux21 port map ( Y=>nx864, A0=>nx2961, A1=>nx2977, S0=>nx2963);
   ix2978 : inv01 port map ( Y=>nx2977, A=>T20(5));
   ix2980 : xnor2 port map ( Y=>nx2979, A0=>T21(5), A1=>T20(6));
   ix1043 : xnor2 port map ( Y=>nx1042, A0=>nx788, A1=>nx2849);
   ix1035 : xnor2 port map ( Y=>nx1034, A0=>nx1032, A1=>nx1030);
   ix1033 : xnor2 port map ( Y=>nx1032, A0=>nx2985, A1=>nx874);
   ix2986 : mux21 port map ( Y=>nx2985, A0=>nx952, A1=>nx880, S0=>nx2971);
   ix875 : xnor2 port map ( Y=>nx874, A0=>T22(7), A1=>nx2989);
   ix2990 : xnor2 port map ( Y=>nx2989, A0=>nx2991, A1=>nx2993);
   ix2992 : mux21 port map ( Y=>nx2991, A0=>nx864, A1=>T20(6), S0=>nx2979);
   ix2994 : xnor2 port map ( Y=>nx2993, A0=>T21(6), A1=>T20(7));
   ix1023 : xnor2 port map ( Y=>nx1022, A0=>nx1020, A1=>nx1014);
   ix1021 : xnor2 port map ( Y=>nx1020, A0=>nx960, A1=>nx2999);
   ix961 : mux21 port map ( Y=>nx960, A0=>nx2989, A1=>nx2985, S0=>nx874);
   ix3000 : xnor2 port map ( Y=>nx2999, A0=>T21(7), A1=>nx968);
   ix969 : mux21 port map ( Y=>nx968, A0=>nx2991, A1=>nx3003, S0=>nx2993);
   ix3004 : inv01 port map ( Y=>nx3003, A=>T20(7));
   ix1015 : xnor2 port map ( Y=>nx1014, A0=>nx796, A1=>nx2859);
   ix1003 : xnor2 port map ( Y=>nx1002, A0=>nx3009, A1=>nx3017);
   ix3012 : nor02ii port map ( Y=>nx3009, A0=>nx978, A1=>nx3015);
   ix979 : nor02ii port map ( Y=>nx978, A0=>nx2999, A1=>nx960);
   ix3016 : nand02 port map ( Y=>nx3015, A0=>T21(7), A1=>nx968);
   ix3020 : nor02ii port map ( Y=>nx3017, A0=>nx814, A1=>nx2769);
   ix815 : nor02ii port map ( Y=>nx814, A0=>nx2859, A1=>nx796);
   ix1263 : mux21 port map ( Y=>nx1262, A0=>nx996, A1=>nx3031, S0=>nx1002);
   ix3032 : mux21 port map ( Y=>nx3031, A0=>nx3033, A1=>nx1254, S0=>nx1022);
   ix1255 : mux21 port map ( Y=>nx1254, A0=>nx1032, A1=>nx3037, S0=>nx1034);
   ix3038 : mux21 port map ( Y=>nx3037, A0=>nx3039, A1=>nx1246, S0=>nx1046);
   ix1247 : mux21 port map ( Y=>nx1246, A0=>nx1056, A1=>nx3043, S0=>nx1058);
   ix3044 : mux21 port map ( Y=>nx3043, A0=>nx3045, A1=>nx1238, S0=>nx1070);
   ix1239 : mux21 port map ( Y=>nx1238, A0=>nx1080, A1=>nx3049, S0=>nx1082);
   ix3050 : mux21 port map ( Y=>nx3049, A0=>nx2907, A1=>nx1230, S0=>nx1094);
   ix1231 : mux21 port map ( Y=>nx1230, A0=>nx1104, A1=>nx3053, S0=>nx1106);
   ix3054 : nor02ii port map ( Y=>nx3053, A0=>nx2891, A1=>nx2889);
   ix3056 : mux21 port map ( Y=>nx3055, A0=>nx3208, A1=>nx3446, S0=>nx3295);
   ix3209 : mux21 port map ( Y=>nx3208, A0=>nx3059, A1=>nx3071, S0=>nx3715);
   ix1285 : xnor2 port map ( Y=>nx1284, A0=>nx2563, A1=>nx380);
   ix1279 : xnor2 port map ( Y=>nx1278, A0=>nx2739, A1=>nx380);
   ix3068 : nand02 port map ( Y=>nx3065, A0=>nx542, A1=>nx360);
   ix1297 : xnor2 port map ( Y=>nx1296, A0=>nx2855, A1=>nx1002);
   ix1291 : xnor2 port map ( Y=>nx1290, A0=>nx3031, A1=>nx1002);
   ix3078 : nand02 port map ( Y=>nx3075, A0=>nx1164, A1=>nx360);
   ix3082 : mux21 port map ( Y=>nx3081, A0=>nx646, A1=>nx1598, S0=>nx3221);
   ix1599 : mux21 port map ( Y=>nx1598, A0=>nx3059, A1=>nx3085, S0=>nx3219);
   ix3086 : mux21 port map ( Y=>nx3085, A0=>nx1314, A1=>nx1582, S0=>nx3211);
   ix3090 : xnor2 port map ( Y=>nx3089, A0=>nx534, A1=>nx400);
   ix3092 : xnor2 port map ( Y=>nx3091, A0=>nx632, A1=>nx400);
   ix1583 : mux21 port map ( Y=>nx1582, A0=>nx3095, A1=>nx3101, S0=>nx3203);
   ix1337 : xnor2 port map ( Y=>nx1336, A0=>nx2573, A1=>nx412);
   ix1331 : xnor2 port map ( Y=>nx1330, A0=>nx2745, A1=>nx412);
   ix3102 : mux21 port map ( Y=>nx3101, A0=>nx1366, A1=>nx1566, S0=>nx3195);
   ix3106 : xnor2 port map ( Y=>nx3105, A0=>nx526, A1=>nx424);
   ix3108 : xnor2 port map ( Y=>nx3107, A0=>nx624, A1=>nx424);
   ix1567 : mux21 port map ( Y=>nx1566, A0=>nx3111, A1=>nx3117, S0=>nx3187);
   ix1389 : xnor2 port map ( Y=>nx1388, A0=>nx2579, A1=>nx436);
   ix1383 : xnor2 port map ( Y=>nx1382, A0=>nx2751, A1=>nx436);
   ix3118 : mux21 port map ( Y=>nx3117, A0=>nx1418, A1=>nx1550, S0=>nx3179);
   ix3122 : xnor2 port map ( Y=>nx3121, A0=>nx518, A1=>nx448);
   ix3124 : xnor2 port map ( Y=>nx3123, A0=>nx616, A1=>nx448);
   ix1551 : mux21 port map ( Y=>nx1550, A0=>nx3127, A1=>nx3133, S0=>nx3171);
   ix1441 : xnor2 port map ( Y=>nx1440, A0=>nx2587, A1=>nx460);
   ix1435 : xnor2 port map ( Y=>nx1434, A0=>nx2757, A1=>nx460);
   ix3134 : mux21 port map ( Y=>nx3133, A0=>nx1470, A1=>nx1534, S0=>nx3163);
   ix3138 : xnor2 port map ( Y=>nx3137, A0=>nx510, A1=>nx472);
   ix3140 : xnor2 port map ( Y=>nx3139, A0=>nx608, A1=>nx472);
   ix1535 : mux21 port map ( Y=>nx1534, A0=>nx3143, A1=>nx3149, S0=>nx3155);
   ix1493 : xnor2 port map ( Y=>nx1492, A0=>nx2595, A1=>nx484);
   ix1487 : xnor2 port map ( Y=>nx1486, A0=>nx2761, A1=>nx484);
   ix3150 : nand02 port map ( Y=>nx3149, A0=>nx1516, A1=>nx3153);
   ix3154 : nor02 port map ( Y=>nx3153, A0=>nx3053, A1=>nx2887);
   ix3156 : xnor2 port map ( Y=>nx3155, A0=>nx3143, A1=>nx3157);
   ix1505 : xnor2 port map ( Y=>nx1504, A0=>nx2887, A1=>nx1106);
   ix1499 : xnor2 port map ( Y=>nx1498, A0=>nx3053, A1=>nx1106);
   ix3164 : xnor2 port map ( Y=>nx3163, A0=>nx1470, A1=>nx1482);
   ix3168 : xnor2 port map ( Y=>nx3167, A0=>nx1132, A1=>nx1094);
   ix3170 : xnor2 port map ( Y=>nx3169, A0=>nx1230, A1=>nx1094);
   ix3172 : xnor2 port map ( Y=>nx3171, A0=>nx3127, A1=>nx3173);
   ix1453 : xnor2 port map ( Y=>nx1452, A0=>nx2879, A1=>nx1082);
   ix1447 : xnor2 port map ( Y=>nx1446, A0=>nx3049, A1=>nx1082);
   ix3180 : xnor2 port map ( Y=>nx3179, A0=>nx1418, A1=>nx1430);
   ix3184 : xnor2 port map ( Y=>nx3183, A0=>nx1140, A1=>nx1070);
   ix3186 : xnor2 port map ( Y=>nx3185, A0=>nx1238, A1=>nx1070);
   ix3188 : xnor2 port map ( Y=>nx3187, A0=>nx3111, A1=>nx3189);
   ix1401 : xnor2 port map ( Y=>nx1400, A0=>nx2873, A1=>nx1058);
   ix1395 : xnor2 port map ( Y=>nx1394, A0=>nx3043, A1=>nx1058);
   ix3196 : xnor2 port map ( Y=>nx3195, A0=>nx1366, A1=>nx1378);
   ix3200 : xnor2 port map ( Y=>nx3199, A0=>nx1148, A1=>nx1046);
   ix3202 : xnor2 port map ( Y=>nx3201, A0=>nx1246, A1=>nx1046);
   ix3204 : xnor2 port map ( Y=>nx3203, A0=>nx3095, A1=>nx3205);
   ix1349 : xnor2 port map ( Y=>nx1348, A0=>nx2865, A1=>nx1034);
   ix1343 : xnor2 port map ( Y=>nx1342, A0=>nx3037, A1=>nx1034);
   ix3212 : xnor2 port map ( Y=>nx3211, A0=>nx1314, A1=>nx1326);
   ix3216 : xnor2 port map ( Y=>nx3215, A0=>nx1156, A1=>nx1022);
   ix3218 : xnor2 port map ( Y=>nx3217, A0=>nx1254, A1=>nx1022);
   ix3220 : xnor2 port map ( Y=>nx3219, A0=>nx3059, A1=>nx3071);
   ix3222 : xnor2 port map ( Y=>nx3221, A0=>nx646, A1=>nx1268);
   ix3447 : mux21 port map ( Y=>nx3446, A0=>nx3225, A1=>nx3227, S0=>nx3291);
   ix3226 : mux21 port map ( Y=>nx3225, A0=>nx1314, A1=>nx1326, S0=>nx3715);
   ix3228 : mux21 port map ( Y=>nx3227, A0=>nx3244, A1=>nx3430, S0=>nx3287);
   ix3245 : mux21 port map ( Y=>nx3244, A0=>nx3095, A1=>nx3205, S0=>nx3715);
   ix3431 : mux21 port map ( Y=>nx3430, A0=>nx3231, A1=>nx3233, S0=>nx3283);
   ix3232 : mux21 port map ( Y=>nx3231, A0=>nx1366, A1=>nx1378, S0=>nx3715);
   ix3234 : mux21 port map ( Y=>nx3233, A0=>nx3280, A1=>nx3414, S0=>nx3279);
   ix3281 : mux21 port map ( Y=>nx3280, A0=>nx3111, A1=>nx3189, S0=>nx3715);
   ix3415 : mux21 port map ( Y=>nx3414, A0=>nx3239, A1=>nx3241, S0=>nx3275);
   ix3240 : mux21 port map ( Y=>nx3239, A0=>nx1418, A1=>nx1430, S0=>nx3715);
   ix3242 : mux21 port map ( Y=>nx3241, A0=>nx3316, A1=>nx3398, S0=>nx3271);
   ix3317 : mux21 port map ( Y=>nx3316, A0=>nx3127, A1=>nx3173, S0=>nx3717);
   ix3399 : mux21 port map ( Y=>nx3398, A0=>nx3247, A1=>nx3249, S0=>nx3267);
   ix3248 : mux21 port map ( Y=>nx3247, A0=>nx1470, A1=>nx1482, S0=>nx3717);
   ix3250 : mux21 port map ( Y=>nx3249, A0=>nx3352, A1=>nx3382, S0=>nx3263);
   ix3353 : mux21 port map ( Y=>nx3352, A0=>nx3143, A1=>nx3157, S0=>nx3717);
   ix3383 : nor02ii port map ( Y=>nx3382, A0=>nx3378, A1=>nx3370);
   ix3258 : nor02 port map ( Y=>nx3257, A0=>nx1991, A1=>nx1813);
   ix3371 : mux21 port map ( Y=>nx3370, A0=>nx3261, A1=>nx3153, S0=>nx3717);
   ix3262 : nor02 port map ( Y=>nx3261, A0=>nx2761, A1=>nx2595);
   ix3264 : xnor2 port map ( Y=>nx3263, A0=>nx3352, A1=>nx3360);
   ix3268 : xnor2 port map ( Y=>nx3267, A0=>nx3247, A1=>nx3269);
   ix3272 : xnor2 port map ( Y=>nx3271, A0=>nx3316, A1=>nx3324);
   ix3276 : xnor2 port map ( Y=>nx3275, A0=>nx3239, A1=>nx3277);
   ix3280 : xnor2 port map ( Y=>nx3279, A0=>nx3280, A1=>nx3288);
   ix3284 : xnor2 port map ( Y=>nx3283, A0=>nx3231, A1=>nx3285);
   ix3288 : xnor2 port map ( Y=>nx3287, A0=>nx3244, A1=>nx3252);
   ix3292 : xnor2 port map ( Y=>nx3291, A0=>nx3225, A1=>nx3293);
   ix3296 : xnor2 port map ( Y=>nx3295, A0=>nx3208, A1=>nx3216);
   ix3300 : xnor2 port map ( Y=>nx3299, A0=>nx2465, A1=>nx3301);
   ix3302 : nor02 port map ( Y=>nx3301, A0=>nx2852, A1=>nx2230);
   ix3893 : oai22 port map ( Y=>EDGE_dup0, A0=>nx3758, A1=>nx3547, B0=>
      nx3319, B1=>THRESHOLD(10));
   ix3759 : xnor2 port map ( Y=>nx3758, A0=>nx3319, A1=>THRESHOLD(10));
   ix3320 : xnor2 port map ( Y=>nx3319, A0=>nx3746, A1=>nx3754);
   ix3747 : nor02 port map ( Y=>nx3746, A0=>nx3323, A1=>nx3543);
   ix3324 : nand02 port map ( Y=>nx3323, A0=>nx3726, A1=>nx3734);
   ix3727 : mux21 port map ( Y=>nx3726, A0=>nx3327, A1=>nx3525, S0=>nx3537);
   ix3328 : mux21 port map ( Y=>nx3327, A0=>nx3520, A1=>nx3718, S0=>nx3530);
   ix3336 : nand02 port map ( Y=>nx3335, A0=>nx3717, A1=>nx3680);
   ix3719 : mux21 port map ( Y=>nx3718, A0=>nx3357, A1=>nx3493, S0=>nx3497);
   ix3358 : mux21 port map ( Y=>nx3357, A0=>nx3576, A1=>nx3710, S0=>nx3586);
   ix3711 : mux21 port map ( Y=>nx3710, A0=>nx3381, A1=>nx3461, S0=>nx3465);
   ix3382 : mux21 port map ( Y=>nx3381, A0=>nx3632, A1=>nx3702, S0=>nx3642);
   ix3703 : mux21 port map ( Y=>nx3702, A0=>nx3405, A1=>nx3429, S0=>nx3433);
   ix3410 : aoi221 port map ( Y=>nx3409, A0=>nx3040, A1=>nx3688, B0=>nx1444, 
      B1=>nx3686, C0=>nx3694);
   ix3695 : oai22 port map ( Y=>nx3694, A0=>nx2049, A1=>nx3719, B0=>nx3173, 
      B1=>nx3313);
   ix3430 : aoi221 port map ( Y=>nx3429, A0=>nx3014, A1=>nx3688, B0=>nx1418, 
      B1=>nx3686, C0=>nx3658);
   ix3659 : ao22 port map ( Y=>nx3658, A0=>nx3002, A1=>nx3486, B0=>nx1430, 
      B1=>nx3478);
   ix3434 : xnor2 port map ( Y=>nx3433, A0=>nx3435, A1=>nx3429);
   ix3643 : xnor2 port map ( Y=>nx3642, A0=>nx3640, A1=>nx3441);
   ix3442 : aoi221 port map ( Y=>nx3441, A0=>nx2988, A1=>nx3688, B0=>nx1392, 
      B1=>nx3686, C0=>nx3630);
   ix3631 : oai22 port map ( Y=>nx3630, A0=>nx2033, A1=>nx3719, B0=>nx3189, 
      B1=>nx3313);
   ix3462 : aoi221 port map ( Y=>nx3461, A0=>nx2962, A1=>nx3688, B0=>nx1366, 
      B1=>nx3686, C0=>nx3602);
   ix3603 : ao22 port map ( Y=>nx3602, A0=>nx2950, A1=>nx3486, B0=>nx1378, 
      B1=>nx3478);
   ix3466 : xnor2 port map ( Y=>nx3465, A0=>nx3467, A1=>nx3461);
   ix3587 : xnor2 port map ( Y=>nx3586, A0=>nx3584, A1=>nx3473);
   ix3474 : aoi221 port map ( Y=>nx3473, A0=>nx2936, A1=>nx3688, B0=>nx1340, 
      B1=>nx3686, C0=>nx3574);
   ix3575 : oai22 port map ( Y=>nx3574, A0=>nx2017, A1=>nx3719, B0=>nx3205, 
      B1=>nx3313);
   ix3494 : aoi221 port map ( Y=>nx3493, A0=>nx2910, A1=>nx3472, B0=>nx1314, 
      B1=>nx3466, C0=>nx3546);
   ix3547 : ao22 port map ( Y=>nx3546, A0=>nx2898, A1=>nx3486, B0=>nx1326, 
      B1=>nx3478);
   ix3498 : xnor2 port map ( Y=>nx3497, A0=>nx3499, A1=>nx3493);
   ix3531 : xnor2 port map ( Y=>nx3530, A0=>nx3528, A1=>nx3505);
   ix3506 : aoi221 port map ( Y=>nx3505, A0=>nx2884, A1=>nx3472, B0=>nx1288, 
      B1=>nx3466, C0=>nx3518);
   ix3519 : oai22 port map ( Y=>nx3518, A0=>nx1995, A1=>nx3719, B0=>nx3071, 
      B1=>nx3313);
   ix3526 : aoi221 port map ( Y=>nx3525, A0=>nx2230, A1=>nx3472, B0=>nx646, 
      B1=>nx3466, C0=>nx3490);
   ix3538 : xnor2 port map ( Y=>nx3537, A0=>nx3539, A1=>nx3525);
   ix3755 : nand02 port map ( Y=>nx3754, A0=>nx2465, A1=>nx3301);
   ix3877 : oai22 port map ( Y=>nx3876, A0=>nx3774, A1=>nx3555, B0=>nx3553, 
      B1=>THRESHOLD(8));
   ix3775 : xnor2 port map ( Y=>nx3774, A0=>nx3553, A1=>THRESHOLD(8));
   ix3554 : xnor2 port map ( Y=>nx3553, A0=>nx3726, A1=>nx3734);
   ix3861 : oai22 port map ( Y=>nx3860, A0=>nx3782, A1=>nx3563, B0=>nx3561, 
      B1=>THRESHOLD(6));
   ix3783 : xnor2 port map ( Y=>nx3782, A0=>nx3561, A1=>THRESHOLD(6));
   ix3562 : xnor2 port map ( Y=>nx3561, A0=>nx3718, A1=>nx3530);
   ix3845 : oai22 port map ( Y=>nx3844, A0=>nx3790, A1=>nx3571, B0=>nx3569, 
      B1=>THRESHOLD(4));
   ix3791 : xnor2 port map ( Y=>nx3790, A0=>nx3569, A1=>THRESHOLD(4));
   ix3570 : xnor2 port map ( Y=>nx3569, A0=>nx3710, A1=>nx3586);
   ix3829 : oai22 port map ( Y=>nx3828, A0=>nx3798, A1=>nx3579, B0=>nx3577, 
      B1=>THRESHOLD(2));
   ix3799 : xnor2 port map ( Y=>nx3798, A0=>nx3577, A1=>THRESHOLD(2));
   ix3578 : xnor2 port map ( Y=>nx3577, A0=>nx3702, A1=>nx3642);
   ix3801 : xnor2 port map ( Y=>nx3800, A0=>nx3698, A1=>nx3433);
   ix3699 : nor02 port map ( Y=>nx3698, A0=>nx3407, A1=>nx3409);
   ix3588 : xnor2 port map ( Y=>nx3587, A0=>nx3407, A1=>nx3409);
   ix3590 : xnor2 port map ( Y=>nx3589, A0=>nx3800, A1=>THRESHOLD(1));
   ix3795 : xnor2 port map ( Y=>nx3794, A0=>nx3595, A1=>THRESHOLD(3));
   ix3596 : xnor2 port map ( Y=>nx3595, A0=>nx3381, A1=>nx3465);
   ix3787 : xnor2 port map ( Y=>nx3786, A0=>nx3601, A1=>THRESHOLD(5));
   ix3602 : xnor2 port map ( Y=>nx3601, A0=>nx3357, A1=>nx3497);
   ix3779 : xnor2 port map ( Y=>nx3778, A0=>nx3607, A1=>THRESHOLD(7));
   ix3608 : xnor2 port map ( Y=>nx3607, A0=>nx3327, A1=>nx3537);
   ix3767 : xnor2 port map ( Y=>nx3766, A0=>nx3613, A1=>THRESHOLD(9));
   ix3614 : xnor2 port map ( Y=>nx3613, A0=>nx3323, A1=>nx3543);
   ix3915 : aoi21 port map ( Y=>DIRECTION(2), A0=>nx3313, A1=>nx3721, B0=>
      nx3619);
   ix3885 : oai22 port map ( Y=>nx3884, A0=>nx3766, A1=>nx3623, B0=>nx3613, 
      B1=>THRESHOLD(9));
   ix3869 : oai22 port map ( Y=>nx3868, A0=>nx3778, A1=>nx3627, B0=>nx3607, 
      B1=>THRESHOLD(7));
   ix3853 : oai22 port map ( Y=>nx3852, A0=>nx3786, A1=>nx3631, B0=>nx3601, 
      B1=>THRESHOLD(5));
   ix3837 : oai22 port map ( Y=>nx3836, A0=>nx3794, A1=>nx3635, B0=>nx3595, 
      B1=>THRESHOLD(3));
   ix3821 : oai32 port map ( Y=>nx3820, A0=>nx3802, A1=>nx3587, A2=>
      THRESHOLD(0), B0=>nx3641, B1=>THRESHOLD(1));
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
      D=>nx1586, CLK=>CLOCK, S=>RESET);
   ix3548 : inv01 port map ( Y=>nx3547, A=>nx3884);
   ix3624 : inv01 port map ( Y=>nx3623, A=>nx3876);
   ix3556 : inv01 port map ( Y=>nx3555, A=>nx3868);
   ix3628 : inv01 port map ( Y=>nx3627, A=>nx3860);
   ix3564 : inv01 port map ( Y=>nx3563, A=>nx3852);
   ix3632 : inv01 port map ( Y=>nx3631, A=>nx3844);
   ix3572 : inv01 port map ( Y=>nx3571, A=>nx3836);
   ix3636 : inv01 port map ( Y=>nx3635, A=>nx3828);
   ix3580 : inv01 port map ( Y=>nx3579, A=>nx3820);
   ix3803 : inv01 port map ( Y=>nx3802, A=>nx3589);
   ix3642 : inv01 port map ( Y=>nx3641, A=>nx3800);
   ix3406 : inv01 port map ( Y=>nx3405, A=>nx3698);
   ix3633 : inv01 port map ( Y=>nx3632, A=>nx3441);
   ix3577 : inv01 port map ( Y=>nx3576, A=>nx3473);
   ix3521 : inv01 port map ( Y=>nx3520, A=>nx3505);
   ix3314 : inv01 port map ( Y=>nx3313, A=>nx3478);
   ix3467 : inv01 port map ( Y=>nx3466, A=>nx3335);
   ix3308 : inv01 port map ( Y=>nx3307, A=>nx3462);
   ix3101 : inv01 port map ( Y=>nx3100, A=>nx3257);
   ix3041 : inv01 port map ( Y=>nx3040, A=>nx2373);
   ix2989 : inv01 port map ( Y=>nx2988, A=>nx2393);
   ix2937 : inv01 port map ( Y=>nx2936, A=>nx2415);
   ix2885 : inv01 port map ( Y=>nx2884, A=>nx2437);
   ix2751 : inv01 port map ( Y=>nx2750, A=>nx2001);
   ix1984 : inv01 port map ( Y=>nx1983, A=>nx2652);
   ix1800 : inv01 port map ( Y=>nx1799, A=>nx2650);
   ix1978 : inv01 port map ( Y=>nx1977, A=>nx2628);
   ix1792 : inv01 port map ( Y=>nx1791, A=>nx2626);
   ix1972 : inv01 port map ( Y=>nx1971, A=>nx2604);
   ix1782 : inv01 port map ( Y=>nx1781, A=>nx2598);
   ix2581 : inv01 port map ( Y=>nx2580, A=>nx1943);
   ix2575 : inv01 port map ( Y=>nx2574, A=>nx1951);
   ix2497 : inv01 port map ( Y=>nx2496, A=>nx1839);
   ix2427 : inv01 port map ( Y=>nx2426, A=>nx1841);
   ix2333 : inv01 port map ( Y=>nx2332, A=>nx1761);
   ix2263 : inv01 port map ( Y=>nx2262, A=>nx1749);
   ix2129 : inv01 port map ( Y=>nx2128, A=>nx2115);
   ix2402 : inv01 port map ( Y=>nx2401, A=>nx2030);
   ix2222 : inv01 port map ( Y=>nx2221, A=>nx2028);
   ix2424 : inv01 port map ( Y=>nx2423, A=>nx2006);
   ix2214 : inv01 port map ( Y=>nx2213, A=>nx2004);
   ix2446 : inv01 port map ( Y=>nx2445, A=>nx1982);
   ix2204 : inv01 port map ( Y=>nx2203, A=>nx1976);
   ix1959 : inv01 port map ( Y=>nx1958, A=>nx2345);
   ix1953 : inv01 port map ( Y=>nx1952, A=>nx2353);
   ix1875 : inv01 port map ( Y=>nx1874, A=>nx2241);
   ix1805 : inv01 port map ( Y=>nx1804, A=>nx2243);
   ix1711 : inv01 port map ( Y=>nx1710, A=>nx2183);
   ix1641 : inv01 port map ( Y=>nx1640, A=>nx2177);
   ix1517 : inv01 port map ( Y=>nx1516, A=>nx3261);
   ix1445 : inv01 port map ( Y=>nx1444, A=>nx3127);
   ix1393 : inv01 port map ( Y=>nx1392, A=>nx3111);
   ix1341 : inv01 port map ( Y=>nx1340, A=>nx3095);
   ix1289 : inv01 port map ( Y=>nx1288, A=>nx3059);
   ix1167 : inv01 port map ( Y=>nx1166, A=>nx3075);
   ix3046 : inv01 port map ( Y=>nx3045, A=>nx1068);
   ix2876 : inv01 port map ( Y=>nx2875, A=>nx1066);
   ix3040 : inv01 port map ( Y=>nx3039, A=>nx1044);
   ix2868 : inv01 port map ( Y=>nx2867, A=>nx1042);
   ix3034 : inv01 port map ( Y=>nx3033, A=>nx1020);
   ix2858 : inv01 port map ( Y=>nx2857, A=>nx1014);
   ix997 : inv01 port map ( Y=>nx996, A=>nx3009);
   ix991 : inv01 port map ( Y=>nx990, A=>nx3017);
   ix913 : inv01 port map ( Y=>nx912, A=>nx2913);
   ix843 : inv01 port map ( Y=>nx842, A=>nx2915);
   ix749 : inv01 port map ( Y=>nx748, A=>nx2837);
   ix679 : inv01 port map ( Y=>nx678, A=>nx2825);
   ix545 : inv01 port map ( Y=>nx544, A=>nx3065);
   ix2754 : inv01 port map ( Y=>nx2753, A=>nx446);
   ix2582 : inv01 port map ( Y=>nx2581, A=>nx444);
   ix2748 : inv01 port map ( Y=>nx2747, A=>nx422);
   ix2576 : inv01 port map ( Y=>nx2575, A=>nx420);
   ix2742 : inv01 port map ( Y=>nx2741, A=>nx398);
   ix2566 : inv01 port map ( Y=>nx2565, A=>nx392);
   ix375 : inv01 port map ( Y=>nx374, A=>nx2717);
   ix369 : inv01 port map ( Y=>nx368, A=>nx2725);
   ix291 : inv01 port map ( Y=>nx290, A=>nx2621);
   ix221 : inv01 port map ( Y=>nx220, A=>nx2623);
   ix127 : inv01 port map ( Y=>nx126, A=>nx2545);
   ix57 : inv01 port map ( Y=>nx56, A=>nx2533);
   ix3620 : inv01 port map ( Y=>nx3619, A=>EDGE_dup0);
   ix3679 : inv01 port map ( Y=>nx3680, A=>nx3735);
   ix3685 : inv01 port map ( Y=>nx3686, A=>nx3335);
   ix3689 : inv01 port map ( Y=>nx3690, A=>nx1957);
   ix3714 : buf02 port map ( Y=>nx3715, A=>nx3081);
   ix3716 : buf02 port map ( Y=>nx3717, A=>nx3081);
   ix3718 : inv01 port map ( Y=>nx3719, A=>nx3486);
   ix3720 : inv01 port map ( Y=>nx3721, A=>nx3486);
   ix3473 : and02 port map ( Y=>nx3472, A0=>nx3739, A1=>nx3735);
   ix2853 : nor02ii port map ( Y=>nx2852, A0=>nx2846, A1=>nx2001);
   ix1996 : mux21 port map ( Y=>nx1995, A0=>nx2862, A1=>nx2868, S0=>nx3733);
   ix2899 : mux21 port map ( Y=>nx2898, A0=>nx2013, A1=>nx2011, S0=>nx3733);
   ix2018 : mux21 port map ( Y=>nx2017, A0=>nx2914, A1=>nx2920, S0=>nx3733);
   ix2951 : mux21 port map ( Y=>nx2950, A0=>nx2029, A1=>nx2027, S0=>nx3733);
   ix2034 : mux21 port map ( Y=>nx2033, A0=>nx2966, A1=>nx2972, S0=>nx3733);
   ix3003 : mux21 port map ( Y=>nx3002, A0=>nx2045, A1=>nx2043, S0=>nx2750);
   ix2050 : mux21 port map ( Y=>nx2049, A0=>nx3018, A1=>nx3024, S0=>nx2750);
   ix3055 : mux21 port map ( Y=>nx3054, A0=>nx2061, A1=>nx2059, S0=>nx2750);
   ix2066 : mux21 port map ( Y=>nx2065, A0=>nx3070, A1=>nx3076, S0=>nx2750);
   ix2092 : mux21 port map ( Y=>nx2091, A0=>nx3082, A1=>nx3088, S0=>nx3731);
   ix3067 : mux21 port map ( Y=>nx3066, A0=>nx2367, A1=>nx2365, S0=>nx3731);
   ix2374 : mux21 port map ( Y=>nx2373, A0=>nx3030, A1=>nx3036, S0=>nx3731);
   ix3015 : mux21 port map ( Y=>nx3014, A0=>nx2387, A1=>nx2385, S0=>nx3731);
   ix2394 : mux21 port map ( Y=>nx2393, A0=>nx2978, A1=>nx2984, S0=>nx3731);
   ix2963 : mux21 port map ( Y=>nx2962, A0=>nx2409, A1=>nx2407, S0=>nx3731);
   ix2416 : mux21 port map ( Y=>nx2415, A0=>nx2926, A1=>nx2932, S0=>nx2128);
   ix2911 : mux21 port map ( Y=>nx2910, A0=>nx2431, A1=>nx2429, S0=>nx2128);
   ix2438 : mux21 port map ( Y=>nx2437, A0=>nx2874, A1=>nx2880, S0=>nx2128);
   ix2231 : nor02ii port map ( Y=>nx2230, A0=>nx2224, A1=>nx2115);
   ix647 : nor02ii port map ( Y=>nx646, A0=>nx640, A1=>nx3065);
   ix1269 : nor02ii port map ( Y=>nx1268, A0=>nx1262, A1=>nx3075);
   ix3060 : mux21 port map ( Y=>nx3059, A0=>nx1278, A1=>nx1284, S0=>nx3727);
   ix3072 : mux21 port map ( Y=>nx3071, A0=>nx1290, A1=>nx1296, S0=>nx3729);
   ix1315 : mux21 port map ( Y=>nx1314, A0=>nx3091, A1=>nx3089, S0=>nx3727);
   ix3096 : mux21 port map ( Y=>nx3095, A0=>nx1330, A1=>nx1336, S0=>nx3727);
   ix1367 : mux21 port map ( Y=>nx1366, A0=>nx3107, A1=>nx3105, S0=>nx3727);
   ix3112 : mux21 port map ( Y=>nx3111, A0=>nx1382, A1=>nx1388, S0=>nx3727);
   ix1419 : mux21 port map ( Y=>nx1418, A0=>nx3123, A1=>nx3121, S0=>nx3727);
   ix3128 : mux21 port map ( Y=>nx3127, A0=>nx1434, A1=>nx1440, S0=>nx544);
   ix1471 : mux21 port map ( Y=>nx1470, A0=>nx3139, A1=>nx3137, S0=>nx544);
   ix3144 : mux21 port map ( Y=>nx3143, A0=>nx1486, A1=>nx1492, S0=>nx544);
   ix3158 : mux21 port map ( Y=>nx3157, A0=>nx1498, A1=>nx1504, S0=>nx3729);
   ix1483 : mux21 port map ( Y=>nx1482, A0=>nx3169, A1=>nx3167, S0=>nx3729);
   ix3174 : mux21 port map ( Y=>nx3173, A0=>nx1446, A1=>nx1452, S0=>nx3729);
   ix1431 : mux21 port map ( Y=>nx1430, A0=>nx3185, A1=>nx3183, S0=>nx3729);
   ix3190 : mux21 port map ( Y=>nx3189, A0=>nx1394, A1=>nx1400, S0=>nx1166);
   ix1379 : mux21 port map ( Y=>nx1378, A0=>nx3201, A1=>nx3199, S0=>nx1166);
   ix3206 : mux21 port map ( Y=>nx3205, A0=>nx1342, A1=>nx1348, S0=>nx1166);
   ix1327 : mux21 port map ( Y=>nx1326, A0=>nx3217, A1=>nx3215, S0=>nx1166);
   ix3379 : mux21 port map ( Y=>nx3378, A0=>nx2075, A1=>nx3257, S0=>nx3739);
   ix3361 : mux21 port map ( Y=>nx3360, A0=>nx2091, A1=>nx2065, S0=>nx3739);
   ix3270 : mux21 port map ( Y=>nx3269, A0=>nx3066, A1=>nx3054, S0=>nx3739);
   ix3325 : mux21 port map ( Y=>nx3324, A0=>nx2373, A1=>nx2049, S0=>nx3739);
   ix3278 : mux21 port map ( Y=>nx3277, A0=>nx3014, A1=>nx3002, S0=>nx3739);
   ix3289 : mux21 port map ( Y=>nx3288, A0=>nx2393, A1=>nx2033, S0=>nx3741);
   ix3286 : mux21 port map ( Y=>nx3285, A0=>nx2962, A1=>nx2950, S0=>nx3741);
   ix3253 : mux21 port map ( Y=>nx3252, A0=>nx2415, A1=>nx2017, S0=>nx3741);
   ix3294 : mux21 port map ( Y=>nx3293, A0=>nx2910, A1=>nx2898, S0=>nx3741);
   ix3217 : mux21 port map ( Y=>nx3216, A0=>nx2437, A1=>nx1995, S0=>nx3741);
   ix3905 : ao22 port map ( Y=>nx3904, A0=>nx2128, A1=>nx3486, B0=>nx544, B1
      =>nx3478);
   ix3312 : nor02 port map ( Y=>nx3486, A0=>nx3741, A1=>nx3462);
   ix3479 : nor02ii port map ( Y=>nx3478, A0=>nx3717, A1=>nx3462);
   ix3408 : mux21 port map ( Y=>nx3407, A0=>nx3370, A1=>nx3378, S0=>nx3735);
   ix3436 : mux21 port map ( Y=>nx3435, A0=>nx3352, A1=>nx3360, S0=>nx3735);
   ix3641 : mux21 port map ( Y=>nx3640, A0=>nx3247, A1=>nx3269, S0=>nx3735);
   ix3468 : mux21 port map ( Y=>nx3467, A0=>nx3316, A1=>nx3324, S0=>nx3735);
   ix3585 : mux21 port map ( Y=>nx3584, A0=>nx3239, A1=>nx3277, S0=>nx3737);
   ix3500 : mux21 port map ( Y=>nx3499, A0=>nx3280, A1=>nx3288, S0=>nx3737);
   ix3529 : mux21 port map ( Y=>nx3528, A0=>nx3231, A1=>nx3285, S0=>nx3737);
   ix3491 : ao22 port map ( Y=>nx3490, A0=>nx2852, A1=>nx3486, B0=>nx1268, 
      B1=>nx3478);
   ix3540 : mux21 port map ( Y=>nx3539, A0=>nx3244, A1=>nx3252, S0=>nx3737);
   ix3735 : mux21 port map ( Y=>nx3734, A0=>nx3225, A1=>nx3293, S0=>nx3737);
   ix3544 : mux21 port map ( Y=>nx3543, A0=>nx3208, A1=>nx3216, S0=>nx3737);
   ix3911 : nor02ii port map ( Y=>DIRECTION(1), A0=>nx3307, A1=>EDGE_dup0);
   ix3687 : and02 port map ( Y=>nx3688, A0=>nx3690, A1=>nx3307);
   ix3726 : inv01 port map ( Y=>nx3727, A=>nx3065);
   ix3728 : inv01 port map ( Y=>nx3729, A=>nx3075);
   ix3730 : inv01 port map ( Y=>nx3731, A=>nx2115);
   ix3732 : inv01 port map ( Y=>nx3733, A=>nx2001);
   ix3734 : inv01 port map ( Y=>nx3735, A=>nx3462);
   ix3736 : inv01 port map ( Y=>nx3737, A=>nx3462);
   ix3738 : inv01 port map ( Y=>nx3739, A=>nx1957);
   ix3740 : inv01 port map ( Y=>nx3741, A=>nx1957);
end behavioral ;

