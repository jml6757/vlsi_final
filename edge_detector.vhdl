
-- 
-- Definition of  filter
-- 
--      Wed Dec 10 13:06:35 2014
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
      READY : OUT std_logic ;
      O_VALID : OUT std_logic ;
      EDGE : OUT std_logic ;
      DIRECTION : OUT std_logic_vector (2 DOWNTO 0)) ;
end filter ;

architecture behavioral of filter is
   signal READY_dup0, EDGE_dup0, nx1607, fsm_inst_state_4, timer_finished, 
      fsm_inst_state_0, nx12, nx20, nx1677, 
      timed_signal_inst_time_remaining_5, nx1679, 
      timed_signal_inst_time_remaining_2, timed_signal_inst_time_remaining_1, 
      timed_signal_inst_time_remaining_0, nx120, nx126, nx158, nx172, nx180, 
      nx190, nx196, nx206, nx212, nx222, nx228, nx230, nx242, nx252, nx260, 
      nx268, nx276, nx284, nx294, nx322, nx336, nx344, nx354, nx360, nx370, 
      nx376, nx386, nx392, nx394, nx406, nx416, nx424, nx432, nx440, nx448, 
      nx458, nx462, nx470, nx476, nx482, nx494, nx500, nx502, nx510, nx512, 
      nx514, nx522, nx524, nx526, nx534, nx536, nx538, nx546, nx548, nx550, 
      nx558, nx560, nx562, nx574, nx582, nx584, nx586, nx612, nx620, nx628, 
      nx636, nx644, nx646, nx698, nx706, nx714, nx722, nx734, nx754, nx760, 
      nx792, nx806, nx814, nx824, nx830, nx840, nx846, nx856, nx862, nx864, 
      nx876, nx886, nx894, nx902, nx910, nx918, nx928, nx956, nx970, nx978, 
      nx988, nx994, nx1004, nx1010, nx1020, nx1026, nx1028, nx1040, nx1050, 
      nx1058, nx1066, nx1074, nx1082, nx1092, nx1104, nx1110, nx1116, nx1128, 
      nx1134, nx1136, nx1144, nx1146, nx1148, nx1156, nx1158, nx1160, nx1168, 
      nx1170, nx1172, nx1180, nx1182, nx1184, nx1192, nx1194, nx1196, nx1208, 
      nx1216, nx1218, nx1220, nx1246, nx1254, nx1262, nx1270, nx1278, nx1280, 
      nx1344, nx1352, nx1360, nx1368, nx1376, nx1382, nx1392, nx1398, nx1402, 
      nx1404, nx1410, nx1428, nx1432, nx1438, nx1442, nx1444, nx1450, nx1468, 
      nx1480, nx1484, nx1490, nx1494, nx1496, nx1502, nx1520, nx1532, nx1536, 
      nx1542, nx1546, nx1548, nx1554, nx1572, nx1584, nx1588, nx1594, nx1600, 
      nx1606, nx1618, nx1636, nx1652, nx1668, nx1684, nx1700, nx1742, nx1756, 
      nx1764, nx1774, nx1780, nx1790, nx1796, nx1806, nx1812, nx1814, nx1826, 
      nx1836, nx1844, nx1852, nx1860, nx1868, nx1878, nx1906, nx1920, nx1928, 
      nx1938, nx1944, nx1954, nx1960, nx1970, nx1976, nx1978, nx1990, nx2000, 
      nx2008, nx2016, nx2024, nx2032, nx2042, nx2054, nx2060, nx2066, nx2078, 
      nx2084, nx2086, nx2094, nx2096, nx2098, nx2106, nx2108, nx2110, nx2118, 
      nx2120, nx2122, nx2130, nx2132, nx2134, nx2142, nx2144, nx2146, nx2158, 
      nx2166, nx2168, nx2170, nx2196, nx2204, nx2212, nx2220, nx2228, nx2230, 
      nx2294, nx2302, nx2310, nx2318, nx2326, nx2332, nx2364, nx2378, nx2386, 
      nx2396, nx2402, nx2412, nx2418, nx2428, nx2434, nx2436, nx2448, nx2458, 
      nx2466, nx2474, nx2482, nx2490, nx2500, nx2528, nx2542, nx2550, nx2560, 
      nx2566, nx2576, nx2582, nx2592, nx2598, nx2600, nx2612, nx2622, nx2630, 
      nx2638, nx2646, nx2654, nx2664, nx2676, nx2682, nx2688, nx2700, nx2706, 
      nx2708, nx2716, nx2718, nx2720, nx2728, nx2730, nx2732, nx2740, nx2742, 
      nx2744, nx2752, nx2754, nx2756, nx2764, nx2766, nx2768, nx2780, nx2788, 
      nx2790, nx2792, nx2818, nx2826, nx2834, nx2842, nx2850, nx2852, nx2916, 
      nx2924, nx2932, nx2940, nx2948, nx2954, nx2964, nx2970, nx2976, nx2982, 
      nx2986, nx3000, nx3012, nx3016, nx3022, nx3028, nx3034, nx3038, nx3052, 
      nx3064, nx3068, nx3074, nx3080, nx3086, nx3090, nx3104, nx3116, nx3120, 
      nx3126, nx3132, nx3138, nx3142, nx3156, nx3168, nx3172, nx3178, nx3184, 
      nx3190, nx3202, nx3220, nx3236, nx3252, nx3268, nx3284, nx3310, nx3318, 
      nx3346, nx3354, nx3382, nx3390, nx3418, nx3426, nx3454, nx3462, nx3472, 
      nx3480, nx3484, nx3500, nx3516, nx3532, nx3548, nx3564, nx3568, nx3574, 
      nx3580, nx3588, nx3592, nx3620, nx3622, nx3630, nx3632, nx3648, nx3676, 
      nx3678, nx3686, nx3688, nx3704, nx3740, nx3744, nx3748, nx3756, nx3764, 
      nx3772, nx3784, nx3786, nx3788, nx3790, nx3812, nx3816, nx3826, nx3838, 
      nx3866, nx3874, nx3882, nx3898, nx3900, nx3916, nx1693, nx1703, nx1713, 
      nx1723, nx1733, nx1743, nx1753, nx1763, nx1777, nx1785, nx1789, nx1793, 
      nx1797, nx1803, nx1805, nx1807, nx1809, nx1811, nx1813, nx1815, nx1817, 
      nx1823, nx1825, nx1829, nx1831, nx1835, nx1837, nx1841, nx1843, nx1847, 
      nx1849, nx1855, nx1861, nx1867, nx1873, nx1875, nx1877, nx1883, nx1885, 
      nx1891, nx1893, nx1899, nx1901, nx1907, nx1909, nx1911, nx1913, nx1921, 
      nx1923, nx1927, nx1933, nx1935, nx1941, nx1947, nx1949, nx1955, nx1963, 
      nx1969, nx1971, nx1979, nx1983, nx1985, nx1987, nx1995, nx2001, nx2003, 
      nx2011, nx2015, nx2017, nx2019, nx2027, nx2031, nx2037, nx2043, nx2045, 
      nx2053, nx2065, nx2067, nx2071, nx2073, nx2077, nx2079, nx2083, nx2087, 
      nx2091, nx2097, nx2102, nx2107, nx2109, nx2113, nx2119, nx2123, nx2125, 
      nx2129, nx2135, nx2139, nx2141, nx2145, nx2151, nx2155, nx2157, nx2161, 
      nx2167, nx2171, nx2173, nx2175, nx2177, nx2179, nx2181, nx2183, nx2185, 
      nx2187, nx2197, nx2199, nx2205, nx2207, nx2211, nx2219, nx2223, nx2227, 
      nx2231, nx2235, nx2237, nx2239, nx2241, nx2243, nx2245, nx2247, nx2249, 
      nx2255, nx2257, nx2261, nx2263, nx2267, nx2269, nx2273, nx2279, nx2285, 
      nx2291, nx2297, nx2299, nx2301, nx2307, nx2309, nx2315, nx2317, nx2323, 
      nx2325, nx2331, nx2337, nx2339, nx2345, nx2351, nx2353, nx2359, nx2367, 
      nx2373, nx2375, nx2383, nx2387, nx2389, nx2391, nx2399, nx2405, nx2407, 
      nx2415, nx2419, nx2421, nx2423, nx2431, nx2435, nx2441, nx2447, nx2449, 
      nx2457, nx2461, nx2463, nx2467, nx2469, nx2475, nx2477, nx2481, nx2483, 
      nx2487, nx2489, nx2495, nx2497, nx2499, nx2503, nx2505, nx2509, nx2511, 
      nx2517, nx2519, nx2521, nx2525, nx2527, nx2531, nx2533, nx2539, nx2541, 
      nx2543, nx2561, nx2571, nx2575, nx2579, nx2583, nx2587, nx2589, nx2591, 
      nx2593, nx2595, nx2597, nx2599, nx2601, nx2603, nx2609, nx2611, nx2615, 
      nx2617, nx2621, nx2623, nx2627, nx2629, nx2633, nx2635, nx2641, nx2647, 
      nx2653, nx2659, nx2661, nx2663, nx2669, nx2671, nx2677, nx2679, nx2683, 
      nx2685, nx2689, nx2691, nx2693, nx2695, nx2703, nx2705, nx2709, nx2715, 
      nx2717, nx2723, nx2729, nx2731, nx2735, nx2743, nx2749, nx2757, nx2761, 
      nx2763, nx2765, nx2773, nx2779, nx2787, nx2791, nx2793, nx2795, nx2803, 
      nx2811, nx2817, nx2819, nx2833, nx2835, nx2839, nx2841, nx2845, nx2847, 
      nx2851, nx2855, nx2865, nx2869, nx2873, nx2877, nx2883, nx2885, nx2887, 
      nx2889, nx2891, nx2893, nx2895, nx2901, nx2903, nx2907, nx2909, nx2913, 
      nx2915, nx2919, nx2921, nx2925, nx2927, nx2933, nx2939, nx2945, nx2951, 
      nx2953, nx2955, nx2961, nx2963, nx2969, nx2971, nx2977, nx2979, nx2985, 
      nx2987, nx2989, nx2991, nx2997, nx2999, nx3003, nx3007, nx3009, nx3015, 
      nx3021, nx3023, nx3029, nx3035, nx3041, nx3043, nx3049, nx3053, nx3055, 
      nx3057, nx3065, nx3071, nx3073, nx3081, nx3085, nx3087, nx3089, nx3097, 
      nx3101, nx3107, nx3111, nx3113, nx3127, nx3129, nx3133, nx3135, nx3139, 
      nx3141, nx3145, nx3149, nx3151, nx3155, nx3161, nx3167, nx3173, nx3179, 
      nx3183, nx3187, nx3189, nx3193, nx3199, nx3203, nx3205, nx3209, nx3215, 
      nx3219, nx3221, nx3225, nx3231, nx3235, nx3237, nx3241, nx3247, nx3251, 
      nx3253, nx3255, nx3261, nx3265, nx3267, nx3269, nx3271, nx3277, nx3281, 
      nx3283, nx3285, nx3287, nx3293, nx3297, nx3299, nx3301, nx3303, nx3307, 
      nx3311, nx3313, nx3315, nx3317, nx3321, nx3323, nx3329, nx3331, nx3337, 
      nx3339, nx3343, nx3345, nx3351, nx3355, nx3357, nx3361, nx3363, nx3365, 
      nx3369, nx3371, nx3373, nx3377, nx3379, nx3381, nx3385, nx3387, nx3389, 
      nx3393, nx3395, nx3401, nx3407, nx3411, nx3413, nx3419, nx3427, nx3451, 
      nx3475, nx3499, nx3501, nx3503, nx3523, nx3527, nx3529, nx3535, nx3555, 
      nx3559, nx3561, nx3567, nx3586, nx3589, nx3591, nx3597, nx3617, nx3629, 
      nx3631, nx3637, nx3639, nx3645, nx3647, nx3649, nx3651, nx3655, nx3657, 
      nx3659, nx3667, nx3677, nx3679, nx3695, nx3701, nx3711, nx3717, nx3719, 
      nx3721, nx3725, nx3735, nx3737, nx3739, nx3745, nx3747, nx3753, nx3755, 
      nx3757, nx3759, nx3763, nx3769, nx3771, nx3773, nx3777, nx3785, nx3794, 
      nx3796, nx3798, nx3804, nx3806, nx3810, nx3813, nx3837, nx3839, nx3841, 
      nx3843, nx3849, nx3851, nx3853, nx3855, nx3857, nx3859, nx3861, nx3863, 
      nx3865, nx3867, nx3869: std_logic ;

begin
   READY <= READY_dup0 ;
   EDGE <= EDGE_dup0 ;
   ix1770 : fake_vcc port map ( Y=>nx462);
   ix1608 : fake_gnd port map ( Y=>nx1607);
   ix3921 : nor02ii port map ( Y=>DIRECTION(0), A0=>nx1777, A1=>EDGE_dup0);
   ix1778 : aoi221 port map ( Y=>nx1777, A0=>nx3857, A1=>nx3806, B0=>nx3853, 
      B1=>nx3804, C0=>nx3916);
   ix2851 : mux21 port map ( Y=>nx2850, A0=>nx2676, A1=>nx1873, S0=>nx2688);
   ix1786 : nand02 port map ( Y=>nx1785, A0=>T12(7), A1=>nx2490);
   ix2491 : mux21 port map ( Y=>nx2490, A0=>nx1789, A1=>nx1815, S0=>nx1817);
   ix1790 : mux21 port map ( Y=>nx1789, A0=>nx2386, A1=>T02(6), S0=>nx1813);
   ix2387 : mux21 port map ( Y=>nx2386, A0=>nx1793, A1=>nx1809, S0=>nx1811);
   ix1794 : mux21 port map ( Y=>nx1793, A0=>nx2378, A1=>T02(4), S0=>nx1807);
   ix2379 : mux21 port map ( Y=>nx2378, A0=>nx1797, A1=>nx1803, S0=>nx1805);
   ix1798 : aoi32 port map ( Y=>nx1797, A0=>T12(0), A1=>T02(1), A2=>nx2364, 
      B0=>T02(2), B1=>T12(1));
   ix1804 : inv01 port map ( Y=>nx1803, A=>T02(3));
   ix1806 : xnor2 port map ( Y=>nx1805, A0=>T12(2), A1=>T02(3));
   ix1808 : xnor2 port map ( Y=>nx1807, A0=>T12(3), A1=>T02(4));
   ix1810 : inv01 port map ( Y=>nx1809, A=>T02(5));
   ix1812 : xnor2 port map ( Y=>nx1811, A0=>T12(4), A1=>T02(5));
   ix1814 : xnor2 port map ( Y=>nx1813, A0=>T12(5), A1=>T02(6));
   ix1816 : inv01 port map ( Y=>nx1815, A=>T02(7));
   ix1818 : xnor2 port map ( Y=>nx1817, A0=>T12(6), A1=>T02(7));
   ix2483 : mux21 port map ( Y=>nx2482, A0=>nx1823, A1=>nx1825, S0=>nx2396);
   ix1824 : xnor2 port map ( Y=>nx1823, A0=>nx1789, A1=>nx1817);
   ix1826 : mux21 port map ( Y=>nx1825, A0=>nx2474, A1=>nx2402, S0=>nx1867);
   ix2475 : mux21 port map ( Y=>nx2474, A0=>nx1829, A1=>nx1831, S0=>nx2412);
   ix1830 : xnor2 port map ( Y=>nx1829, A0=>nx1793, A1=>nx1811);
   ix1832 : mux21 port map ( Y=>nx1831, A0=>nx2466, A1=>nx2418, S0=>nx1861);
   ix2467 : mux21 port map ( Y=>nx2466, A0=>nx1835, A1=>nx1837, S0=>nx2428);
   ix1836 : xnor2 port map ( Y=>nx1835, A0=>nx1797, A1=>nx1805);
   ix1838 : aoi22 port map ( Y=>nx1837, A0=>nx2434, A1=>T22(2), B0=>nx2458, 
      B1=>nx2436);
   ix1842 : nand02 port map ( Y=>nx1841, A0=>T12(0), A1=>T02(1));
   ix1844 : xnor2 port map ( Y=>nx1843, A0=>T12(1), A1=>T02(2));
   ix2459 : mux21 port map ( Y=>nx2458, A0=>nx1847, A1=>nx1849, S0=>nx2448);
   ix1848 : oai21 port map ( Y=>nx1847, A0=>T02(1), A1=>T12(0), B0=>nx1841);
   ix1850 : nand02 port map ( Y=>nx1849, A0=>T22(0), A1=>T02(0));
   ix2449 : xnor2 port map ( Y=>nx2448, A0=>T22(1), A1=>nx1847);
   ix2437 : xnor2 port map ( Y=>nx2436, A0=>T22(2), A1=>nx1855);
   ix1856 : xnor2 port map ( Y=>nx1855, A0=>nx1841, A1=>nx1843);
   ix2429 : xnor2 port map ( Y=>nx2428, A0=>T22(3), A1=>nx1835);
   ix2419 : xnor2 port map ( Y=>nx2418, A0=>nx2378, A1=>nx1807);
   ix1862 : xnor2 port map ( Y=>nx1861, A0=>T22(4), A1=>nx2418);
   ix2413 : xnor2 port map ( Y=>nx2412, A0=>T22(5), A1=>nx1829);
   ix2403 : xnor2 port map ( Y=>nx2402, A0=>nx2386, A1=>nx1813);
   ix1868 : xnor2 port map ( Y=>nx1867, A0=>T22(6), A1=>nx2402);
   ix2397 : xnor2 port map ( Y=>nx2396, A0=>T22(7), A1=>nx1823);
   ix1874 : mux21 port map ( Y=>nx1873, A0=>nx1875, A1=>nx2842, S0=>nx2708);
   ix1878 : xnor2 port map ( Y=>nx1877, A0=>T12(7), A1=>nx2490);
   ix2843 : mux21 port map ( Y=>nx2842, A0=>nx2716, A1=>nx1883, S0=>nx2720);
   ix2717 : xnor2 port map ( Y=>nx2716, A0=>nx1825, A1=>nx2396);
   ix1884 : mux21 port map ( Y=>nx1883, A0=>nx1885, A1=>nx2834, S0=>nx2732);
   ix2835 : mux21 port map ( Y=>nx2834, A0=>nx2740, A1=>nx1891, S0=>nx2744);
   ix2741 : xnor2 port map ( Y=>nx2740, A0=>nx1831, A1=>nx2412);
   ix1892 : mux21 port map ( Y=>nx1891, A0=>nx1893, A1=>nx2826, S0=>nx2756);
   ix2827 : mux21 port map ( Y=>nx2826, A0=>nx2764, A1=>nx1899, S0=>nx2768);
   ix2765 : xnor2 port map ( Y=>nx2764, A0=>nx1837, A1=>nx2428);
   ix1900 : mux21 port map ( Y=>nx1899, A0=>nx1901, A1=>nx2818, S0=>nx2780);
   ix1902 : xnor2 port map ( Y=>nx1901, A0=>nx2458, A1=>nx2436);
   ix2819 : mux21 port map ( Y=>nx2818, A0=>nx2788, A1=>nx1907, S0=>nx2792);
   ix2789 : xnor2 port map ( Y=>nx2788, A0=>nx1849, A1=>nx2448);
   ix1908 : nor02ii port map ( Y=>nx1907, A0=>nx1909, A1=>nx1911);
   ix1910 : oai21 port map ( Y=>nx1909, A0=>T02(0), A1=>T22(0), B0=>nx1849);
   ix1912 : oai21 port map ( Y=>nx1911, A0=>T20(0), A1=>T00(0), B0=>nx1913);
   ix1914 : nand02 port map ( Y=>nx1913, A0=>T00(0), A1=>T20(0));
   ix2793 : xnor2 port map ( Y=>nx2792, A0=>nx2790, A1=>nx2788);
   ix2791 : xnor2 port map ( Y=>nx2790, A0=>nx1913, A1=>nx2612);
   ix2613 : xnor2 port map ( Y=>nx2612, A0=>T20(1), A1=>nx1921);
   ix1922 : oai21 port map ( Y=>nx1921, A0=>T10(0), A1=>T00(1), B0=>nx1923);
   ix1924 : nand02 port map ( Y=>nx1923, A0=>T00(1), A1=>T10(0));
   ix2781 : xnor2 port map ( Y=>nx2780, A0=>nx1927, A1=>nx1901);
   ix1928 : xnor2 port map ( Y=>nx1927, A0=>nx2622, A1=>nx2600);
   ix2623 : mux21 port map ( Y=>nx2622, A0=>nx1921, A1=>nx1913, S0=>nx2612);
   ix2601 : xnor2 port map ( Y=>nx2600, A0=>T20(2), A1=>nx1933);
   ix1934 : xnor2 port map ( Y=>nx1933, A0=>nx1923, A1=>nx1935);
   ix1936 : xnor2 port map ( Y=>nx1935, A0=>T00(2), A1=>T10(1));
   ix2769 : xnor2 port map ( Y=>nx2768, A0=>nx2766, A1=>nx2764);
   ix2767 : xnor2 port map ( Y=>nx2766, A0=>nx1941, A1=>nx2592);
   ix1942 : aoi22 port map ( Y=>nx1941, A0=>nx2598, A1=>T20(2), B0=>nx2622, 
      B1=>nx2600);
   ix2593 : xnor2 port map ( Y=>nx2592, A0=>T20(3), A1=>nx1947);
   ix1948 : xnor2 port map ( Y=>nx1947, A0=>nx1949, A1=>nx1955);
   ix1950 : aoi32 port map ( Y=>nx1949, A0=>T00(1), A1=>T10(0), A2=>nx2528, 
      B0=>T10(1), B1=>T00(2));
   ix1956 : xnor2 port map ( Y=>nx1955, A0=>T00(3), A1=>T10(2));
   ix2757 : xnor2 port map ( Y=>nx2756, A0=>nx2754, A1=>nx2752);
   ix2755 : xnor2 port map ( Y=>nx2754, A0=>nx2630, A1=>nx1963);
   ix2631 : mux21 port map ( Y=>nx2630, A0=>nx1947, A1=>nx1941, S0=>nx2592);
   ix1964 : xnor2 port map ( Y=>nx1963, A0=>T20(4), A1=>nx2582);
   ix2583 : xnor2 port map ( Y=>nx2582, A0=>nx2542, A1=>nx1971);
   ix2543 : mux21 port map ( Y=>nx2542, A0=>nx1949, A1=>nx1969, S0=>nx1955);
   ix1970 : inv01 port map ( Y=>nx1969, A=>T10(2));
   ix1972 : xnor2 port map ( Y=>nx1971, A0=>T00(4), A1=>T10(3));
   ix2753 : xnor2 port map ( Y=>nx2752, A0=>nx2466, A1=>nx1861);
   ix2745 : xnor2 port map ( Y=>nx2744, A0=>nx2742, A1=>nx2740);
   ix2743 : xnor2 port map ( Y=>nx2742, A0=>nx1979, A1=>nx2576);
   ix1980 : mux21 port map ( Y=>nx1979, A0=>nx2630, A1=>nx2582, S0=>nx1963);
   ix2577 : xnor2 port map ( Y=>nx2576, A0=>T20(5), A1=>nx1983);
   ix1984 : xnor2 port map ( Y=>nx1983, A0=>nx1985, A1=>nx1987);
   ix1986 : mux21 port map ( Y=>nx1985, A0=>nx2542, A1=>T10(3), S0=>nx1971);
   ix1988 : xnor2 port map ( Y=>nx1987, A0=>T00(5), A1=>T10(4));
   ix2733 : xnor2 port map ( Y=>nx2732, A0=>nx2730, A1=>nx2728);
   ix2731 : xnor2 port map ( Y=>nx2730, A0=>nx2638, A1=>nx1995);
   ix2639 : mux21 port map ( Y=>nx2638, A0=>nx1983, A1=>nx1979, S0=>nx2576);
   ix1996 : xnor2 port map ( Y=>nx1995, A0=>T20(6), A1=>nx2566);
   ix2567 : xnor2 port map ( Y=>nx2566, A0=>nx2550, A1=>nx2003);
   ix2551 : mux21 port map ( Y=>nx2550, A0=>nx1985, A1=>nx2001, S0=>nx1987);
   ix2002 : inv01 port map ( Y=>nx2001, A=>T10(4));
   ix2004 : xnor2 port map ( Y=>nx2003, A0=>T00(6), A1=>T10(5));
   ix2729 : xnor2 port map ( Y=>nx2728, A0=>nx2474, A1=>nx1867);
   ix2721 : xnor2 port map ( Y=>nx2720, A0=>nx2718, A1=>nx2716);
   ix2719 : xnor2 port map ( Y=>nx2718, A0=>nx2011, A1=>nx2560);
   ix2012 : mux21 port map ( Y=>nx2011, A0=>nx2638, A1=>nx2566, S0=>nx1995);
   ix2561 : xnor2 port map ( Y=>nx2560, A0=>T20(7), A1=>nx2015);
   ix2016 : xnor2 port map ( Y=>nx2015, A0=>nx2017, A1=>nx2019);
   ix2018 : mux21 port map ( Y=>nx2017, A0=>nx2550, A1=>T10(5), S0=>nx2003);
   ix2020 : xnor2 port map ( Y=>nx2019, A0=>T00(7), A1=>T10(6));
   ix2709 : xnor2 port map ( Y=>nx2708, A0=>nx2706, A1=>nx2700);
   ix2707 : xnor2 port map ( Y=>nx2706, A0=>nx2646, A1=>nx2027);
   ix2647 : mux21 port map ( Y=>nx2646, A0=>nx2015, A1=>nx2011, S0=>nx2560);
   ix2028 : xnor2 port map ( Y=>nx2027, A0=>T10(7), A1=>nx2654);
   ix2655 : mux21 port map ( Y=>nx2654, A0=>nx2017, A1=>nx2031, S0=>nx2019);
   ix2032 : inv01 port map ( Y=>nx2031, A=>T10(6));
   ix2701 : xnor2 port map ( Y=>nx2700, A0=>nx2482, A1=>nx1877);
   ix2689 : xnor2 port map ( Y=>nx2688, A0=>nx2037, A1=>nx2045);
   ix2040 : nor02ii port map ( Y=>nx2037, A0=>nx2664, A1=>nx2043);
   ix2665 : nor02ii port map ( Y=>nx2664, A0=>nx2027, A1=>nx2646);
   ix2044 : nand02 port map ( Y=>nx2043, A0=>T10(7), A1=>nx2654);
   ix2048 : nor02ii port map ( Y=>nx2045, A0=>nx2500, A1=>nx1785);
   ix2501 : nor02ii port map ( Y=>nx2500, A0=>nx1877, A1=>nx2482);
   ix2054 : mux21 port map ( Y=>nx2053, A0=>nx2954, A1=>nx3284, S0=>nx2543);
   ix2949 : mux21 port map ( Y=>nx2948, A0=>nx2682, A1=>nx2065, S0=>nx2688);
   ix2066 : mux21 port map ( Y=>nx2065, A0=>nx2067, A1=>nx2940, S0=>nx2708);
   ix2941 : mux21 port map ( Y=>nx2940, A0=>nx2718, A1=>nx2071, S0=>nx2720);
   ix2072 : mux21 port map ( Y=>nx2071, A0=>nx2073, A1=>nx2932, S0=>nx2732);
   ix2933 : mux21 port map ( Y=>nx2932, A0=>nx2742, A1=>nx2077, S0=>nx2744);
   ix2078 : mux21 port map ( Y=>nx2077, A0=>nx2079, A1=>nx2924, S0=>nx2756);
   ix2925 : mux21 port map ( Y=>nx2924, A0=>nx2766, A1=>nx2083, S0=>nx2768);
   ix2084 : mux21 port map ( Y=>nx2083, A0=>nx1927, A1=>nx2916, S0=>nx2780);
   ix2917 : mux21 port map ( Y=>nx2916, A0=>nx2790, A1=>nx2087, S0=>nx2792);
   ix2088 : nor02ii port map ( Y=>nx2087, A0=>nx1911, A1=>nx1909);
   ix3285 : mux21 port map ( Y=>nx3284, A0=>nx2091, A1=>nx2102, S0=>nx2531);
   ix2971 : xnor2 port map ( Y=>nx2970, A0=>nx1873, A1=>nx2688);
   ix2965 : xnor2 port map ( Y=>nx2964, A0=>nx2065, A1=>nx2688);
   ix2100 : nand02 port map ( Y=>nx2097, A0=>nx2850, A1=>nx462);
   ix2104 : mux21 port map ( Y=>nx2102, A0=>nx3000, A1=>nx3268, S0=>nx2521);
   ix2108 : xnor2 port map ( Y=>nx2107, A0=>nx2842, A1=>nx2708);
   ix2110 : xnor2 port map ( Y=>nx2109, A0=>nx2940, A1=>nx2708);
   ix3269 : mux21 port map ( Y=>nx3268, A0=>nx2113, A1=>nx2119, S0=>nx2509);
   ix3023 : xnor2 port map ( Y=>nx3022, A0=>nx1883, A1=>nx2720);
   ix3017 : xnor2 port map ( Y=>nx3016, A0=>nx2071, A1=>nx2720);
   ix2120 : mux21 port map ( Y=>nx2119, A0=>nx3052, A1=>nx3252, S0=>nx2499);
   ix2124 : xnor2 port map ( Y=>nx2123, A0=>nx2834, A1=>nx2732);
   ix2126 : xnor2 port map ( Y=>nx2125, A0=>nx2932, A1=>nx2732);
   ix3253 : mux21 port map ( Y=>nx3252, A0=>nx2129, A1=>nx2135, S0=>nx2487);
   ix3075 : xnor2 port map ( Y=>nx3074, A0=>nx1891, A1=>nx2744);
   ix3069 : xnor2 port map ( Y=>nx3068, A0=>nx2077, A1=>nx2744);
   ix2136 : mux21 port map ( Y=>nx2135, A0=>nx3104, A1=>nx3236, S0=>nx2477);
   ix2140 : xnor2 port map ( Y=>nx2139, A0=>nx2826, A1=>nx2756);
   ix2142 : xnor2 port map ( Y=>nx2141, A0=>nx2924, A1=>nx2756);
   ix3237 : mux21 port map ( Y=>nx3236, A0=>nx2145, A1=>nx2151, S0=>nx2467);
   ix3127 : xnor2 port map ( Y=>nx3126, A0=>nx1899, A1=>nx2768);
   ix3121 : xnor2 port map ( Y=>nx3120, A0=>nx2083, A1=>nx2768);
   ix2152 : mux21 port map ( Y=>nx2151, A0=>nx3156, A1=>nx3220, S0=>nx2457);
   ix2156 : xnor2 port map ( Y=>nx2155, A0=>nx2818, A1=>nx2780);
   ix2158 : xnor2 port map ( Y=>nx2157, A0=>nx2916, A1=>nx2780);
   ix3221 : mux21 port map ( Y=>nx3220, A0=>nx2161, A1=>nx2167, S0=>nx2185);
   ix3179 : xnor2 port map ( Y=>nx3178, A0=>nx1907, A1=>nx2792);
   ix3173 : xnor2 port map ( Y=>nx3172, A0=>nx2087, A1=>nx2792);
   ix2168 : nand02 port map ( Y=>nx2167, A0=>nx3202, A1=>nx2171);
   ix2172 : nor02 port map ( Y=>nx2171, A0=>nx2173, A1=>nx2183);
   ix2174 : nor02ii port map ( Y=>nx2173, A0=>nx2175, A1=>nx2179);
   ix2176 : oai21 port map ( Y=>nx2175, A0=>T12(0), A1=>T21(0), B0=>nx2177);
   ix2178 : nand02 port map ( Y=>nx2177, A0=>T21(0), A1=>T12(0));
   ix2180 : oai21 port map ( Y=>nx2179, A0=>T01(0), A1=>T10(0), B0=>nx2181);
   ix2182 : nand02 port map ( Y=>nx2181, A0=>T10(0), A1=>T01(0));
   ix2184 : nor02ii port map ( Y=>nx2183, A0=>nx2179, A1=>nx2175);
   ix2186 : xnor2 port map ( Y=>nx2185, A0=>nx2161, A1=>nx2187);
   ix3191 : xnor2 port map ( Y=>nx3190, A0=>nx2183, A1=>nx2170);
   ix2171 : xnor2 port map ( Y=>nx2170, A0=>nx2168, A1=>nx2166);
   ix2169 : xnor2 port map ( Y=>nx2168, A0=>nx2177, A1=>nx1990);
   ix1991 : xnor2 port map ( Y=>nx1990, A0=>T12(1), A1=>nx2197);
   ix2198 : oai21 port map ( Y=>nx2197, A0=>T21(1), A1=>T22(0), B0=>nx2199);
   ix2200 : nand02 port map ( Y=>nx2199, A0=>T22(0), A1=>T21(1));
   ix2167 : xnor2 port map ( Y=>nx2166, A0=>nx2181, A1=>nx1826);
   ix1827 : xnor2 port map ( Y=>nx1826, A0=>T01(1), A1=>nx2205);
   ix2206 : oai21 port map ( Y=>nx2205, A0=>T10(1), A1=>T00(0), B0=>nx2207);
   ix2208 : nand02 port map ( Y=>nx2207, A0=>T00(0), A1=>T10(1));
   ix3185 : xnor2 port map ( Y=>nx3184, A0=>nx2173, A1=>nx2170);
   ix2214 : nand02 port map ( Y=>nx2211, A0=>nx2228, A1=>nx462);
   ix2229 : mux21 port map ( Y=>nx2228, A0=>nx2054, A1=>nx2297, S0=>nx2066);
   ix2220 : nand02 port map ( Y=>nx2219, A0=>T00(7), A1=>nx1868);
   ix1869 : mux21 port map ( Y=>nx1868, A0=>nx2223, A1=>nx2247, S0=>nx2249);
   ix2224 : mux21 port map ( Y=>nx2223, A0=>nx1764, A1=>T10(6), S0=>nx2245);
   ix1765 : mux21 port map ( Y=>nx1764, A0=>nx2227, A1=>nx2241, S0=>nx2243);
   ix2228 : mux21 port map ( Y=>nx2227, A0=>nx1756, A1=>T10(4), S0=>nx2239);
   ix1757 : mux21 port map ( Y=>nx1756, A0=>nx2231, A1=>nx2235, S0=>nx2237);
   ix2232 : aoi32 port map ( Y=>nx2231, A0=>T00(0), A1=>T10(1), A2=>nx1742, 
      B0=>T10(2), B1=>T00(1));
   ix2236 : inv01 port map ( Y=>nx2235, A=>T10(3));
   ix2238 : xnor2 port map ( Y=>nx2237, A0=>T00(2), A1=>T10(3));
   ix2240 : xnor2 port map ( Y=>nx2239, A0=>T00(3), A1=>T10(4));
   ix2242 : inv01 port map ( Y=>nx2241, A=>T10(5));
   ix2244 : xnor2 port map ( Y=>nx2243, A0=>T00(4), A1=>T10(5));
   ix2246 : xnor2 port map ( Y=>nx2245, A0=>T00(5), A1=>T10(6));
   ix2248 : inv01 port map ( Y=>nx2247, A=>T10(7));
   ix2250 : xnor2 port map ( Y=>nx2249, A0=>T00(6), A1=>T10(7));
   ix1861 : mux21 port map ( Y=>nx1860, A0=>nx2255, A1=>nx2257, S0=>nx1774);
   ix2256 : xnor2 port map ( Y=>nx2255, A0=>nx2223, A1=>nx2249);
   ix2258 : mux21 port map ( Y=>nx2257, A0=>nx1852, A1=>nx1780, S0=>nx2291);
   ix1853 : mux21 port map ( Y=>nx1852, A0=>nx2261, A1=>nx2263, S0=>nx1790);
   ix2262 : xnor2 port map ( Y=>nx2261, A0=>nx2227, A1=>nx2243);
   ix2264 : mux21 port map ( Y=>nx2263, A0=>nx1844, A1=>nx1796, S0=>nx2285);
   ix1845 : mux21 port map ( Y=>nx1844, A0=>nx2267, A1=>nx2269, S0=>nx1806);
   ix2268 : xnor2 port map ( Y=>nx2267, A0=>nx2231, A1=>nx2237);
   ix2270 : aoi22 port map ( Y=>nx2269, A0=>nx1812, A1=>T01(2), B0=>nx1836, 
      B1=>nx1814);
   ix2274 : xnor2 port map ( Y=>nx2273, A0=>T00(1), A1=>T10(2));
   ix1837 : mux21 port map ( Y=>nx1836, A0=>nx2205, A1=>nx2181, S0=>nx1826);
   ix1815 : xnor2 port map ( Y=>nx1814, A0=>T01(2), A1=>nx2279);
   ix2280 : xnor2 port map ( Y=>nx2279, A0=>nx2207, A1=>nx2273);
   ix1807 : xnor2 port map ( Y=>nx1806, A0=>T01(3), A1=>nx2267);
   ix1797 : xnor2 port map ( Y=>nx1796, A0=>nx1756, A1=>nx2239);
   ix2286 : xnor2 port map ( Y=>nx2285, A0=>T01(4), A1=>nx1796);
   ix1791 : xnor2 port map ( Y=>nx1790, A0=>T01(5), A1=>nx2261);
   ix1781 : xnor2 port map ( Y=>nx1780, A0=>nx1764, A1=>nx2245);
   ix2292 : xnor2 port map ( Y=>nx2291, A0=>T01(6), A1=>nx1780);
   ix1775 : xnor2 port map ( Y=>nx1774, A0=>T01(7), A1=>nx2255);
   ix2298 : mux21 port map ( Y=>nx2297, A0=>nx2299, A1=>nx2220, S0=>nx2086);
   ix2302 : xnor2 port map ( Y=>nx2301, A0=>T00(7), A1=>nx1868);
   ix2221 : mux21 port map ( Y=>nx2220, A0=>nx2094, A1=>nx2307, S0=>nx2098);
   ix2095 : xnor2 port map ( Y=>nx2094, A0=>nx2257, A1=>nx1774);
   ix2308 : mux21 port map ( Y=>nx2307, A0=>nx2309, A1=>nx2212, S0=>nx2110);
   ix2213 : mux21 port map ( Y=>nx2212, A0=>nx2118, A1=>nx2315, S0=>nx2122);
   ix2119 : xnor2 port map ( Y=>nx2118, A0=>nx2263, A1=>nx1790);
   ix2316 : mux21 port map ( Y=>nx2315, A0=>nx2317, A1=>nx2204, S0=>nx2134);
   ix2205 : mux21 port map ( Y=>nx2204, A0=>nx2142, A1=>nx2323, S0=>nx2146);
   ix2143 : xnor2 port map ( Y=>nx2142, A0=>nx2269, A1=>nx1806);
   ix2324 : mux21 port map ( Y=>nx2323, A0=>nx2325, A1=>nx2196, S0=>nx2158);
   ix2326 : xnor2 port map ( Y=>nx2325, A0=>nx1836, A1=>nx1814);
   ix2197 : mux21 port map ( Y=>nx2196, A0=>nx2166, A1=>nx2183, S0=>nx2170);
   ix2159 : xnor2 port map ( Y=>nx2158, A0=>nx2331, A1=>nx2325);
   ix2332 : xnor2 port map ( Y=>nx2331, A0=>nx2000, A1=>nx1978);
   ix2001 : mux21 port map ( Y=>nx2000, A0=>nx2197, A1=>nx2177, S0=>nx1990);
   ix1979 : xnor2 port map ( Y=>nx1978, A0=>T12(2), A1=>nx2337);
   ix2338 : xnor2 port map ( Y=>nx2337, A0=>nx2199, A1=>nx2339);
   ix2340 : xnor2 port map ( Y=>nx2339, A0=>T22(1), A1=>T21(2));
   ix2147 : xnor2 port map ( Y=>nx2146, A0=>nx2144, A1=>nx2142);
   ix2145 : xnor2 port map ( Y=>nx2144, A0=>nx2345, A1=>nx1970);
   ix2346 : aoi22 port map ( Y=>nx2345, A0=>nx1976, A1=>T12(2), B0=>nx2000, 
      B1=>nx1978);
   ix1971 : xnor2 port map ( Y=>nx1970, A0=>T12(3), A1=>nx2351);
   ix2352 : xnor2 port map ( Y=>nx2351, A0=>nx2353, A1=>nx2359);
   ix2354 : aoi32 port map ( Y=>nx2353, A0=>T22(0), A1=>T21(1), A2=>nx1906, 
      B0=>T21(2), B1=>T22(1));
   ix2360 : xnor2 port map ( Y=>nx2359, A0=>T22(2), A1=>T21(3));
   ix2135 : xnor2 port map ( Y=>nx2134, A0=>nx2132, A1=>nx2130);
   ix2133 : xnor2 port map ( Y=>nx2132, A0=>nx2008, A1=>nx2367);
   ix2009 : mux21 port map ( Y=>nx2008, A0=>nx2351, A1=>nx2345, S0=>nx1970);
   ix2368 : xnor2 port map ( Y=>nx2367, A0=>T12(4), A1=>nx1960);
   ix1961 : xnor2 port map ( Y=>nx1960, A0=>nx1920, A1=>nx2375);
   ix1921 : mux21 port map ( Y=>nx1920, A0=>nx2353, A1=>nx2373, S0=>nx2359);
   ix2374 : inv01 port map ( Y=>nx2373, A=>T21(3));
   ix2376 : xnor2 port map ( Y=>nx2375, A0=>T22(3), A1=>T21(4));
   ix2131 : xnor2 port map ( Y=>nx2130, A0=>nx1844, A1=>nx2285);
   ix2123 : xnor2 port map ( Y=>nx2122, A0=>nx2120, A1=>nx2118);
   ix2121 : xnor2 port map ( Y=>nx2120, A0=>nx2383, A1=>nx1954);
   ix2384 : mux21 port map ( Y=>nx2383, A0=>nx2008, A1=>nx1960, S0=>nx2367);
   ix1955 : xnor2 port map ( Y=>nx1954, A0=>T12(5), A1=>nx2387);
   ix2388 : xnor2 port map ( Y=>nx2387, A0=>nx2389, A1=>nx2391);
   ix2390 : mux21 port map ( Y=>nx2389, A0=>nx1920, A1=>T21(4), S0=>nx2375);
   ix2392 : xnor2 port map ( Y=>nx2391, A0=>T22(4), A1=>T21(5));
   ix2111 : xnor2 port map ( Y=>nx2110, A0=>nx2108, A1=>nx2106);
   ix2109 : xnor2 port map ( Y=>nx2108, A0=>nx2016, A1=>nx2399);
   ix2017 : mux21 port map ( Y=>nx2016, A0=>nx2387, A1=>nx2383, S0=>nx1954);
   ix2400 : xnor2 port map ( Y=>nx2399, A0=>T12(6), A1=>nx1944);
   ix1945 : xnor2 port map ( Y=>nx1944, A0=>nx1928, A1=>nx2407);
   ix1929 : mux21 port map ( Y=>nx1928, A0=>nx2389, A1=>nx2405, S0=>nx2391);
   ix2406 : inv01 port map ( Y=>nx2405, A=>T21(5));
   ix2408 : xnor2 port map ( Y=>nx2407, A0=>T22(5), A1=>T21(6));
   ix2107 : xnor2 port map ( Y=>nx2106, A0=>nx1852, A1=>nx2291);
   ix2099 : xnor2 port map ( Y=>nx2098, A0=>nx2096, A1=>nx2094);
   ix2097 : xnor2 port map ( Y=>nx2096, A0=>nx2415, A1=>nx1938);
   ix2416 : mux21 port map ( Y=>nx2415, A0=>nx2016, A1=>nx1944, S0=>nx2399);
   ix1939 : xnor2 port map ( Y=>nx1938, A0=>T12(7), A1=>nx2419);
   ix2420 : xnor2 port map ( Y=>nx2419, A0=>nx2421, A1=>nx2423);
   ix2422 : mux21 port map ( Y=>nx2421, A0=>nx1928, A1=>T21(6), S0=>nx2407);
   ix2424 : xnor2 port map ( Y=>nx2423, A0=>T22(6), A1=>T21(7));
   ix2087 : xnor2 port map ( Y=>nx2086, A0=>nx2084, A1=>nx2078);
   ix2085 : xnor2 port map ( Y=>nx2084, A0=>nx2024, A1=>nx2431);
   ix2025 : mux21 port map ( Y=>nx2024, A0=>nx2419, A1=>nx2415, S0=>nx1938);
   ix2432 : xnor2 port map ( Y=>nx2431, A0=>T22(7), A1=>nx2032);
   ix2033 : mux21 port map ( Y=>nx2032, A0=>nx2421, A1=>nx2435, S0=>nx2423);
   ix2436 : inv01 port map ( Y=>nx2435, A=>T21(7));
   ix2079 : xnor2 port map ( Y=>nx2078, A0=>nx1860, A1=>nx2301);
   ix2067 : xnor2 port map ( Y=>nx2066, A0=>nx2441, A1=>nx2449);
   ix2444 : nor02ii port map ( Y=>nx2441, A0=>nx2042, A1=>nx2447);
   ix2043 : nor02ii port map ( Y=>nx2042, A0=>nx2431, A1=>nx2024);
   ix2448 : nand02 port map ( Y=>nx2447, A0=>T22(7), A1=>nx2032);
   ix2452 : nor02ii port map ( Y=>nx2449, A0=>nx1878, A1=>nx2219);
   ix1879 : nor02ii port map ( Y=>nx1878, A0=>nx2301, A1=>nx1860);
   ix2458 : xnor2 port map ( Y=>nx2457, A0=>nx3156, A1=>nx3168);
   ix2462 : xnor2 port map ( Y=>nx2461, A0=>nx2196, A1=>nx2158);
   ix2464 : xnor2 port map ( Y=>nx2463, A0=>nx2294, A1=>nx2158);
   ix2295 : mux21 port map ( Y=>nx2294, A0=>nx2168, A1=>nx2173, S0=>nx2170);
   ix2468 : xnor2 port map ( Y=>nx2467, A0=>nx2145, A1=>nx2469);
   ix3139 : xnor2 port map ( Y=>nx3138, A0=>nx2323, A1=>nx2146);
   ix3133 : xnor2 port map ( Y=>nx3132, A0=>nx2475, A1=>nx2146);
   ix2476 : mux21 port map ( Y=>nx2475, A0=>nx2331, A1=>nx2294, S0=>nx2158);
   ix2478 : xnor2 port map ( Y=>nx2477, A0=>nx3104, A1=>nx3116);
   ix2482 : xnor2 port map ( Y=>nx2481, A0=>nx2204, A1=>nx2134);
   ix2484 : xnor2 port map ( Y=>nx2483, A0=>nx2302, A1=>nx2134);
   ix2303 : mux21 port map ( Y=>nx2302, A0=>nx2144, A1=>nx2475, S0=>nx2146);
   ix2488 : xnor2 port map ( Y=>nx2487, A0=>nx2129, A1=>nx2489);
   ix3087 : xnor2 port map ( Y=>nx3086, A0=>nx2315, A1=>nx2122);
   ix3081 : xnor2 port map ( Y=>nx3080, A0=>nx2495, A1=>nx2122);
   ix2496 : mux21 port map ( Y=>nx2495, A0=>nx2497, A1=>nx2302, S0=>nx2134);
   ix2500 : xnor2 port map ( Y=>nx2499, A0=>nx3052, A1=>nx3064);
   ix2504 : xnor2 port map ( Y=>nx2503, A0=>nx2212, A1=>nx2110);
   ix2506 : xnor2 port map ( Y=>nx2505, A0=>nx2310, A1=>nx2110);
   ix2311 : mux21 port map ( Y=>nx2310, A0=>nx2120, A1=>nx2495, S0=>nx2122);
   ix2510 : xnor2 port map ( Y=>nx2509, A0=>nx2113, A1=>nx2511);
   ix3035 : xnor2 port map ( Y=>nx3034, A0=>nx2307, A1=>nx2098);
   ix3029 : xnor2 port map ( Y=>nx3028, A0=>nx2517, A1=>nx2098);
   ix2518 : mux21 port map ( Y=>nx2517, A0=>nx2519, A1=>nx2310, S0=>nx2110);
   ix2522 : xnor2 port map ( Y=>nx2521, A0=>nx3000, A1=>nx3012);
   ix2526 : xnor2 port map ( Y=>nx2525, A0=>nx2220, A1=>nx2086);
   ix2528 : xnor2 port map ( Y=>nx2527, A0=>nx2318, A1=>nx2086);
   ix2319 : mux21 port map ( Y=>nx2318, A0=>nx2096, A1=>nx2517, S0=>nx2098);
   ix2532 : xnor2 port map ( Y=>nx2531, A0=>nx2091, A1=>nx2533);
   ix2983 : xnor2 port map ( Y=>nx2982, A0=>nx2297, A1=>nx2066);
   ix2977 : xnor2 port map ( Y=>nx2976, A0=>nx2539, A1=>nx2066);
   ix2540 : mux21 port map ( Y=>nx2539, A0=>nx2541, A1=>nx2318, S0=>nx2086);
   ix2544 : xnor2 port map ( Y=>nx2543, A0=>nx2954, A1=>nx2332);
   ix2327 : mux21 port map ( Y=>nx2326, A0=>nx2060, A1=>nx2539, S0=>nx2066);
   ix3565 : mux21 port map ( Y=>nx3564, A0=>nx2561, A1=>nx3151, S0=>nx3393);
   ix2562 : nor02 port map ( Y=>nx2561, A0=>nx760, A1=>nx1382);
   ix645 : mux21 port map ( Y=>nx644, A0=>nx470, A1=>nx2659, S0=>nx482);
   ix2572 : nand02 port map ( Y=>nx2571, A0=>T02(7), A1=>nx284);
   ix285 : mux21 port map ( Y=>nx284, A0=>nx2575, A1=>nx2601, S0=>nx2603);
   ix2576 : mux21 port map ( Y=>nx2575, A0=>nx180, A1=>T01(6), S0=>nx2599);
   ix181 : mux21 port map ( Y=>nx180, A0=>nx2579, A1=>nx2595, S0=>nx2597);
   ix2580 : mux21 port map ( Y=>nx2579, A0=>nx172, A1=>T01(4), S0=>nx2593);
   ix173 : mux21 port map ( Y=>nx172, A0=>nx2583, A1=>nx2589, S0=>nx2591);
   ix2584 : aoi32 port map ( Y=>nx2583, A0=>T02(0), A1=>T01(1), A2=>nx158, 
      B0=>T01(2), B1=>T02(1));
   ix2588 : inv01 port map ( Y=>nx2587, A=>T01(2));
   ix2590 : inv01 port map ( Y=>nx2589, A=>T01(3));
   ix2592 : xnor2 port map ( Y=>nx2591, A0=>T02(2), A1=>T01(3));
   ix2594 : xnor2 port map ( Y=>nx2593, A0=>T02(3), A1=>T01(4));
   ix2596 : inv01 port map ( Y=>nx2595, A=>T01(5));
   ix2598 : xnor2 port map ( Y=>nx2597, A0=>T02(4), A1=>T01(5));
   ix2600 : xnor2 port map ( Y=>nx2599, A0=>T02(5), A1=>T01(6));
   ix2602 : inv01 port map ( Y=>nx2601, A=>T01(7));
   ix2604 : xnor2 port map ( Y=>nx2603, A0=>T02(6), A1=>T01(7));
   ix277 : mux21 port map ( Y=>nx276, A0=>nx2609, A1=>nx2611, S0=>nx190);
   ix2610 : xnor2 port map ( Y=>nx2609, A0=>nx2575, A1=>nx2603);
   ix2612 : mux21 port map ( Y=>nx2611, A0=>nx268, A1=>nx196, S0=>nx2653);
   ix269 : mux21 port map ( Y=>nx268, A0=>nx2615, A1=>nx2617, S0=>nx206);
   ix2616 : xnor2 port map ( Y=>nx2615, A0=>nx2579, A1=>nx2597);
   ix2618 : mux21 port map ( Y=>nx2617, A0=>nx260, A1=>nx212, S0=>nx2647);
   ix261 : mux21 port map ( Y=>nx260, A0=>nx2621, A1=>nx2623, S0=>nx222);
   ix2622 : xnor2 port map ( Y=>nx2621, A0=>nx2583, A1=>nx2591);
   ix2624 : aoi22 port map ( Y=>nx2623, A0=>nx228, A1=>T12(2), B0=>nx252, B1
      =>nx230);
   ix2628 : nand02 port map ( Y=>nx2627, A0=>T02(0), A1=>T01(1));
   ix2630 : xnor2 port map ( Y=>nx2629, A0=>T02(1), A1=>T01(2));
   ix253 : mux21 port map ( Y=>nx252, A0=>nx2633, A1=>nx2635, S0=>nx242);
   ix2634 : oai21 port map ( Y=>nx2633, A0=>T01(1), A1=>T02(0), B0=>nx2627);
   ix2636 : nand02 port map ( Y=>nx2635, A0=>T12(0), A1=>T01(0));
   ix243 : xnor2 port map ( Y=>nx242, A0=>T12(1), A1=>nx2633);
   ix231 : xnor2 port map ( Y=>nx230, A0=>T12(2), A1=>nx2641);
   ix2642 : xnor2 port map ( Y=>nx2641, A0=>nx2627, A1=>nx2629);
   ix223 : xnor2 port map ( Y=>nx222, A0=>T12(3), A1=>nx2621);
   ix213 : xnor2 port map ( Y=>nx212, A0=>nx172, A1=>nx2593);
   ix2648 : xnor2 port map ( Y=>nx2647, A0=>T12(4), A1=>nx212);
   ix207 : xnor2 port map ( Y=>nx206, A0=>T12(5), A1=>nx2615);
   ix197 : xnor2 port map ( Y=>nx196, A0=>nx180, A1=>nx2599);
   ix2654 : xnor2 port map ( Y=>nx2653, A0=>T12(6), A1=>nx196);
   ix191 : xnor2 port map ( Y=>nx190, A0=>T12(7), A1=>nx2609);
   ix2660 : mux21 port map ( Y=>nx2659, A0=>nx2661, A1=>nx636, S0=>nx502);
   ix2664 : xnor2 port map ( Y=>nx2663, A0=>T02(7), A1=>nx284);
   ix637 : mux21 port map ( Y=>nx636, A0=>nx510, A1=>nx2669, S0=>nx514);
   ix511 : xnor2 port map ( Y=>nx510, A0=>nx2611, A1=>nx190);
   ix2670 : mux21 port map ( Y=>nx2669, A0=>nx2671, A1=>nx628, S0=>nx526);
   ix629 : mux21 port map ( Y=>nx628, A0=>nx534, A1=>nx2677, S0=>nx538);
   ix535 : xnor2 port map ( Y=>nx534, A0=>nx2617, A1=>nx206);
   ix2678 : mux21 port map ( Y=>nx2677, A0=>nx2679, A1=>nx620, S0=>nx550);
   ix621 : mux21 port map ( Y=>nx620, A0=>nx558, A1=>nx2683, S0=>nx562);
   ix559 : xnor2 port map ( Y=>nx558, A0=>nx2623, A1=>nx222);
   ix2684 : mux21 port map ( Y=>nx2683, A0=>nx2685, A1=>nx612, S0=>nx574);
   ix2686 : xnor2 port map ( Y=>nx2685, A0=>nx252, A1=>nx230);
   ix613 : mux21 port map ( Y=>nx612, A0=>nx582, A1=>nx2689, S0=>nx586);
   ix583 : xnor2 port map ( Y=>nx582, A0=>nx2635, A1=>nx242);
   ix2690 : nor02ii port map ( Y=>nx2689, A0=>nx2691, A1=>nx2693);
   ix2692 : oai21 port map ( Y=>nx2691, A0=>T01(0), A1=>T12(0), B0=>nx2635);
   ix2694 : oai21 port map ( Y=>nx2693, A0=>T10(0), A1=>T21(0), B0=>nx2695);
   ix2696 : nand02 port map ( Y=>nx2695, A0=>T21(0), A1=>T10(0));
   ix587 : xnor2 port map ( Y=>nx586, A0=>nx584, A1=>nx582);
   ix585 : xnor2 port map ( Y=>nx584, A0=>nx2695, A1=>nx406);
   ix407 : xnor2 port map ( Y=>nx406, A0=>T21(1), A1=>nx2703);
   ix2704 : oai21 port map ( Y=>nx2703, A0=>T10(1), A1=>T20(0), B0=>nx2705);
   ix2706 : nand02 port map ( Y=>nx2705, A0=>T20(0), A1=>T10(1));
   ix575 : xnor2 port map ( Y=>nx574, A0=>nx2709, A1=>nx2685);
   ix2710 : xnor2 port map ( Y=>nx2709, A0=>nx416, A1=>nx394);
   ix417 : mux21 port map ( Y=>nx416, A0=>nx2703, A1=>nx2695, S0=>nx406);
   ix395 : xnor2 port map ( Y=>nx394, A0=>T21(2), A1=>nx2715);
   ix2716 : xnor2 port map ( Y=>nx2715, A0=>nx2705, A1=>nx2717);
   ix2718 : xnor2 port map ( Y=>nx2717, A0=>T20(1), A1=>T10(2));
   ix563 : xnor2 port map ( Y=>nx562, A0=>nx560, A1=>nx558);
   ix561 : xnor2 port map ( Y=>nx560, A0=>nx2723, A1=>nx386);
   ix2724 : aoi22 port map ( Y=>nx2723, A0=>nx392, A1=>T21(2), B0=>nx416, B1
      =>nx394);
   ix387 : xnor2 port map ( Y=>nx386, A0=>T21(3), A1=>nx2729);
   ix2730 : xnor2 port map ( Y=>nx2729, A0=>nx2731, A1=>nx2735);
   ix2732 : aoi32 port map ( Y=>nx2731, A0=>T20(0), A1=>T10(1), A2=>nx322, 
      B0=>T10(2), B1=>T20(1));
   ix2736 : xnor2 port map ( Y=>nx2735, A0=>T20(2), A1=>T10(3));
   ix551 : xnor2 port map ( Y=>nx550, A0=>nx548, A1=>nx546);
   ix549 : xnor2 port map ( Y=>nx548, A0=>nx424, A1=>nx2743);
   ix425 : mux21 port map ( Y=>nx424, A0=>nx2729, A1=>nx2723, S0=>nx386);
   ix2744 : xnor2 port map ( Y=>nx2743, A0=>T21(4), A1=>nx376);
   ix377 : xnor2 port map ( Y=>nx376, A0=>nx336, A1=>nx2749);
   ix337 : mux21 port map ( Y=>nx336, A0=>nx2731, A1=>nx2235, S0=>nx2735);
   ix2750 : xnor2 port map ( Y=>nx2749, A0=>T20(3), A1=>T10(4));
   ix547 : xnor2 port map ( Y=>nx546, A0=>nx260, A1=>nx2647);
   ix539 : xnor2 port map ( Y=>nx538, A0=>nx536, A1=>nx534);
   ix537 : xnor2 port map ( Y=>nx536, A0=>nx2757, A1=>nx370);
   ix2758 : mux21 port map ( Y=>nx2757, A0=>nx424, A1=>nx376, S0=>nx2743);
   ix371 : xnor2 port map ( Y=>nx370, A0=>T21(5), A1=>nx2761);
   ix2762 : xnor2 port map ( Y=>nx2761, A0=>nx2763, A1=>nx2765);
   ix2764 : mux21 port map ( Y=>nx2763, A0=>nx336, A1=>T10(4), S0=>nx2749);
   ix2766 : xnor2 port map ( Y=>nx2765, A0=>T20(4), A1=>T10(5));
   ix527 : xnor2 port map ( Y=>nx526, A0=>nx524, A1=>nx522);
   ix525 : xnor2 port map ( Y=>nx524, A0=>nx432, A1=>nx2773);
   ix433 : mux21 port map ( Y=>nx432, A0=>nx2761, A1=>nx2757, S0=>nx370);
   ix2774 : xnor2 port map ( Y=>nx2773, A0=>T21(6), A1=>nx360);
   ix361 : xnor2 port map ( Y=>nx360, A0=>nx344, A1=>nx2779);
   ix345 : mux21 port map ( Y=>nx344, A0=>nx2763, A1=>nx2241, S0=>nx2765);
   ix2780 : xnor2 port map ( Y=>nx2779, A0=>T20(5), A1=>T10(6));
   ix523 : xnor2 port map ( Y=>nx522, A0=>nx268, A1=>nx2653);
   ix515 : xnor2 port map ( Y=>nx514, A0=>nx512, A1=>nx510);
   ix513 : xnor2 port map ( Y=>nx512, A0=>nx2787, A1=>nx354);
   ix2788 : mux21 port map ( Y=>nx2787, A0=>nx432, A1=>nx360, S0=>nx2773);
   ix355 : xnor2 port map ( Y=>nx354, A0=>T21(7), A1=>nx2791);
   ix2792 : xnor2 port map ( Y=>nx2791, A0=>nx2793, A1=>nx2795);
   ix2794 : mux21 port map ( Y=>nx2793, A0=>nx344, A1=>T10(6), S0=>nx2779);
   ix2796 : xnor2 port map ( Y=>nx2795, A0=>T20(6), A1=>T10(7));
   ix503 : xnor2 port map ( Y=>nx502, A0=>nx500, A1=>nx494);
   ix501 : xnor2 port map ( Y=>nx500, A0=>nx440, A1=>nx2803);
   ix441 : mux21 port map ( Y=>nx440, A0=>nx2791, A1=>nx2787, S0=>nx354);
   ix2804 : xnor2 port map ( Y=>nx2803, A0=>T20(7), A1=>nx448);
   ix449 : mux21 port map ( Y=>nx448, A0=>nx2793, A1=>nx2247, S0=>nx2795);
   ix495 : xnor2 port map ( Y=>nx494, A0=>nx276, A1=>nx2663);
   ix483 : xnor2 port map ( Y=>nx482, A0=>nx2811, A1=>nx2819);
   ix2814 : nor02ii port map ( Y=>nx2811, A0=>nx458, A1=>nx2817);
   ix459 : nor02ii port map ( Y=>nx458, A0=>nx2803, A1=>nx440);
   ix2818 : nand02 port map ( Y=>nx2817, A0=>T20(7), A1=>nx448);
   ix2822 : nor02ii port map ( Y=>nx2819, A0=>nx294, A1=>nx2571);
   ix295 : nor02ii port map ( Y=>nx294, A0=>nx2663, A1=>nx276);
   ix755 : mux21 port map ( Y=>nx754, A0=>nx476, A1=>nx2833, S0=>nx482);
   ix2834 : mux21 port map ( Y=>nx2833, A0=>nx2835, A1=>nx722, S0=>nx502);
   ix723 : mux21 port map ( Y=>nx722, A0=>nx512, A1=>nx2839, S0=>nx514);
   ix2840 : mux21 port map ( Y=>nx2839, A0=>nx2841, A1=>nx714, S0=>nx526);
   ix715 : mux21 port map ( Y=>nx714, A0=>nx536, A1=>nx2845, S0=>nx538);
   ix2846 : mux21 port map ( Y=>nx2845, A0=>nx2847, A1=>nx706, S0=>nx550);
   ix707 : mux21 port map ( Y=>nx706, A0=>nx560, A1=>nx2851, S0=>nx562);
   ix2852 : mux21 port map ( Y=>nx2851, A0=>nx2709, A1=>nx698, S0=>nx574);
   ix699 : mux21 port map ( Y=>nx698, A0=>nx584, A1=>nx2855, S0=>nx586);
   ix2856 : nor02ii port map ( Y=>nx2855, A0=>nx2693, A1=>nx2691);
   ix1279 : mux21 port map ( Y=>nx1278, A0=>nx1104, A1=>nx2951, S0=>nx1116);
   ix2866 : nand02 port map ( Y=>nx2865, A0=>T01(7), A1=>nx918);
   ix919 : mux21 port map ( Y=>nx918, A0=>nx2869, A1=>nx2893, S0=>nx2895);
   ix2870 : mux21 port map ( Y=>nx2869, A0=>nx814, A1=>T01(5), S0=>nx2891);
   ix815 : mux21 port map ( Y=>nx814, A0=>nx2873, A1=>nx2887, S0=>nx2889);
   ix2874 : mux21 port map ( Y=>nx2873, A0=>nx806, A1=>T01(3), S0=>nx2885);
   ix807 : mux21 port map ( Y=>nx806, A0=>nx2877, A1=>nx2587, S0=>nx2883);
   ix2878 : aoi32 port map ( Y=>nx2877, A0=>T00(1), A1=>T01(0), A2=>nx792, 
      B0=>T01(1), B1=>T00(2));
   ix2884 : xnor2 port map ( Y=>nx2883, A0=>T00(3), A1=>T01(2));
   ix2886 : xnor2 port map ( Y=>nx2885, A0=>T00(4), A1=>T01(3));
   ix2888 : inv01 port map ( Y=>nx2887, A=>T01(4));
   ix2890 : xnor2 port map ( Y=>nx2889, A0=>T00(5), A1=>T01(4));
   ix2892 : xnor2 port map ( Y=>nx2891, A0=>T00(6), A1=>T01(5));
   ix2894 : inv01 port map ( Y=>nx2893, A=>T01(6));
   ix2896 : xnor2 port map ( Y=>nx2895, A0=>T00(7), A1=>T01(6));
   ix911 : mux21 port map ( Y=>nx910, A0=>nx2901, A1=>nx2903, S0=>nx824);
   ix2902 : xnor2 port map ( Y=>nx2901, A0=>nx2869, A1=>nx2895);
   ix2904 : mux21 port map ( Y=>nx2903, A0=>nx902, A1=>nx830, S0=>nx2945);
   ix903 : mux21 port map ( Y=>nx902, A0=>nx2907, A1=>nx2909, S0=>nx840);
   ix2908 : xnor2 port map ( Y=>nx2907, A0=>nx2873, A1=>nx2889);
   ix2910 : mux21 port map ( Y=>nx2909, A0=>nx894, A1=>nx846, S0=>nx2939);
   ix895 : mux21 port map ( Y=>nx894, A0=>nx2913, A1=>nx2915, S0=>nx856);
   ix2914 : xnor2 port map ( Y=>nx2913, A0=>nx2877, A1=>nx2883);
   ix2916 : aoi22 port map ( Y=>nx2915, A0=>nx862, A1=>T02(2), B0=>nx886, B1
      =>nx864);
   ix2920 : nand02 port map ( Y=>nx2919, A0=>T00(1), A1=>T01(0));
   ix2922 : xnor2 port map ( Y=>nx2921, A0=>T00(2), A1=>T01(1));
   ix887 : mux21 port map ( Y=>nx886, A0=>nx2925, A1=>nx2927, S0=>nx876);
   ix2926 : oai21 port map ( Y=>nx2925, A0=>T01(0), A1=>T00(1), B0=>nx2919);
   ix2928 : nand02 port map ( Y=>nx2927, A0=>T00(0), A1=>T02(0));
   ix877 : xnor2 port map ( Y=>nx876, A0=>T02(1), A1=>nx2925);
   ix865 : xnor2 port map ( Y=>nx864, A0=>T02(2), A1=>nx2933);
   ix2934 : xnor2 port map ( Y=>nx2933, A0=>nx2919, A1=>nx2921);
   ix857 : xnor2 port map ( Y=>nx856, A0=>T02(3), A1=>nx2913);
   ix847 : xnor2 port map ( Y=>nx846, A0=>nx806, A1=>nx2885);
   ix2940 : xnor2 port map ( Y=>nx2939, A0=>T02(4), A1=>nx846);
   ix841 : xnor2 port map ( Y=>nx840, A0=>T02(5), A1=>nx2907);
   ix831 : xnor2 port map ( Y=>nx830, A0=>nx814, A1=>nx2891);
   ix2946 : xnor2 port map ( Y=>nx2945, A0=>T02(6), A1=>nx830);
   ix825 : xnor2 port map ( Y=>nx824, A0=>T02(7), A1=>nx2901);
   ix2952 : mux21 port map ( Y=>nx2951, A0=>nx2953, A1=>nx1270, S0=>nx1136);
   ix2956 : xnor2 port map ( Y=>nx2955, A0=>T01(7), A1=>nx918);
   ix1271 : mux21 port map ( Y=>nx1270, A0=>nx1144, A1=>nx2961, S0=>nx1148);
   ix1145 : xnor2 port map ( Y=>nx1144, A0=>nx2903, A1=>nx824);
   ix2962 : mux21 port map ( Y=>nx2961, A0=>nx2963, A1=>nx1262, S0=>nx1160);
   ix1263 : mux21 port map ( Y=>nx1262, A0=>nx1168, A1=>nx2969, S0=>nx1172);
   ix1169 : xnor2 port map ( Y=>nx1168, A0=>nx2909, A1=>nx840);
   ix2970 : mux21 port map ( Y=>nx2969, A0=>nx2971, A1=>nx1254, S0=>nx1184);
   ix1255 : mux21 port map ( Y=>nx1254, A0=>nx1192, A1=>nx2977, S0=>nx1196);
   ix1193 : xnor2 port map ( Y=>nx1192, A0=>nx2915, A1=>nx856);
   ix2978 : mux21 port map ( Y=>nx2977, A0=>nx2979, A1=>nx1246, S0=>nx1208);
   ix2980 : xnor2 port map ( Y=>nx2979, A0=>nx886, A1=>nx864);
   ix1247 : mux21 port map ( Y=>nx1246, A0=>nx1216, A1=>nx2985, S0=>nx1220);
   ix1217 : xnor2 port map ( Y=>nx1216, A0=>nx2927, A1=>nx876);
   ix2986 : nor02ii port map ( Y=>nx2985, A0=>nx2987, A1=>nx2989);
   ix2988 : oai21 port map ( Y=>nx2987, A0=>T02(0), A1=>T00(0), B0=>nx2927);
   ix2990 : oai21 port map ( Y=>nx2989, A0=>T20(0), A1=>T22(0), B0=>nx2991);
   ix2992 : nand02 port map ( Y=>nx2991, A0=>T22(0), A1=>T20(0));
   ix1221 : xnor2 port map ( Y=>nx1220, A0=>nx1218, A1=>nx1216);
   ix1219 : xnor2 port map ( Y=>nx1218, A0=>nx2991, A1=>nx1040);
   ix1041 : xnor2 port map ( Y=>nx1040, A0=>T22(1), A1=>nx2997);
   ix2998 : oai21 port map ( Y=>nx2997, A0=>T20(1), A1=>T21(0), B0=>nx2999);
   ix3000 : nand02 port map ( Y=>nx2999, A0=>T21(0), A1=>T20(1));
   ix1209 : xnor2 port map ( Y=>nx1208, A0=>nx3003, A1=>nx2979);
   ix3004 : xnor2 port map ( Y=>nx3003, A0=>nx1050, A1=>nx1028);
   ix1051 : mux21 port map ( Y=>nx1050, A0=>nx2997, A1=>nx2991, S0=>nx1040);
   ix1029 : xnor2 port map ( Y=>nx1028, A0=>T22(2), A1=>nx3007);
   ix3008 : xnor2 port map ( Y=>nx3007, A0=>nx2999, A1=>nx3009);
   ix3010 : xnor2 port map ( Y=>nx3009, A0=>T21(1), A1=>T20(2));
   ix1197 : xnor2 port map ( Y=>nx1196, A0=>nx1194, A1=>nx1192);
   ix1195 : xnor2 port map ( Y=>nx1194, A0=>nx3015, A1=>nx1020);
   ix3016 : aoi22 port map ( Y=>nx3015, A0=>nx1026, A1=>T22(2), B0=>nx1050, 
      B1=>nx1028);
   ix1021 : xnor2 port map ( Y=>nx1020, A0=>T22(3), A1=>nx3021);
   ix3022 : xnor2 port map ( Y=>nx3021, A0=>nx3023, A1=>nx3029);
   ix3024 : aoi32 port map ( Y=>nx3023, A0=>T21(0), A1=>T20(1), A2=>nx956, 
      B0=>T20(2), B1=>T21(1));
   ix3030 : xnor2 port map ( Y=>nx3029, A0=>T21(2), A1=>T20(3));
   ix1185 : xnor2 port map ( Y=>nx1184, A0=>nx1182, A1=>nx1180);
   ix1183 : xnor2 port map ( Y=>nx1182, A0=>nx1058, A1=>nx3035);
   ix1059 : mux21 port map ( Y=>nx1058, A0=>nx3021, A1=>nx3015, S0=>nx1020);
   ix3036 : xnor2 port map ( Y=>nx3035, A0=>T22(4), A1=>nx1010);
   ix1011 : xnor2 port map ( Y=>nx1010, A0=>nx970, A1=>nx3043);
   ix971 : mux21 port map ( Y=>nx970, A0=>nx3023, A1=>nx3041, S0=>nx3029);
   ix3042 : inv01 port map ( Y=>nx3041, A=>T20(3));
   ix3044 : xnor2 port map ( Y=>nx3043, A0=>T21(3), A1=>T20(4));
   ix1181 : xnor2 port map ( Y=>nx1180, A0=>nx894, A1=>nx2939);
   ix1173 : xnor2 port map ( Y=>nx1172, A0=>nx1170, A1=>nx1168);
   ix1171 : xnor2 port map ( Y=>nx1170, A0=>nx3049, A1=>nx1004);
   ix3050 : mux21 port map ( Y=>nx3049, A0=>nx1058, A1=>nx1010, S0=>nx3035);
   ix1005 : xnor2 port map ( Y=>nx1004, A0=>T22(5), A1=>nx3053);
   ix3054 : xnor2 port map ( Y=>nx3053, A0=>nx3055, A1=>nx3057);
   ix3056 : mux21 port map ( Y=>nx3055, A0=>nx970, A1=>T20(4), S0=>nx3043);
   ix3058 : xnor2 port map ( Y=>nx3057, A0=>T21(4), A1=>T20(5));
   ix1161 : xnor2 port map ( Y=>nx1160, A0=>nx1158, A1=>nx1156);
   ix1159 : xnor2 port map ( Y=>nx1158, A0=>nx1066, A1=>nx3065);
   ix1067 : mux21 port map ( Y=>nx1066, A0=>nx3053, A1=>nx3049, S0=>nx1004);
   ix3066 : xnor2 port map ( Y=>nx3065, A0=>T22(6), A1=>nx994);
   ix995 : xnor2 port map ( Y=>nx994, A0=>nx978, A1=>nx3073);
   ix979 : mux21 port map ( Y=>nx978, A0=>nx3055, A1=>nx3071, S0=>nx3057);
   ix3072 : inv01 port map ( Y=>nx3071, A=>T20(5));
   ix3074 : xnor2 port map ( Y=>nx3073, A0=>T21(5), A1=>T20(6));
   ix1157 : xnor2 port map ( Y=>nx1156, A0=>nx902, A1=>nx2945);
   ix1149 : xnor2 port map ( Y=>nx1148, A0=>nx1146, A1=>nx1144);
   ix1147 : xnor2 port map ( Y=>nx1146, A0=>nx3081, A1=>nx988);
   ix3082 : mux21 port map ( Y=>nx3081, A0=>nx1066, A1=>nx994, S0=>nx3065);
   ix989 : xnor2 port map ( Y=>nx988, A0=>T22(7), A1=>nx3085);
   ix3086 : xnor2 port map ( Y=>nx3085, A0=>nx3087, A1=>nx3089);
   ix3088 : mux21 port map ( Y=>nx3087, A0=>nx978, A1=>T20(6), S0=>nx3073);
   ix3090 : xnor2 port map ( Y=>nx3089, A0=>T21(6), A1=>T20(7));
   ix1137 : xnor2 port map ( Y=>nx1136, A0=>nx1134, A1=>nx1128);
   ix1135 : xnor2 port map ( Y=>nx1134, A0=>nx1074, A1=>nx3097);
   ix1075 : mux21 port map ( Y=>nx1074, A0=>nx3085, A1=>nx3081, S0=>nx988);
   ix3098 : xnor2 port map ( Y=>nx3097, A0=>T21(7), A1=>nx1082);
   ix1083 : mux21 port map ( Y=>nx1082, A0=>nx3087, A1=>nx3101, S0=>nx3089);
   ix3102 : inv01 port map ( Y=>nx3101, A=>T20(7));
   ix1129 : xnor2 port map ( Y=>nx1128, A0=>nx910, A1=>nx2955);
   ix1117 : xnor2 port map ( Y=>nx1116, A0=>nx3107, A1=>nx3113);
   ix3109 : nor02ii port map ( Y=>nx3107, A0=>nx1092, A1=>nx3111);
   ix1093 : nor02ii port map ( Y=>nx1092, A0=>nx3097, A1=>nx1074);
   ix3112 : nand02 port map ( Y=>nx3111, A0=>T21(7), A1=>nx1082);
   ix3116 : nor02ii port map ( Y=>nx3113, A0=>nx928, A1=>nx2865);
   ix929 : nor02ii port map ( Y=>nx928, A0=>nx2955, A1=>nx910);
   ix1377 : mux21 port map ( Y=>nx1376, A0=>nx1110, A1=>nx3127, S0=>nx1116);
   ix3128 : mux21 port map ( Y=>nx3127, A0=>nx3129, A1=>nx1368, S0=>nx1136);
   ix1369 : mux21 port map ( Y=>nx1368, A0=>nx1146, A1=>nx3133, S0=>nx1148);
   ix3134 : mux21 port map ( Y=>nx3133, A0=>nx3135, A1=>nx1360, S0=>nx1160);
   ix1361 : mux21 port map ( Y=>nx1360, A0=>nx1170, A1=>nx3139, S0=>nx1172);
   ix3140 : mux21 port map ( Y=>nx3139, A0=>nx3141, A1=>nx1352, S0=>nx1184);
   ix1353 : mux21 port map ( Y=>nx1352, A0=>nx1194, A1=>nx3145, S0=>nx1196);
   ix3146 : mux21 port map ( Y=>nx3145, A0=>nx3003, A1=>nx1344, S0=>nx1208);
   ix1345 : mux21 port map ( Y=>nx1344, A0=>nx1218, A1=>nx3149, S0=>nx1220);
   ix3150 : nor02ii port map ( Y=>nx3149, A0=>nx2989, A1=>nx2987);
   ix3152 : mux21 port map ( Y=>nx3151, A0=>nx3310, A1=>nx3548, S0=>nx3389);
   ix3311 : mux21 port map ( Y=>nx3310, A0=>nx3155, A1=>nx3167, S0=>nx3837);
   ix1399 : xnor2 port map ( Y=>nx1398, A0=>nx2659, A1=>nx482);
   ix1393 : xnor2 port map ( Y=>nx1392, A0=>nx2833, A1=>nx482);
   ix3164 : nand02 port map ( Y=>nx3161, A0=>nx644, A1=>nx462);
   ix1411 : xnor2 port map ( Y=>nx1410, A0=>nx2951, A1=>nx1116);
   ix1405 : xnor2 port map ( Y=>nx1404, A0=>nx3127, A1=>nx1116);
   ix3175 : nand02 port map ( Y=>nx3173, A0=>nx1278, A1=>nx462);
   ix3180 : mux21 port map ( Y=>nx3179, A0=>nx760, A1=>nx1700, S0=>nx3317);
   ix1701 : mux21 port map ( Y=>nx1700, A0=>nx3155, A1=>nx3183, S0=>nx3315);
   ix3184 : mux21 port map ( Y=>nx3183, A0=>nx734, A1=>nx1684, S0=>nx3307);
   ix3188 : xnor2 port map ( Y=>nx3187, A0=>nx636, A1=>nx502);
   ix3190 : xnor2 port map ( Y=>nx3189, A0=>nx722, A1=>nx502);
   ix1685 : mux21 port map ( Y=>nx1684, A0=>nx3193, A1=>nx3199, S0=>nx3301);
   ix1439 : xnor2 port map ( Y=>nx1438, A0=>nx2669, A1=>nx514);
   ix1433 : xnor2 port map ( Y=>nx1432, A0=>nx2839, A1=>nx514);
   ix3200 : mux21 port map ( Y=>nx3199, A0=>nx1468, A1=>nx1668, S0=>nx3293);
   ix3204 : xnor2 port map ( Y=>nx3203, A0=>nx628, A1=>nx526);
   ix3206 : xnor2 port map ( Y=>nx3205, A0=>nx714, A1=>nx526);
   ix1669 : mux21 port map ( Y=>nx1668, A0=>nx3209, A1=>nx3215, S0=>nx3285);
   ix1491 : xnor2 port map ( Y=>nx1490, A0=>nx2677, A1=>nx538);
   ix1485 : xnor2 port map ( Y=>nx1484, A0=>nx2845, A1=>nx538);
   ix3216 : mux21 port map ( Y=>nx3215, A0=>nx1520, A1=>nx1652, S0=>nx3277);
   ix3220 : xnor2 port map ( Y=>nx3219, A0=>nx620, A1=>nx550);
   ix3222 : xnor2 port map ( Y=>nx3221, A0=>nx706, A1=>nx550);
   ix1653 : mux21 port map ( Y=>nx1652, A0=>nx3225, A1=>nx3231, S0=>nx3269);
   ix1543 : xnor2 port map ( Y=>nx1542, A0=>nx2683, A1=>nx562);
   ix1537 : xnor2 port map ( Y=>nx1536, A0=>nx2851, A1=>nx562);
   ix3232 : mux21 port map ( Y=>nx3231, A0=>nx1572, A1=>nx1636, S0=>nx3261);
   ix3236 : xnor2 port map ( Y=>nx3235, A0=>nx612, A1=>nx574);
   ix3238 : xnor2 port map ( Y=>nx3237, A0=>nx698, A1=>nx574);
   ix1637 : mux21 port map ( Y=>nx1636, A0=>nx3241, A1=>nx3247, S0=>nx3253);
   ix1595 : xnor2 port map ( Y=>nx1594, A0=>nx2689, A1=>nx586);
   ix1589 : xnor2 port map ( Y=>nx1588, A0=>nx2855, A1=>nx586);
   ix3248 : nand02 port map ( Y=>nx3247, A0=>nx1618, A1=>nx3251);
   ix3252 : nor02 port map ( Y=>nx3251, A0=>nx3149, A1=>nx2985);
   ix3254 : xnor2 port map ( Y=>nx3253, A0=>nx3241, A1=>nx3255);
   ix1607 : xnor2 port map ( Y=>nx1606, A0=>nx2985, A1=>nx1220);
   ix1601 : xnor2 port map ( Y=>nx1600, A0=>nx3149, A1=>nx1220);
   ix3262 : xnor2 port map ( Y=>nx3261, A0=>nx1572, A1=>nx1584);
   ix3266 : xnor2 port map ( Y=>nx3265, A0=>nx1246, A1=>nx1208);
   ix3268 : xnor2 port map ( Y=>nx3267, A0=>nx1344, A1=>nx1208);
   ix3270 : xnor2 port map ( Y=>nx3269, A0=>nx3225, A1=>nx3271);
   ix1555 : xnor2 port map ( Y=>nx1554, A0=>nx2977, A1=>nx1196);
   ix1549 : xnor2 port map ( Y=>nx1548, A0=>nx3145, A1=>nx1196);
   ix3278 : xnor2 port map ( Y=>nx3277, A0=>nx1520, A1=>nx1532);
   ix3282 : xnor2 port map ( Y=>nx3281, A0=>nx1254, A1=>nx1184);
   ix3284 : xnor2 port map ( Y=>nx3283, A0=>nx1352, A1=>nx1184);
   ix3286 : xnor2 port map ( Y=>nx3285, A0=>nx3209, A1=>nx3287);
   ix1503 : xnor2 port map ( Y=>nx1502, A0=>nx2969, A1=>nx1172);
   ix1497 : xnor2 port map ( Y=>nx1496, A0=>nx3139, A1=>nx1172);
   ix3294 : xnor2 port map ( Y=>nx3293, A0=>nx1468, A1=>nx1480);
   ix3298 : xnor2 port map ( Y=>nx3297, A0=>nx1262, A1=>nx1160);
   ix3300 : xnor2 port map ( Y=>nx3299, A0=>nx1360, A1=>nx1160);
   ix3302 : xnor2 port map ( Y=>nx3301, A0=>nx3193, A1=>nx3303);
   ix1451 : xnor2 port map ( Y=>nx1450, A0=>nx2961, A1=>nx1148);
   ix1445 : xnor2 port map ( Y=>nx1444, A0=>nx3133, A1=>nx1148);
   ix3308 : xnor2 port map ( Y=>nx3307, A0=>nx734, A1=>nx1428);
   ix3312 : xnor2 port map ( Y=>nx3311, A0=>nx1270, A1=>nx1136);
   ix3314 : xnor2 port map ( Y=>nx3313, A0=>nx1368, A1=>nx1136);
   ix3316 : xnor2 port map ( Y=>nx3315, A0=>nx3155, A1=>nx3167);
   ix3318 : xnor2 port map ( Y=>nx3317, A0=>nx760, A1=>nx1382);
   ix3549 : mux21 port map ( Y=>nx3548, A0=>nx3321, A1=>nx3323, S0=>nx3385);
   ix3322 : mux21 port map ( Y=>nx3321, A0=>nx734, A1=>nx1428, S0=>nx3837);
   ix3324 : mux21 port map ( Y=>nx3323, A0=>nx3346, A1=>nx3532, S0=>nx3381);
   ix3347 : mux21 port map ( Y=>nx3346, A0=>nx3193, A1=>nx3303, S0=>nx3837);
   ix3533 : mux21 port map ( Y=>nx3532, A0=>nx3329, A1=>nx3331, S0=>nx3377);
   ix3330 : mux21 port map ( Y=>nx3329, A0=>nx1468, A1=>nx1480, S0=>nx3837);
   ix3332 : mux21 port map ( Y=>nx3331, A0=>nx3382, A1=>nx3516, S0=>nx3373);
   ix3383 : mux21 port map ( Y=>nx3382, A0=>nx3209, A1=>nx3287, S0=>nx3837);
   ix3517 : mux21 port map ( Y=>nx3516, A0=>nx3337, A1=>nx3339, S0=>nx3369);
   ix3338 : mux21 port map ( Y=>nx3337, A0=>nx1520, A1=>nx1532, S0=>nx3837);
   ix3340 : mux21 port map ( Y=>nx3339, A0=>nx3418, A1=>nx3500, S0=>nx3365);
   ix3419 : mux21 port map ( Y=>nx3418, A0=>nx3225, A1=>nx3271, S0=>nx3839);
   ix3501 : mux21 port map ( Y=>nx3500, A0=>nx3343, A1=>nx3345, S0=>nx3361);
   ix3344 : mux21 port map ( Y=>nx3343, A0=>nx1572, A1=>nx1584, S0=>nx3839);
   ix3346 : mux21 port map ( Y=>nx3345, A0=>nx3454, A1=>nx3484, S0=>nx3357);
   ix3455 : mux21 port map ( Y=>nx3454, A0=>nx3241, A1=>nx3255, S0=>nx3839);
   ix3485 : nor02ii port map ( Y=>nx3484, A0=>nx3480, A1=>nx3472);
   ix3352 : nor02 port map ( Y=>nx3351, A0=>nx2087, A1=>nx1907);
   ix3473 : mux21 port map ( Y=>nx3472, A0=>nx3355, A1=>nx3251, S0=>nx3839);
   ix3356 : nor02 port map ( Y=>nx3355, A0=>nx2855, A1=>nx2689);
   ix3358 : xnor2 port map ( Y=>nx3357, A0=>nx3454, A1=>nx3462);
   ix3362 : xnor2 port map ( Y=>nx3361, A0=>nx3343, A1=>nx3363);
   ix3366 : xnor2 port map ( Y=>nx3365, A0=>nx3418, A1=>nx3426);
   ix3370 : xnor2 port map ( Y=>nx3369, A0=>nx3337, A1=>nx3371);
   ix3374 : xnor2 port map ( Y=>nx3373, A0=>nx3382, A1=>nx3390);
   ix3378 : xnor2 port map ( Y=>nx3377, A0=>nx3329, A1=>nx3379);
   ix3382 : xnor2 port map ( Y=>nx3381, A0=>nx3346, A1=>nx3354);
   ix3386 : xnor2 port map ( Y=>nx3385, A0=>nx3321, A1=>nx3387);
   ix3390 : xnor2 port map ( Y=>nx3389, A0=>nx3310, A1=>nx3318);
   ix3394 : xnor2 port map ( Y=>nx3393, A0=>nx2561, A1=>nx3395);
   ix3396 : nor02 port map ( Y=>nx3395, A0=>nx2954, A1=>nx2332);
   ix3905 : nand03 port map ( Y=>EDGE_dup0, A0=>nx3411, A1=>nx3637, A2=>
      nx3639);
   ix3414 : nand03 port map ( Y=>nx3413, A0=>nx3826, A1=>nx3866, A2=>nx3874
   );
   ix3867 : mux21 port map ( Y=>nx3866, A0=>nx3419, A1=>nx3617, S0=>nx3629);
   ix3420 : mux21 port map ( Y=>nx3419, A0=>nx3786, A1=>nx3764, S0=>nx3788);
   ix3428 : nand02 port map ( Y=>nx3427, A0=>nx3839, A1=>nx3798);
   ix3765 : mux21 port map ( Y=>nx3764, A0=>nx3451, A1=>nx3586, S0=>nx3589);
   ix3452 : mux21 port map ( Y=>nx3451, A0=>nx3622, A1=>nx3756, S0=>nx3632);
   ix3757 : mux21 port map ( Y=>nx3756, A0=>nx3475, A1=>nx3555, S0=>nx3559);
   ix3476 : mux21 port map ( Y=>nx3475, A0=>nx3678, A1=>nx3748, S0=>nx3688);
   ix3749 : mux21 port map ( Y=>nx3748, A0=>nx3499, A1=>nx3523, S0=>nx3527);
   ix3504 : aoi221 port map ( Y=>nx3503, A0=>nx3142, A1=>nx3806, B0=>nx1546, 
      B1=>nx3804, C0=>nx3740);
   ix3741 : oai22 port map ( Y=>nx3740, A0=>nx2145, A1=>nx3841, B0=>nx3271, 
      B1=>nx3407);
   ix3524 : aoi221 port map ( Y=>nx3523, A0=>nx3116, A1=>nx3806, B0=>nx1520, 
      B1=>nx3804, C0=>nx3704);
   ix3705 : ao22 port map ( Y=>nx3704, A0=>nx3104, A1=>nx3588, B0=>nx1532, 
      B1=>nx3580);
   ix3528 : xnor2 port map ( Y=>nx3527, A0=>nx3529, A1=>nx3523);
   ix3689 : xnor2 port map ( Y=>nx3688, A0=>nx3686, A1=>nx3535);
   ix3536 : aoi221 port map ( Y=>nx3535, A0=>nx3090, A1=>nx3806, B0=>nx1494, 
      B1=>nx3804, C0=>nx3676);
   ix3677 : oai22 port map ( Y=>nx3676, A0=>nx2129, A1=>nx3841, B0=>nx3287, 
      B1=>nx3407);
   ix3556 : aoi221 port map ( Y=>nx3555, A0=>nx3064, A1=>nx3806, B0=>nx1468, 
      B1=>nx3804, C0=>nx3648);
   ix3649 : ao22 port map ( Y=>nx3648, A0=>nx3052, A1=>nx3588, B0=>nx1480, 
      B1=>nx3580);
   ix3560 : xnor2 port map ( Y=>nx3559, A0=>nx3561, A1=>nx3555);
   ix3633 : xnor2 port map ( Y=>nx3632, A0=>nx3630, A1=>nx3567);
   ix3568 : aoi221 port map ( Y=>nx3567, A0=>nx3038, A1=>nx3806, B0=>nx1442, 
      B1=>nx3804, C0=>nx3620);
   ix3621 : oai22 port map ( Y=>nx3620, A0=>nx2113, A1=>nx3841, B0=>nx3303, 
      B1=>nx3407);
   ix3587 : aoi221 port map ( Y=>nx3586, A0=>nx3012, A1=>nx3574, B0=>nx734, 
      B1=>nx3568, C0=>nx3592);
   ix3593 : ao22 port map ( Y=>nx3592, A0=>nx3000, A1=>nx3588, B0=>nx1428, 
      B1=>nx3580);
   ix3590 : xnor2 port map ( Y=>nx3589, A0=>nx3591, A1=>nx3586);
   ix3789 : xnor2 port map ( Y=>nx3788, A0=>nx3772, A1=>nx3597);
   ix3598 : aoi221 port map ( Y=>nx3597, A0=>nx2986, A1=>nx3574, B0=>nx1402, 
      B1=>nx3568, C0=>nx3784);
   ix3785 : oai22 port map ( Y=>nx3784, A0=>nx2091, A1=>nx3841, B0=>nx3167, 
      B1=>nx3407);
   ix3618 : aoi221 port map ( Y=>nx3617, A0=>nx2332, A1=>nx3574, B0=>nx760, 
      B1=>nx3568, C0=>nx3838);
   ix3630 : xnor2 port map ( Y=>nx3629, A0=>nx3631, A1=>nx3617);
   ix3899 : nand02 port map ( Y=>nx3898, A0=>nx2561, A1=>nx3395);
   ix3638 : xnor2 port map ( Y=>nx3637, A0=>nx3419, A1=>nx3629);
   ix3640 : aoi22 port map ( Y=>nx3639, A0=>nx3790, A1=>nx3816, B0=>nx3413, 
      B1=>nx3882);
   ix3817 : oai21 port map ( Y=>nx3816, A0=>nx3645, A1=>nx3647, B0=>nx3659);
   ix3646 : xnor2 port map ( Y=>nx3645, A0=>nx3756, A1=>nx3632);
   ix3650 : xnor2 port map ( Y=>nx3649, A0=>nx3748, A1=>nx3688);
   ix3652 : xor2 port map ( Y=>nx3651, A0=>nx3744, A1=>nx3527);
   ix3745 : nor02 port map ( Y=>nx3744, A0=>nx3501, A1=>nx3503);
   ix3656 : xnor2 port map ( Y=>nx3655, A0=>nx3501, A1=>nx3503);
   ix3658 : xnor2 port map ( Y=>nx3657, A0=>nx3475, A1=>nx3559);
   ix3660 : xnor2 port map ( Y=>nx3659, A0=>nx3451, A1=>nx3589);
   ix3927 : aoi21 port map ( Y=>DIRECTION(2), A0=>nx3407, A1=>nx3843, B0=>
      nx3667);
   ix3901 : xnor2 port map ( Y=>nx3900, A0=>nx3413, A1=>nx3898);
   ix3678 : nor03 port map ( Y=>nx3677, A0=>nx3874, A1=>nx3866, A2=>nx3826);
   ix3680 : xnor2 port map ( Y=>nx3679, A0=>nx3764, A1=>nx3788);
   ix3813 : nand04 port map ( Y=>nx3812, A0=>nx3649, A1=>nx3651, A2=>nx3655, 
      A3=>nx3657);
   ix133 : or02 port map ( Y=>O_VALID, A0=>READY_dup0, A1=>fsm_inst_state_4
   );
   fsm_inst_reg_state_1 : dffr port map ( Q=>READY_dup0, QB=>OPEN, D=>nx12, 
      CLK=>CLOCK, R=>RESET);
   ix13 : oai21 port map ( Y=>nx12, A0=>I_VALID, A1=>nx3695, B0=>nx3701);
   ix3696 : nor02 port map ( Y=>nx3695, A0=>fsm_inst_state_0, A1=>READY_dup0
   );
   fsm_inst_reg_state_0 : dffs_ni port map ( Q=>fsm_inst_state_0, QB=>OPEN, 
      D=>nx1607, CLK=>CLOCK, S=>RESET);
   fsm_inst_reg_state_4 : dffr port map ( Q=>fsm_inst_state_4, QB=>nx3701, D
      =>nx126, CLK=>CLOCK, R=>RESET);
   timed_signal_inst_reg_finished : dffr port map ( Q=>timer_finished, QB=>
      OPEN, D=>nx3810, CLK=>CLOCK, R=>nx3796);
   ix1764 : nand02 port map ( Y=>nx1763, A0=>nx3863, A1=>nx1677);
   timed_signal_inst_reg_time_remaining_7 : dffr port map ( Q=>OPEN, QB=>
      nx3711, D=>nx1763, CLK=>CLOCK, R=>nx3794);
   fsm_inst_reg_state_3 : dffr port map ( Q=>OPEN, QB=>nx3719, D=>nx20, CLK
      =>CLOCK, R=>RESET);
   ix21 : inv01 port map ( Y=>nx20, A=>nx3717);
   ix3718 : oai21 port map ( Y=>nx3717, A0=>fsm_inst_state_0, A1=>READY_dup0, 
      B0=>I_VALID);
   ix105 : nand02 port map ( Y=>nx1677, A0=>nx3721, A1=>nx3773);
   ix81 : nand02 port map ( Y=>nx1679, A0=>nx3725, A1=>nx3759);
   timed_signal_inst_reg_time_remaining_0 : dffr port map ( Q=>
      timed_signal_inst_time_remaining_0, QB=>OPEN, D=>nx1693, CLK=>CLOCK, R
      =>nx3794);
   ix3736 : aoi21 port map ( Y=>nx3735, A0=>
      timed_signal_inst_time_remaining_1, A1=>
      timed_signal_inst_time_remaining_0, B0=>nx3737);
   timed_signal_inst_reg_time_remaining_1 : dffr port map ( Q=>
      timed_signal_inst_time_remaining_1, QB=>nx3739, D=>nx1703, CLK=>CLOCK, 
      R=>nx3794);
   timed_signal_inst_reg_time_remaining_2 : dffs_ni port map ( Q=>
      timed_signal_inst_time_remaining_2, QB=>nx3747, D=>nx1713, CLK=>CLOCK, 
      S=>nx3794);
   ix3756 : nor03 port map ( Y=>nx3755, A0=>
      timed_signal_inst_time_remaining_0, A1=>
      timed_signal_inst_time_remaining_1, A2=>
      timed_signal_inst_time_remaining_2);
   timed_signal_inst_reg_time_remaining_3 : dffr port map ( Q=>OPEN, QB=>
      nx3757, D=>nx1723, CLK=>CLOCK, R=>nx3794);
   timed_signal_inst_reg_time_remaining_4 : dffr port map ( Q=>OPEN, QB=>
      nx3759, D=>nx1733, CLK=>CLOCK, R=>nx3794);
   ix3770 : aoi21 port map ( Y=>nx3769, A0=>
      timed_signal_inst_time_remaining_5, A1=>nx1679, B0=>nx3721);
   timed_signal_inst_reg_time_remaining_5 : dffr port map ( Q=>
      timed_signal_inst_time_remaining_5, QB=>nx3771, D=>nx1743, CLK=>CLOCK, 
      R=>nx3796);
   timed_signal_inst_reg_time_remaining_6 : dffr port map ( Q=>OPEN, QB=>
      nx3773, D=>nx1753, CLK=>CLOCK, R=>nx3796);
   ix121 : oai21 port map ( Y=>nx120, A0=>timer_finished, A1=>nx3785, B0=>
      nx3719);
   fsm_inst_reg_state_2 : dffr port map ( Q=>OPEN, QB=>nx3785, D=>nx120, CLK
      =>CLOCK, R=>RESET);
   ix3412 : inv01 port map ( Y=>nx3411, A=>nx3900);
   ix3883 : inv01 port map ( Y=>nx3882, A=>nx3677);
   ix3648 : inv01 port map ( Y=>nx3647, A=>nx3812);
   ix3791 : inv01 port map ( Y=>nx3790, A=>nx3679);
   ix3787 : inv01 port map ( Y=>nx3786, A=>nx3597);
   ix3500 : inv01 port map ( Y=>nx3499, A=>nx3744);
   ix3679 : inv01 port map ( Y=>nx3678, A=>nx3535);
   ix3623 : inv01 port map ( Y=>nx3622, A=>nx3567);
   ix3408 : inv01 port map ( Y=>nx3407, A=>nx3580);
   ix3569 : inv01 port map ( Y=>nx3568, A=>nx3427);
   ix3402 : inv01 port map ( Y=>nx3401, A=>nx3564);
   ix3203 : inv01 port map ( Y=>nx3202, A=>nx3351);
   ix3143 : inv01 port map ( Y=>nx3142, A=>nx2469);
   ix3091 : inv01 port map ( Y=>nx3090, A=>nx2489);
   ix3039 : inv01 port map ( Y=>nx3038, A=>nx2511);
   ix2987 : inv01 port map ( Y=>nx2986, A=>nx2533);
   ix2853 : inv01 port map ( Y=>nx2852, A=>nx2097);
   ix2080 : inv01 port map ( Y=>nx2079, A=>nx2754);
   ix1894 : inv01 port map ( Y=>nx1893, A=>nx2752);
   ix2074 : inv01 port map ( Y=>nx2073, A=>nx2730);
   ix1886 : inv01 port map ( Y=>nx1885, A=>nx2728);
   ix2068 : inv01 port map ( Y=>nx2067, A=>nx2706);
   ix1876 : inv01 port map ( Y=>nx1875, A=>nx2700);
   ix2683 : inv01 port map ( Y=>nx2682, A=>nx2037);
   ix2677 : inv01 port map ( Y=>nx2676, A=>nx2045);
   ix2599 : inv01 port map ( Y=>nx2598, A=>nx1933);
   ix2529 : inv01 port map ( Y=>nx2528, A=>nx1935);
   ix2435 : inv01 port map ( Y=>nx2434, A=>nx1855);
   ix2365 : inv01 port map ( Y=>nx2364, A=>nx1843);
   ix2231 : inv01 port map ( Y=>nx2230, A=>nx2211);
   ix2498 : inv01 port map ( Y=>nx2497, A=>nx2132);
   ix2318 : inv01 port map ( Y=>nx2317, A=>nx2130);
   ix2520 : inv01 port map ( Y=>nx2519, A=>nx2108);
   ix2310 : inv01 port map ( Y=>nx2309, A=>nx2106);
   ix2542 : inv01 port map ( Y=>nx2541, A=>nx2084);
   ix2300 : inv01 port map ( Y=>nx2299, A=>nx2078);
   ix2061 : inv01 port map ( Y=>nx2060, A=>nx2441);
   ix2055 : inv01 port map ( Y=>nx2054, A=>nx2449);
   ix1977 : inv01 port map ( Y=>nx1976, A=>nx2337);
   ix1907 : inv01 port map ( Y=>nx1906, A=>nx2339);
   ix1813 : inv01 port map ( Y=>nx1812, A=>nx2279);
   ix1743 : inv01 port map ( Y=>nx1742, A=>nx2273);
   ix1619 : inv01 port map ( Y=>nx1618, A=>nx3355);
   ix1547 : inv01 port map ( Y=>nx1546, A=>nx3225);
   ix1495 : inv01 port map ( Y=>nx1494, A=>nx3209);
   ix1443 : inv01 port map ( Y=>nx1442, A=>nx3193);
   ix1403 : inv01 port map ( Y=>nx1402, A=>nx3155);
   ix1281 : inv01 port map ( Y=>nx1280, A=>nx3173);
   ix3142 : inv01 port map ( Y=>nx3141, A=>nx1182);
   ix2972 : inv01 port map ( Y=>nx2971, A=>nx1180);
   ix3136 : inv01 port map ( Y=>nx3135, A=>nx1158);
   ix2964 : inv01 port map ( Y=>nx2963, A=>nx1156);
   ix3130 : inv01 port map ( Y=>nx3129, A=>nx1134);
   ix2954 : inv01 port map ( Y=>nx2953, A=>nx1128);
   ix1111 : inv01 port map ( Y=>nx1110, A=>nx3107);
   ix1105 : inv01 port map ( Y=>nx1104, A=>nx3113);
   ix1027 : inv01 port map ( Y=>nx1026, A=>nx3007);
   ix957 : inv01 port map ( Y=>nx956, A=>nx3009);
   ix863 : inv01 port map ( Y=>nx862, A=>nx2933);
   ix793 : inv01 port map ( Y=>nx792, A=>nx2921);
   ix647 : inv01 port map ( Y=>nx646, A=>nx3161);
   ix2848 : inv01 port map ( Y=>nx2847, A=>nx548);
   ix2680 : inv01 port map ( Y=>nx2679, A=>nx546);
   ix2842 : inv01 port map ( Y=>nx2841, A=>nx524);
   ix2672 : inv01 port map ( Y=>nx2671, A=>nx522);
   ix2836 : inv01 port map ( Y=>nx2835, A=>nx500);
   ix2662 : inv01 port map ( Y=>nx2661, A=>nx494);
   ix477 : inv01 port map ( Y=>nx476, A=>nx2811);
   ix471 : inv01 port map ( Y=>nx470, A=>nx2819);
   ix393 : inv01 port map ( Y=>nx392, A=>nx2715);
   ix323 : inv01 port map ( Y=>nx322, A=>nx2717);
   ix229 : inv01 port map ( Y=>nx228, A=>nx2641);
   ix159 : inv01 port map ( Y=>nx158, A=>nx2629);
   ix3668 : inv01 port map ( Y=>nx3667, A=>EDGE_dup0);
   ix3793 : inv01 port map ( Y=>nx3794, A=>nx3719);
   ix3795 : inv01 port map ( Y=>nx3796, A=>nx3719);
   ix3797 : inv01 port map ( Y=>nx3798, A=>nx3859);
   ix3803 : inv01 port map ( Y=>nx3804, A=>nx3427);
   ix3809 : inv01 port map ( Y=>nx3810, A=>nx3711);
   ix3811 : inv01 port map ( Y=>nx3813, A=>nx2053);
   ix3836 : buf02 port map ( Y=>nx3837, A=>nx3179);
   ix3838 : buf02 port map ( Y=>nx3839, A=>nx3179);
   ix3840 : inv01 port map ( Y=>nx3841, A=>nx3588);
   ix3842 : inv01 port map ( Y=>nx3843, A=>nx3588);
   ix3575 : and02 port map ( Y=>nx3574, A0=>nx3867, A1=>nx3859);
   ix2955 : nor02ii port map ( Y=>nx2954, A0=>nx2948, A1=>nx2097);
   ix2092 : mux21 port map ( Y=>nx2091, A0=>nx2964, A1=>nx2970, S0=>nx3857);
   ix3001 : mux21 port map ( Y=>nx3000, A0=>nx2109, A1=>nx2107, S0=>nx3857);
   ix2114 : mux21 port map ( Y=>nx2113, A0=>nx3016, A1=>nx3022, S0=>nx3857);
   ix3053 : mux21 port map ( Y=>nx3052, A0=>nx2125, A1=>nx2123, S0=>nx3857);
   ix2130 : mux21 port map ( Y=>nx2129, A0=>nx3068, A1=>nx3074, S0=>nx3857);
   ix3105 : mux21 port map ( Y=>nx3104, A0=>nx2141, A1=>nx2139, S0=>nx2852);
   ix2146 : mux21 port map ( Y=>nx2145, A0=>nx3120, A1=>nx3126, S0=>nx2852);
   ix3157 : mux21 port map ( Y=>nx3156, A0=>nx2157, A1=>nx2155, S0=>nx2852);
   ix2162 : mux21 port map ( Y=>nx2161, A0=>nx3172, A1=>nx3178, S0=>nx2852);
   ix2188 : mux21 port map ( Y=>nx2187, A0=>nx3184, A1=>nx3190, S0=>nx3855);
   ix3169 : mux21 port map ( Y=>nx3168, A0=>nx2463, A1=>nx2461, S0=>nx3855);
   ix2470 : mux21 port map ( Y=>nx2469, A0=>nx3132, A1=>nx3138, S0=>nx3855);
   ix3117 : mux21 port map ( Y=>nx3116, A0=>nx2483, A1=>nx2481, S0=>nx3855);
   ix2490 : mux21 port map ( Y=>nx2489, A0=>nx3080, A1=>nx3086, S0=>nx3855);
   ix3065 : mux21 port map ( Y=>nx3064, A0=>nx2505, A1=>nx2503, S0=>nx3855);
   ix2512 : mux21 port map ( Y=>nx2511, A0=>nx3028, A1=>nx3034, S0=>nx2230);
   ix3013 : mux21 port map ( Y=>nx3012, A0=>nx2527, A1=>nx2525, S0=>nx2230);
   ix2534 : mux21 port map ( Y=>nx2533, A0=>nx2976, A1=>nx2982, S0=>nx2230);
   ix2333 : nor02ii port map ( Y=>nx2332, A0=>nx2326, A1=>nx2211);
   ix761 : nor02ii port map ( Y=>nx760, A0=>nx754, A1=>nx3161);
   ix1383 : nor02ii port map ( Y=>nx1382, A0=>nx1376, A1=>nx3173);
   ix3156 : mux21 port map ( Y=>nx3155, A0=>nx1392, A1=>nx1398, S0=>nx3851);
   ix3168 : mux21 port map ( Y=>nx3167, A0=>nx1404, A1=>nx1410, S0=>nx3853);
   ix735 : mux21 port map ( Y=>nx734, A0=>nx3189, A1=>nx3187, S0=>nx3851);
   ix3194 : mux21 port map ( Y=>nx3193, A0=>nx1432, A1=>nx1438, S0=>nx3851);
   ix1469 : mux21 port map ( Y=>nx1468, A0=>nx3205, A1=>nx3203, S0=>nx3851);
   ix3210 : mux21 port map ( Y=>nx3209, A0=>nx1484, A1=>nx1490, S0=>nx3851);
   ix1521 : mux21 port map ( Y=>nx1520, A0=>nx3221, A1=>nx3219, S0=>nx3851);
   ix3226 : mux21 port map ( Y=>nx3225, A0=>nx1536, A1=>nx1542, S0=>nx646);
   ix1573 : mux21 port map ( Y=>nx1572, A0=>nx3237, A1=>nx3235, S0=>nx646);
   ix3242 : mux21 port map ( Y=>nx3241, A0=>nx1588, A1=>nx1594, S0=>nx646);
   ix3256 : mux21 port map ( Y=>nx3255, A0=>nx1600, A1=>nx1606, S0=>nx3853);
   ix1585 : mux21 port map ( Y=>nx1584, A0=>nx3267, A1=>nx3265, S0=>nx3853);
   ix3272 : mux21 port map ( Y=>nx3271, A0=>nx1548, A1=>nx1554, S0=>nx3853);
   ix1533 : mux21 port map ( Y=>nx1532, A0=>nx3283, A1=>nx3281, S0=>nx3853);
   ix3288 : mux21 port map ( Y=>nx3287, A0=>nx1496, A1=>nx1502, S0=>nx1280);
   ix1481 : mux21 port map ( Y=>nx1480, A0=>nx3299, A1=>nx3297, S0=>nx1280);
   ix3304 : mux21 port map ( Y=>nx3303, A0=>nx1444, A1=>nx1450, S0=>nx1280);
   ix1429 : mux21 port map ( Y=>nx1428, A0=>nx3313, A1=>nx3311, S0=>nx1280);
   ix3481 : mux21 port map ( Y=>nx3480, A0=>nx2171, A1=>nx3351, S0=>nx3867);
   ix3463 : mux21 port map ( Y=>nx3462, A0=>nx2187, A1=>nx2161, S0=>nx3867);
   ix3364 : mux21 port map ( Y=>nx3363, A0=>nx3168, A1=>nx3156, S0=>nx3867);
   ix3427 : mux21 port map ( Y=>nx3426, A0=>nx2469, A1=>nx2145, S0=>nx3867);
   ix3372 : mux21 port map ( Y=>nx3371, A0=>nx3116, A1=>nx3104, S0=>nx3867);
   ix3391 : mux21 port map ( Y=>nx3390, A0=>nx2489, A1=>nx2129, S0=>nx3869);
   ix3380 : mux21 port map ( Y=>nx3379, A0=>nx3064, A1=>nx3052, S0=>nx3869);
   ix3355 : mux21 port map ( Y=>nx3354, A0=>nx2511, A1=>nx2113, S0=>nx3869);
   ix3388 : mux21 port map ( Y=>nx3387, A0=>nx3012, A1=>nx3000, S0=>nx3869);
   ix3319 : mux21 port map ( Y=>nx3318, A0=>nx2533, A1=>nx2091, S0=>nx3869);
   ix3917 : ao22 port map ( Y=>nx3916, A0=>nx2230, A1=>nx3588, B0=>nx646, B1
      =>nx3580);
   ix3406 : nor02 port map ( Y=>nx3588, A0=>nx3869, A1=>nx3564);
   ix3827 : mux21_ni port map ( Y=>nx3826, A0=>nx3310, A1=>nx3318, S0=>
      nx3859);
   ix3581 : nor02ii port map ( Y=>nx3580, A0=>nx3839, A1=>nx3564);
   ix3502 : mux21 port map ( Y=>nx3501, A0=>nx3472, A1=>nx3480, S0=>nx3859);
   ix3530 : mux21 port map ( Y=>nx3529, A0=>nx3454, A1=>nx3462, S0=>nx3859);
   ix3687 : mux21 port map ( Y=>nx3686, A0=>nx3343, A1=>nx3363, S0=>nx3859);
   ix3562 : mux21 port map ( Y=>nx3561, A0=>nx3418, A1=>nx3426, S0=>nx3861);
   ix3631 : mux21 port map ( Y=>nx3630, A0=>nx3337, A1=>nx3371, S0=>nx3861);
   ix3592 : mux21 port map ( Y=>nx3591, A0=>nx3382, A1=>nx3390, S0=>nx3861);
   ix3773 : mux21 port map ( Y=>nx3772, A0=>nx3329, A1=>nx3379, S0=>nx3861);
   ix3839 : ao22 port map ( Y=>nx3838, A0=>nx2954, A1=>nx3588, B0=>nx1382, 
      B1=>nx3580);
   ix3632 : mux21 port map ( Y=>nx3631, A0=>nx3346, A1=>nx3354, S0=>nx3861);
   ix3875 : mux21 port map ( Y=>nx3874, A0=>nx3321, A1=>nx3387, S0=>nx3861);
   ix3923 : nor02ii port map ( Y=>DIRECTION(1), A0=>nx3401, A1=>EDGE_dup0);
   ix127 : nor02ii port map ( Y=>nx126, A0=>nx3785, A1=>timer_finished);
   ix3722 : nor02ii port map ( Y=>nx3721, A0=>nx1679, A1=>nx3771);
   ix3726 : and04 port map ( Y=>nx3725, A0=>nx3849, A1=>nx3739, A2=>nx3747, 
      A3=>nx3757);
   ix3848 : inv01 port map ( Y=>nx3849, A=>
      timed_signal_inst_time_remaining_0);
   ix1694 : xor2 port map ( Y=>nx1693, A0=>
      timed_signal_inst_time_remaining_0, A1=>nx3863);
   ix1704 : mux21 port map ( Y=>nx1703, A0=>nx3739, A1=>nx3735, S0=>nx3863);
   ix3738 : nor02ii port map ( Y=>nx3737, A0=>
      timed_signal_inst_time_remaining_0, A1=>nx3739);
   ix1714 : mux21 port map ( Y=>nx1713, A0=>nx3747, A1=>nx3745, S0=>nx3863);
   ix3746 : xor2 port map ( Y=>nx3745, A0=>nx3747, A1=>nx3737);
   ix1724 : mux21 port map ( Y=>nx1723, A0=>nx3757, A1=>nx3753, S0=>nx3863);
   ix3754 : xor2 port map ( Y=>nx3753, A0=>nx3757, A1=>nx3755);
   ix1734 : mux21 port map ( Y=>nx1733, A0=>nx3759, A1=>nx3763, S0=>nx3863);
   ix3764 : xor2 port map ( Y=>nx3763, A0=>nx3759, A1=>nx3725);
   ix1744 : mux21 port map ( Y=>nx1743, A0=>nx3771, A1=>nx3769, S0=>nx3865);
   ix1754 : mux21 port map ( Y=>nx1753, A0=>nx3773, A1=>nx3777, S0=>nx3865);
   ix3778 : xor2 port map ( Y=>nx3777, A0=>nx3773, A1=>nx3721);
   ix3805 : and02 port map ( Y=>nx3806, A0=>nx3813, A1=>nx3401);
   ix3850 : inv01 port map ( Y=>nx3851, A=>nx3161);
   ix3852 : inv01 port map ( Y=>nx3853, A=>nx3173);
   ix3854 : inv01 port map ( Y=>nx3855, A=>nx2211);
   ix3856 : inv01 port map ( Y=>nx3857, A=>nx2097);
   ix3858 : inv01 port map ( Y=>nx3859, A=>nx3564);
   ix3860 : inv01 port map ( Y=>nx3861, A=>nx3564);
   ix3862 : inv01 port map ( Y=>nx3863, A=>nx3810);
   ix3864 : inv01 port map ( Y=>nx3865, A=>nx3810);
   ix3866 : inv01 port map ( Y=>nx3867, A=>nx2053);
   ix3868 : inv01 port map ( Y=>nx3869, A=>nx2053);
end behavioral ;

