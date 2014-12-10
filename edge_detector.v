//
// Verilog description for cell filter, 
// Wed Dec 10 13:06:35 2014
//
// LeonardoSpectrum Level 3, 2008b.3 
//


module filter ( T00, T01, T02, T10, T11, T12, T20, T21, T22, CLOCK, I_VALID, 
                RESET, READY, O_VALID, EDGE, DIRECTION ) ;

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
    output READY ;
    output O_VALID ;
    output EDGE ;
    output [2:0]DIRECTION ;

    wire nx1607, fsm_inst_state_4, timer_finished, fsm_inst_state_0, nx12, nx20, 
         nx1677, timed_signal_inst_time_remaining_5, nx1679, 
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
         nx3865, nx3867, nx3869;
    wire [9:0] \$dummy ;




    fake_vcc ix1770 (.Y (nx462)) ;
    fake_gnd ix1608 (.Y (nx1607)) ;
    nor02ii ix3921 (.Y (DIRECTION[0]), .A0 (nx1777), .A1 (EDGE)) ;
    aoi221 ix1778 (.Y (nx1777), .A0 (nx3857), .A1 (nx3806), .B0 (nx3853), .B1 (
           nx3804), .C0 (nx3916)) ;
    mux21 ix2851 (.Y (nx2850), .A0 (nx2676), .A1 (nx1873), .S0 (nx2688)) ;
    nand02 ix1786 (.Y (nx1785), .A0 (T12[7]), .A1 (nx2490)) ;
    mux21 ix2491 (.Y (nx2490), .A0 (nx1789), .A1 (nx1815), .S0 (nx1817)) ;
    mux21 ix1790 (.Y (nx1789), .A0 (nx2386), .A1 (T02[6]), .S0 (nx1813)) ;
    mux21 ix2387 (.Y (nx2386), .A0 (nx1793), .A1 (nx1809), .S0 (nx1811)) ;
    mux21 ix1794 (.Y (nx1793), .A0 (nx2378), .A1 (T02[4]), .S0 (nx1807)) ;
    mux21 ix2379 (.Y (nx2378), .A0 (nx1797), .A1 (nx1803), .S0 (nx1805)) ;
    aoi32 ix1798 (.Y (nx1797), .A0 (T12[0]), .A1 (T02[1]), .A2 (nx2364), .B0 (
          T02[2]), .B1 (T12[1])) ;
    inv01 ix1804 (.Y (nx1803), .A (T02[3])) ;
    xnor2 ix1806 (.Y (nx1805), .A0 (T12[2]), .A1 (T02[3])) ;
    xnor2 ix1808 (.Y (nx1807), .A0 (T12[3]), .A1 (T02[4])) ;
    inv01 ix1810 (.Y (nx1809), .A (T02[5])) ;
    xnor2 ix1812 (.Y (nx1811), .A0 (T12[4]), .A1 (T02[5])) ;
    xnor2 ix1814 (.Y (nx1813), .A0 (T12[5]), .A1 (T02[6])) ;
    inv01 ix1816 (.Y (nx1815), .A (T02[7])) ;
    xnor2 ix1818 (.Y (nx1817), .A0 (T12[6]), .A1 (T02[7])) ;
    mux21 ix2483 (.Y (nx2482), .A0 (nx1823), .A1 (nx1825), .S0 (nx2396)) ;
    xnor2 ix1824 (.Y (nx1823), .A0 (nx1789), .A1 (nx1817)) ;
    mux21 ix1826 (.Y (nx1825), .A0 (nx2474), .A1 (nx2402), .S0 (nx1867)) ;
    mux21 ix2475 (.Y (nx2474), .A0 (nx1829), .A1 (nx1831), .S0 (nx2412)) ;
    xnor2 ix1830 (.Y (nx1829), .A0 (nx1793), .A1 (nx1811)) ;
    mux21 ix1832 (.Y (nx1831), .A0 (nx2466), .A1 (nx2418), .S0 (nx1861)) ;
    mux21 ix2467 (.Y (nx2466), .A0 (nx1835), .A1 (nx1837), .S0 (nx2428)) ;
    xnor2 ix1836 (.Y (nx1835), .A0 (nx1797), .A1 (nx1805)) ;
    aoi22 ix1838 (.Y (nx1837), .A0 (nx2434), .A1 (T22[2]), .B0 (nx2458), .B1 (
          nx2436)) ;
    nand02 ix1842 (.Y (nx1841), .A0 (T12[0]), .A1 (T02[1])) ;
    xnor2 ix1844 (.Y (nx1843), .A0 (T12[1]), .A1 (T02[2])) ;
    mux21 ix2459 (.Y (nx2458), .A0 (nx1847), .A1 (nx1849), .S0 (nx2448)) ;
    oai21 ix1848 (.Y (nx1847), .A0 (T02[1]), .A1 (T12[0]), .B0 (nx1841)) ;
    nand02 ix1850 (.Y (nx1849), .A0 (T22[0]), .A1 (T02[0])) ;
    xnor2 ix2449 (.Y (nx2448), .A0 (T22[1]), .A1 (nx1847)) ;
    xnor2 ix2437 (.Y (nx2436), .A0 (T22[2]), .A1 (nx1855)) ;
    xnor2 ix1856 (.Y (nx1855), .A0 (nx1841), .A1 (nx1843)) ;
    xnor2 ix2429 (.Y (nx2428), .A0 (T22[3]), .A1 (nx1835)) ;
    xnor2 ix2419 (.Y (nx2418), .A0 (nx2378), .A1 (nx1807)) ;
    xnor2 ix1862 (.Y (nx1861), .A0 (T22[4]), .A1 (nx2418)) ;
    xnor2 ix2413 (.Y (nx2412), .A0 (T22[5]), .A1 (nx1829)) ;
    xnor2 ix2403 (.Y (nx2402), .A0 (nx2386), .A1 (nx1813)) ;
    xnor2 ix1868 (.Y (nx1867), .A0 (T22[6]), .A1 (nx2402)) ;
    xnor2 ix2397 (.Y (nx2396), .A0 (T22[7]), .A1 (nx1823)) ;
    mux21 ix1874 (.Y (nx1873), .A0 (nx1875), .A1 (nx2842), .S0 (nx2708)) ;
    xnor2 ix1878 (.Y (nx1877), .A0 (T12[7]), .A1 (nx2490)) ;
    mux21 ix2843 (.Y (nx2842), .A0 (nx2716), .A1 (nx1883), .S0 (nx2720)) ;
    xnor2 ix2717 (.Y (nx2716), .A0 (nx1825), .A1 (nx2396)) ;
    mux21 ix1884 (.Y (nx1883), .A0 (nx1885), .A1 (nx2834), .S0 (nx2732)) ;
    mux21 ix2835 (.Y (nx2834), .A0 (nx2740), .A1 (nx1891), .S0 (nx2744)) ;
    xnor2 ix2741 (.Y (nx2740), .A0 (nx1831), .A1 (nx2412)) ;
    mux21 ix1892 (.Y (nx1891), .A0 (nx1893), .A1 (nx2826), .S0 (nx2756)) ;
    mux21 ix2827 (.Y (nx2826), .A0 (nx2764), .A1 (nx1899), .S0 (nx2768)) ;
    xnor2 ix2765 (.Y (nx2764), .A0 (nx1837), .A1 (nx2428)) ;
    mux21 ix1900 (.Y (nx1899), .A0 (nx1901), .A1 (nx2818), .S0 (nx2780)) ;
    xnor2 ix1902 (.Y (nx1901), .A0 (nx2458), .A1 (nx2436)) ;
    mux21 ix2819 (.Y (nx2818), .A0 (nx2788), .A1 (nx1907), .S0 (nx2792)) ;
    xnor2 ix2789 (.Y (nx2788), .A0 (nx1849), .A1 (nx2448)) ;
    nor02ii ix1908 (.Y (nx1907), .A0 (nx1909), .A1 (nx1911)) ;
    oai21 ix1910 (.Y (nx1909), .A0 (T02[0]), .A1 (T22[0]), .B0 (nx1849)) ;
    oai21 ix1912 (.Y (nx1911), .A0 (T20[0]), .A1 (T00[0]), .B0 (nx1913)) ;
    nand02 ix1914 (.Y (nx1913), .A0 (T00[0]), .A1 (T20[0])) ;
    xnor2 ix2793 (.Y (nx2792), .A0 (nx2790), .A1 (nx2788)) ;
    xnor2 ix2791 (.Y (nx2790), .A0 (nx1913), .A1 (nx2612)) ;
    xnor2 ix2613 (.Y (nx2612), .A0 (T20[1]), .A1 (nx1921)) ;
    oai21 ix1922 (.Y (nx1921), .A0 (T10[0]), .A1 (T00[1]), .B0 (nx1923)) ;
    nand02 ix1924 (.Y (nx1923), .A0 (T00[1]), .A1 (T10[0])) ;
    xnor2 ix2781 (.Y (nx2780), .A0 (nx1927), .A1 (nx1901)) ;
    xnor2 ix1928 (.Y (nx1927), .A0 (nx2622), .A1 (nx2600)) ;
    mux21 ix2623 (.Y (nx2622), .A0 (nx1921), .A1 (nx1913), .S0 (nx2612)) ;
    xnor2 ix2601 (.Y (nx2600), .A0 (T20[2]), .A1 (nx1933)) ;
    xnor2 ix1934 (.Y (nx1933), .A0 (nx1923), .A1 (nx1935)) ;
    xnor2 ix1936 (.Y (nx1935), .A0 (T00[2]), .A1 (T10[1])) ;
    xnor2 ix2769 (.Y (nx2768), .A0 (nx2766), .A1 (nx2764)) ;
    xnor2 ix2767 (.Y (nx2766), .A0 (nx1941), .A1 (nx2592)) ;
    aoi22 ix1942 (.Y (nx1941), .A0 (nx2598), .A1 (T20[2]), .B0 (nx2622), .B1 (
          nx2600)) ;
    xnor2 ix2593 (.Y (nx2592), .A0 (T20[3]), .A1 (nx1947)) ;
    xnor2 ix1948 (.Y (nx1947), .A0 (nx1949), .A1 (nx1955)) ;
    aoi32 ix1950 (.Y (nx1949), .A0 (T00[1]), .A1 (T10[0]), .A2 (nx2528), .B0 (
          T10[1]), .B1 (T00[2])) ;
    xnor2 ix1956 (.Y (nx1955), .A0 (T00[3]), .A1 (T10[2])) ;
    xnor2 ix2757 (.Y (nx2756), .A0 (nx2754), .A1 (nx2752)) ;
    xnor2 ix2755 (.Y (nx2754), .A0 (nx2630), .A1 (nx1963)) ;
    mux21 ix2631 (.Y (nx2630), .A0 (nx1947), .A1 (nx1941), .S0 (nx2592)) ;
    xnor2 ix1964 (.Y (nx1963), .A0 (T20[4]), .A1 (nx2582)) ;
    xnor2 ix2583 (.Y (nx2582), .A0 (nx2542), .A1 (nx1971)) ;
    mux21 ix2543 (.Y (nx2542), .A0 (nx1949), .A1 (nx1969), .S0 (nx1955)) ;
    inv01 ix1970 (.Y (nx1969), .A (T10[2])) ;
    xnor2 ix1972 (.Y (nx1971), .A0 (T00[4]), .A1 (T10[3])) ;
    xnor2 ix2753 (.Y (nx2752), .A0 (nx2466), .A1 (nx1861)) ;
    xnor2 ix2745 (.Y (nx2744), .A0 (nx2742), .A1 (nx2740)) ;
    xnor2 ix2743 (.Y (nx2742), .A0 (nx1979), .A1 (nx2576)) ;
    mux21 ix1980 (.Y (nx1979), .A0 (nx2630), .A1 (nx2582), .S0 (nx1963)) ;
    xnor2 ix2577 (.Y (nx2576), .A0 (T20[5]), .A1 (nx1983)) ;
    xnor2 ix1984 (.Y (nx1983), .A0 (nx1985), .A1 (nx1987)) ;
    mux21 ix1986 (.Y (nx1985), .A0 (nx2542), .A1 (T10[3]), .S0 (nx1971)) ;
    xnor2 ix1988 (.Y (nx1987), .A0 (T00[5]), .A1 (T10[4])) ;
    xnor2 ix2733 (.Y (nx2732), .A0 (nx2730), .A1 (nx2728)) ;
    xnor2 ix2731 (.Y (nx2730), .A0 (nx2638), .A1 (nx1995)) ;
    mux21 ix2639 (.Y (nx2638), .A0 (nx1983), .A1 (nx1979), .S0 (nx2576)) ;
    xnor2 ix1996 (.Y (nx1995), .A0 (T20[6]), .A1 (nx2566)) ;
    xnor2 ix2567 (.Y (nx2566), .A0 (nx2550), .A1 (nx2003)) ;
    mux21 ix2551 (.Y (nx2550), .A0 (nx1985), .A1 (nx2001), .S0 (nx1987)) ;
    inv01 ix2002 (.Y (nx2001), .A (T10[4])) ;
    xnor2 ix2004 (.Y (nx2003), .A0 (T00[6]), .A1 (T10[5])) ;
    xnor2 ix2729 (.Y (nx2728), .A0 (nx2474), .A1 (nx1867)) ;
    xnor2 ix2721 (.Y (nx2720), .A0 (nx2718), .A1 (nx2716)) ;
    xnor2 ix2719 (.Y (nx2718), .A0 (nx2011), .A1 (nx2560)) ;
    mux21 ix2012 (.Y (nx2011), .A0 (nx2638), .A1 (nx2566), .S0 (nx1995)) ;
    xnor2 ix2561 (.Y (nx2560), .A0 (T20[7]), .A1 (nx2015)) ;
    xnor2 ix2016 (.Y (nx2015), .A0 (nx2017), .A1 (nx2019)) ;
    mux21 ix2018 (.Y (nx2017), .A0 (nx2550), .A1 (T10[5]), .S0 (nx2003)) ;
    xnor2 ix2020 (.Y (nx2019), .A0 (T00[7]), .A1 (T10[6])) ;
    xnor2 ix2709 (.Y (nx2708), .A0 (nx2706), .A1 (nx2700)) ;
    xnor2 ix2707 (.Y (nx2706), .A0 (nx2646), .A1 (nx2027)) ;
    mux21 ix2647 (.Y (nx2646), .A0 (nx2015), .A1 (nx2011), .S0 (nx2560)) ;
    xnor2 ix2028 (.Y (nx2027), .A0 (T10[7]), .A1 (nx2654)) ;
    mux21 ix2655 (.Y (nx2654), .A0 (nx2017), .A1 (nx2031), .S0 (nx2019)) ;
    inv01 ix2032 (.Y (nx2031), .A (T10[6])) ;
    xnor2 ix2701 (.Y (nx2700), .A0 (nx2482), .A1 (nx1877)) ;
    xnor2 ix2689 (.Y (nx2688), .A0 (nx2037), .A1 (nx2045)) ;
    nor02ii ix2040 (.Y (nx2037), .A0 (nx2664), .A1 (nx2043)) ;
    nor02ii ix2665 (.Y (nx2664), .A0 (nx2027), .A1 (nx2646)) ;
    nand02 ix2044 (.Y (nx2043), .A0 (T10[7]), .A1 (nx2654)) ;
    nor02ii ix2048 (.Y (nx2045), .A0 (nx2500), .A1 (nx1785)) ;
    nor02ii ix2501 (.Y (nx2500), .A0 (nx1877), .A1 (nx2482)) ;
    mux21 ix2054 (.Y (nx2053), .A0 (nx2954), .A1 (nx3284), .S0 (nx2543)) ;
    mux21 ix2949 (.Y (nx2948), .A0 (nx2682), .A1 (nx2065), .S0 (nx2688)) ;
    mux21 ix2066 (.Y (nx2065), .A0 (nx2067), .A1 (nx2940), .S0 (nx2708)) ;
    mux21 ix2941 (.Y (nx2940), .A0 (nx2718), .A1 (nx2071), .S0 (nx2720)) ;
    mux21 ix2072 (.Y (nx2071), .A0 (nx2073), .A1 (nx2932), .S0 (nx2732)) ;
    mux21 ix2933 (.Y (nx2932), .A0 (nx2742), .A1 (nx2077), .S0 (nx2744)) ;
    mux21 ix2078 (.Y (nx2077), .A0 (nx2079), .A1 (nx2924), .S0 (nx2756)) ;
    mux21 ix2925 (.Y (nx2924), .A0 (nx2766), .A1 (nx2083), .S0 (nx2768)) ;
    mux21 ix2084 (.Y (nx2083), .A0 (nx1927), .A1 (nx2916), .S0 (nx2780)) ;
    mux21 ix2917 (.Y (nx2916), .A0 (nx2790), .A1 (nx2087), .S0 (nx2792)) ;
    nor02ii ix2088 (.Y (nx2087), .A0 (nx1911), .A1 (nx1909)) ;
    mux21 ix3285 (.Y (nx3284), .A0 (nx2091), .A1 (nx2102), .S0 (nx2531)) ;
    xnor2 ix2971 (.Y (nx2970), .A0 (nx1873), .A1 (nx2688)) ;
    xnor2 ix2965 (.Y (nx2964), .A0 (nx2065), .A1 (nx2688)) ;
    nand02 ix2100 (.Y (nx2097), .A0 (nx2850), .A1 (nx462)) ;
    mux21 ix2104 (.Y (nx2102), .A0 (nx3000), .A1 (nx3268), .S0 (nx2521)) ;
    xnor2 ix2108 (.Y (nx2107), .A0 (nx2842), .A1 (nx2708)) ;
    xnor2 ix2110 (.Y (nx2109), .A0 (nx2940), .A1 (nx2708)) ;
    mux21 ix3269 (.Y (nx3268), .A0 (nx2113), .A1 (nx2119), .S0 (nx2509)) ;
    xnor2 ix3023 (.Y (nx3022), .A0 (nx1883), .A1 (nx2720)) ;
    xnor2 ix3017 (.Y (nx3016), .A0 (nx2071), .A1 (nx2720)) ;
    mux21 ix2120 (.Y (nx2119), .A0 (nx3052), .A1 (nx3252), .S0 (nx2499)) ;
    xnor2 ix2124 (.Y (nx2123), .A0 (nx2834), .A1 (nx2732)) ;
    xnor2 ix2126 (.Y (nx2125), .A0 (nx2932), .A1 (nx2732)) ;
    mux21 ix3253 (.Y (nx3252), .A0 (nx2129), .A1 (nx2135), .S0 (nx2487)) ;
    xnor2 ix3075 (.Y (nx3074), .A0 (nx1891), .A1 (nx2744)) ;
    xnor2 ix3069 (.Y (nx3068), .A0 (nx2077), .A1 (nx2744)) ;
    mux21 ix2136 (.Y (nx2135), .A0 (nx3104), .A1 (nx3236), .S0 (nx2477)) ;
    xnor2 ix2140 (.Y (nx2139), .A0 (nx2826), .A1 (nx2756)) ;
    xnor2 ix2142 (.Y (nx2141), .A0 (nx2924), .A1 (nx2756)) ;
    mux21 ix3237 (.Y (nx3236), .A0 (nx2145), .A1 (nx2151), .S0 (nx2467)) ;
    xnor2 ix3127 (.Y (nx3126), .A0 (nx1899), .A1 (nx2768)) ;
    xnor2 ix3121 (.Y (nx3120), .A0 (nx2083), .A1 (nx2768)) ;
    mux21 ix2152 (.Y (nx2151), .A0 (nx3156), .A1 (nx3220), .S0 (nx2457)) ;
    xnor2 ix2156 (.Y (nx2155), .A0 (nx2818), .A1 (nx2780)) ;
    xnor2 ix2158 (.Y (nx2157), .A0 (nx2916), .A1 (nx2780)) ;
    mux21 ix3221 (.Y (nx3220), .A0 (nx2161), .A1 (nx2167), .S0 (nx2185)) ;
    xnor2 ix3179 (.Y (nx3178), .A0 (nx1907), .A1 (nx2792)) ;
    xnor2 ix3173 (.Y (nx3172), .A0 (nx2087), .A1 (nx2792)) ;
    nand02 ix2168 (.Y (nx2167), .A0 (nx3202), .A1 (nx2171)) ;
    nor02 ix2172 (.Y (nx2171), .A0 (nx2173), .A1 (nx2183)) ;
    nor02ii ix2174 (.Y (nx2173), .A0 (nx2175), .A1 (nx2179)) ;
    oai21 ix2176 (.Y (nx2175), .A0 (T12[0]), .A1 (T21[0]), .B0 (nx2177)) ;
    nand02 ix2178 (.Y (nx2177), .A0 (T21[0]), .A1 (T12[0])) ;
    oai21 ix2180 (.Y (nx2179), .A0 (T01[0]), .A1 (T10[0]), .B0 (nx2181)) ;
    nand02 ix2182 (.Y (nx2181), .A0 (T10[0]), .A1 (T01[0])) ;
    nor02ii ix2184 (.Y (nx2183), .A0 (nx2179), .A1 (nx2175)) ;
    xnor2 ix2186 (.Y (nx2185), .A0 (nx2161), .A1 (nx2187)) ;
    xnor2 ix3191 (.Y (nx3190), .A0 (nx2183), .A1 (nx2170)) ;
    xnor2 ix2171 (.Y (nx2170), .A0 (nx2168), .A1 (nx2166)) ;
    xnor2 ix2169 (.Y (nx2168), .A0 (nx2177), .A1 (nx1990)) ;
    xnor2 ix1991 (.Y (nx1990), .A0 (T12[1]), .A1 (nx2197)) ;
    oai21 ix2198 (.Y (nx2197), .A0 (T21[1]), .A1 (T22[0]), .B0 (nx2199)) ;
    nand02 ix2200 (.Y (nx2199), .A0 (T22[0]), .A1 (T21[1])) ;
    xnor2 ix2167 (.Y (nx2166), .A0 (nx2181), .A1 (nx1826)) ;
    xnor2 ix1827 (.Y (nx1826), .A0 (T01[1]), .A1 (nx2205)) ;
    oai21 ix2206 (.Y (nx2205), .A0 (T10[1]), .A1 (T00[0]), .B0 (nx2207)) ;
    nand02 ix2208 (.Y (nx2207), .A0 (T00[0]), .A1 (T10[1])) ;
    xnor2 ix3185 (.Y (nx3184), .A0 (nx2173), .A1 (nx2170)) ;
    nand02 ix2214 (.Y (nx2211), .A0 (nx2228), .A1 (nx462)) ;
    mux21 ix2229 (.Y (nx2228), .A0 (nx2054), .A1 (nx2297), .S0 (nx2066)) ;
    nand02 ix2220 (.Y (nx2219), .A0 (T00[7]), .A1 (nx1868)) ;
    mux21 ix1869 (.Y (nx1868), .A0 (nx2223), .A1 (nx2247), .S0 (nx2249)) ;
    mux21 ix2224 (.Y (nx2223), .A0 (nx1764), .A1 (T10[6]), .S0 (nx2245)) ;
    mux21 ix1765 (.Y (nx1764), .A0 (nx2227), .A1 (nx2241), .S0 (nx2243)) ;
    mux21 ix2228 (.Y (nx2227), .A0 (nx1756), .A1 (T10[4]), .S0 (nx2239)) ;
    mux21 ix1757 (.Y (nx1756), .A0 (nx2231), .A1 (nx2235), .S0 (nx2237)) ;
    aoi32 ix2232 (.Y (nx2231), .A0 (T00[0]), .A1 (T10[1]), .A2 (nx1742), .B0 (
          T10[2]), .B1 (T00[1])) ;
    inv01 ix2236 (.Y (nx2235), .A (T10[3])) ;
    xnor2 ix2238 (.Y (nx2237), .A0 (T00[2]), .A1 (T10[3])) ;
    xnor2 ix2240 (.Y (nx2239), .A0 (T00[3]), .A1 (T10[4])) ;
    inv01 ix2242 (.Y (nx2241), .A (T10[5])) ;
    xnor2 ix2244 (.Y (nx2243), .A0 (T00[4]), .A1 (T10[5])) ;
    xnor2 ix2246 (.Y (nx2245), .A0 (T00[5]), .A1 (T10[6])) ;
    inv01 ix2248 (.Y (nx2247), .A (T10[7])) ;
    xnor2 ix2250 (.Y (nx2249), .A0 (T00[6]), .A1 (T10[7])) ;
    mux21 ix1861 (.Y (nx1860), .A0 (nx2255), .A1 (nx2257), .S0 (nx1774)) ;
    xnor2 ix2256 (.Y (nx2255), .A0 (nx2223), .A1 (nx2249)) ;
    mux21 ix2258 (.Y (nx2257), .A0 (nx1852), .A1 (nx1780), .S0 (nx2291)) ;
    mux21 ix1853 (.Y (nx1852), .A0 (nx2261), .A1 (nx2263), .S0 (nx1790)) ;
    xnor2 ix2262 (.Y (nx2261), .A0 (nx2227), .A1 (nx2243)) ;
    mux21 ix2264 (.Y (nx2263), .A0 (nx1844), .A1 (nx1796), .S0 (nx2285)) ;
    mux21 ix1845 (.Y (nx1844), .A0 (nx2267), .A1 (nx2269), .S0 (nx1806)) ;
    xnor2 ix2268 (.Y (nx2267), .A0 (nx2231), .A1 (nx2237)) ;
    aoi22 ix2270 (.Y (nx2269), .A0 (nx1812), .A1 (T01[2]), .B0 (nx1836), .B1 (
          nx1814)) ;
    xnor2 ix2274 (.Y (nx2273), .A0 (T00[1]), .A1 (T10[2])) ;
    mux21 ix1837 (.Y (nx1836), .A0 (nx2205), .A1 (nx2181), .S0 (nx1826)) ;
    xnor2 ix1815 (.Y (nx1814), .A0 (T01[2]), .A1 (nx2279)) ;
    xnor2 ix2280 (.Y (nx2279), .A0 (nx2207), .A1 (nx2273)) ;
    xnor2 ix1807 (.Y (nx1806), .A0 (T01[3]), .A1 (nx2267)) ;
    xnor2 ix1797 (.Y (nx1796), .A0 (nx1756), .A1 (nx2239)) ;
    xnor2 ix2286 (.Y (nx2285), .A0 (T01[4]), .A1 (nx1796)) ;
    xnor2 ix1791 (.Y (nx1790), .A0 (T01[5]), .A1 (nx2261)) ;
    xnor2 ix1781 (.Y (nx1780), .A0 (nx1764), .A1 (nx2245)) ;
    xnor2 ix2292 (.Y (nx2291), .A0 (T01[6]), .A1 (nx1780)) ;
    xnor2 ix1775 (.Y (nx1774), .A0 (T01[7]), .A1 (nx2255)) ;
    mux21 ix2298 (.Y (nx2297), .A0 (nx2299), .A1 (nx2220), .S0 (nx2086)) ;
    xnor2 ix2302 (.Y (nx2301), .A0 (T00[7]), .A1 (nx1868)) ;
    mux21 ix2221 (.Y (nx2220), .A0 (nx2094), .A1 (nx2307), .S0 (nx2098)) ;
    xnor2 ix2095 (.Y (nx2094), .A0 (nx2257), .A1 (nx1774)) ;
    mux21 ix2308 (.Y (nx2307), .A0 (nx2309), .A1 (nx2212), .S0 (nx2110)) ;
    mux21 ix2213 (.Y (nx2212), .A0 (nx2118), .A1 (nx2315), .S0 (nx2122)) ;
    xnor2 ix2119 (.Y (nx2118), .A0 (nx2263), .A1 (nx1790)) ;
    mux21 ix2316 (.Y (nx2315), .A0 (nx2317), .A1 (nx2204), .S0 (nx2134)) ;
    mux21 ix2205 (.Y (nx2204), .A0 (nx2142), .A1 (nx2323), .S0 (nx2146)) ;
    xnor2 ix2143 (.Y (nx2142), .A0 (nx2269), .A1 (nx1806)) ;
    mux21 ix2324 (.Y (nx2323), .A0 (nx2325), .A1 (nx2196), .S0 (nx2158)) ;
    xnor2 ix2326 (.Y (nx2325), .A0 (nx1836), .A1 (nx1814)) ;
    mux21 ix2197 (.Y (nx2196), .A0 (nx2166), .A1 (nx2183), .S0 (nx2170)) ;
    xnor2 ix2159 (.Y (nx2158), .A0 (nx2331), .A1 (nx2325)) ;
    xnor2 ix2332 (.Y (nx2331), .A0 (nx2000), .A1 (nx1978)) ;
    mux21 ix2001 (.Y (nx2000), .A0 (nx2197), .A1 (nx2177), .S0 (nx1990)) ;
    xnor2 ix1979 (.Y (nx1978), .A0 (T12[2]), .A1 (nx2337)) ;
    xnor2 ix2338 (.Y (nx2337), .A0 (nx2199), .A1 (nx2339)) ;
    xnor2 ix2340 (.Y (nx2339), .A0 (T22[1]), .A1 (T21[2])) ;
    xnor2 ix2147 (.Y (nx2146), .A0 (nx2144), .A1 (nx2142)) ;
    xnor2 ix2145 (.Y (nx2144), .A0 (nx2345), .A1 (nx1970)) ;
    aoi22 ix2346 (.Y (nx2345), .A0 (nx1976), .A1 (T12[2]), .B0 (nx2000), .B1 (
          nx1978)) ;
    xnor2 ix1971 (.Y (nx1970), .A0 (T12[3]), .A1 (nx2351)) ;
    xnor2 ix2352 (.Y (nx2351), .A0 (nx2353), .A1 (nx2359)) ;
    aoi32 ix2354 (.Y (nx2353), .A0 (T22[0]), .A1 (T21[1]), .A2 (nx1906), .B0 (
          T21[2]), .B1 (T22[1])) ;
    xnor2 ix2360 (.Y (nx2359), .A0 (T22[2]), .A1 (T21[3])) ;
    xnor2 ix2135 (.Y (nx2134), .A0 (nx2132), .A1 (nx2130)) ;
    xnor2 ix2133 (.Y (nx2132), .A0 (nx2008), .A1 (nx2367)) ;
    mux21 ix2009 (.Y (nx2008), .A0 (nx2351), .A1 (nx2345), .S0 (nx1970)) ;
    xnor2 ix2368 (.Y (nx2367), .A0 (T12[4]), .A1 (nx1960)) ;
    xnor2 ix1961 (.Y (nx1960), .A0 (nx1920), .A1 (nx2375)) ;
    mux21 ix1921 (.Y (nx1920), .A0 (nx2353), .A1 (nx2373), .S0 (nx2359)) ;
    inv01 ix2374 (.Y (nx2373), .A (T21[3])) ;
    xnor2 ix2376 (.Y (nx2375), .A0 (T22[3]), .A1 (T21[4])) ;
    xnor2 ix2131 (.Y (nx2130), .A0 (nx1844), .A1 (nx2285)) ;
    xnor2 ix2123 (.Y (nx2122), .A0 (nx2120), .A1 (nx2118)) ;
    xnor2 ix2121 (.Y (nx2120), .A0 (nx2383), .A1 (nx1954)) ;
    mux21 ix2384 (.Y (nx2383), .A0 (nx2008), .A1 (nx1960), .S0 (nx2367)) ;
    xnor2 ix1955 (.Y (nx1954), .A0 (T12[5]), .A1 (nx2387)) ;
    xnor2 ix2388 (.Y (nx2387), .A0 (nx2389), .A1 (nx2391)) ;
    mux21 ix2390 (.Y (nx2389), .A0 (nx1920), .A1 (T21[4]), .S0 (nx2375)) ;
    xnor2 ix2392 (.Y (nx2391), .A0 (T22[4]), .A1 (T21[5])) ;
    xnor2 ix2111 (.Y (nx2110), .A0 (nx2108), .A1 (nx2106)) ;
    xnor2 ix2109 (.Y (nx2108), .A0 (nx2016), .A1 (nx2399)) ;
    mux21 ix2017 (.Y (nx2016), .A0 (nx2387), .A1 (nx2383), .S0 (nx1954)) ;
    xnor2 ix2400 (.Y (nx2399), .A0 (T12[6]), .A1 (nx1944)) ;
    xnor2 ix1945 (.Y (nx1944), .A0 (nx1928), .A1 (nx2407)) ;
    mux21 ix1929 (.Y (nx1928), .A0 (nx2389), .A1 (nx2405), .S0 (nx2391)) ;
    inv01 ix2406 (.Y (nx2405), .A (T21[5])) ;
    xnor2 ix2408 (.Y (nx2407), .A0 (T22[5]), .A1 (T21[6])) ;
    xnor2 ix2107 (.Y (nx2106), .A0 (nx1852), .A1 (nx2291)) ;
    xnor2 ix2099 (.Y (nx2098), .A0 (nx2096), .A1 (nx2094)) ;
    xnor2 ix2097 (.Y (nx2096), .A0 (nx2415), .A1 (nx1938)) ;
    mux21 ix2416 (.Y (nx2415), .A0 (nx2016), .A1 (nx1944), .S0 (nx2399)) ;
    xnor2 ix1939 (.Y (nx1938), .A0 (T12[7]), .A1 (nx2419)) ;
    xnor2 ix2420 (.Y (nx2419), .A0 (nx2421), .A1 (nx2423)) ;
    mux21 ix2422 (.Y (nx2421), .A0 (nx1928), .A1 (T21[6]), .S0 (nx2407)) ;
    xnor2 ix2424 (.Y (nx2423), .A0 (T22[6]), .A1 (T21[7])) ;
    xnor2 ix2087 (.Y (nx2086), .A0 (nx2084), .A1 (nx2078)) ;
    xnor2 ix2085 (.Y (nx2084), .A0 (nx2024), .A1 (nx2431)) ;
    mux21 ix2025 (.Y (nx2024), .A0 (nx2419), .A1 (nx2415), .S0 (nx1938)) ;
    xnor2 ix2432 (.Y (nx2431), .A0 (T22[7]), .A1 (nx2032)) ;
    mux21 ix2033 (.Y (nx2032), .A0 (nx2421), .A1 (nx2435), .S0 (nx2423)) ;
    inv01 ix2436 (.Y (nx2435), .A (T21[7])) ;
    xnor2 ix2079 (.Y (nx2078), .A0 (nx1860), .A1 (nx2301)) ;
    xnor2 ix2067 (.Y (nx2066), .A0 (nx2441), .A1 (nx2449)) ;
    nor02ii ix2444 (.Y (nx2441), .A0 (nx2042), .A1 (nx2447)) ;
    nor02ii ix2043 (.Y (nx2042), .A0 (nx2431), .A1 (nx2024)) ;
    nand02 ix2448 (.Y (nx2447), .A0 (T22[7]), .A1 (nx2032)) ;
    nor02ii ix2452 (.Y (nx2449), .A0 (nx1878), .A1 (nx2219)) ;
    nor02ii ix1879 (.Y (nx1878), .A0 (nx2301), .A1 (nx1860)) ;
    xnor2 ix2458 (.Y (nx2457), .A0 (nx3156), .A1 (nx3168)) ;
    xnor2 ix2462 (.Y (nx2461), .A0 (nx2196), .A1 (nx2158)) ;
    xnor2 ix2464 (.Y (nx2463), .A0 (nx2294), .A1 (nx2158)) ;
    mux21 ix2295 (.Y (nx2294), .A0 (nx2168), .A1 (nx2173), .S0 (nx2170)) ;
    xnor2 ix2468 (.Y (nx2467), .A0 (nx2145), .A1 (nx2469)) ;
    xnor2 ix3139 (.Y (nx3138), .A0 (nx2323), .A1 (nx2146)) ;
    xnor2 ix3133 (.Y (nx3132), .A0 (nx2475), .A1 (nx2146)) ;
    mux21 ix2476 (.Y (nx2475), .A0 (nx2331), .A1 (nx2294), .S0 (nx2158)) ;
    xnor2 ix2478 (.Y (nx2477), .A0 (nx3104), .A1 (nx3116)) ;
    xnor2 ix2482 (.Y (nx2481), .A0 (nx2204), .A1 (nx2134)) ;
    xnor2 ix2484 (.Y (nx2483), .A0 (nx2302), .A1 (nx2134)) ;
    mux21 ix2303 (.Y (nx2302), .A0 (nx2144), .A1 (nx2475), .S0 (nx2146)) ;
    xnor2 ix2488 (.Y (nx2487), .A0 (nx2129), .A1 (nx2489)) ;
    xnor2 ix3087 (.Y (nx3086), .A0 (nx2315), .A1 (nx2122)) ;
    xnor2 ix3081 (.Y (nx3080), .A0 (nx2495), .A1 (nx2122)) ;
    mux21 ix2496 (.Y (nx2495), .A0 (nx2497), .A1 (nx2302), .S0 (nx2134)) ;
    xnor2 ix2500 (.Y (nx2499), .A0 (nx3052), .A1 (nx3064)) ;
    xnor2 ix2504 (.Y (nx2503), .A0 (nx2212), .A1 (nx2110)) ;
    xnor2 ix2506 (.Y (nx2505), .A0 (nx2310), .A1 (nx2110)) ;
    mux21 ix2311 (.Y (nx2310), .A0 (nx2120), .A1 (nx2495), .S0 (nx2122)) ;
    xnor2 ix2510 (.Y (nx2509), .A0 (nx2113), .A1 (nx2511)) ;
    xnor2 ix3035 (.Y (nx3034), .A0 (nx2307), .A1 (nx2098)) ;
    xnor2 ix3029 (.Y (nx3028), .A0 (nx2517), .A1 (nx2098)) ;
    mux21 ix2518 (.Y (nx2517), .A0 (nx2519), .A1 (nx2310), .S0 (nx2110)) ;
    xnor2 ix2522 (.Y (nx2521), .A0 (nx3000), .A1 (nx3012)) ;
    xnor2 ix2526 (.Y (nx2525), .A0 (nx2220), .A1 (nx2086)) ;
    xnor2 ix2528 (.Y (nx2527), .A0 (nx2318), .A1 (nx2086)) ;
    mux21 ix2319 (.Y (nx2318), .A0 (nx2096), .A1 (nx2517), .S0 (nx2098)) ;
    xnor2 ix2532 (.Y (nx2531), .A0 (nx2091), .A1 (nx2533)) ;
    xnor2 ix2983 (.Y (nx2982), .A0 (nx2297), .A1 (nx2066)) ;
    xnor2 ix2977 (.Y (nx2976), .A0 (nx2539), .A1 (nx2066)) ;
    mux21 ix2540 (.Y (nx2539), .A0 (nx2541), .A1 (nx2318), .S0 (nx2086)) ;
    xnor2 ix2544 (.Y (nx2543), .A0 (nx2954), .A1 (nx2332)) ;
    mux21 ix2327 (.Y (nx2326), .A0 (nx2060), .A1 (nx2539), .S0 (nx2066)) ;
    mux21 ix3565 (.Y (nx3564), .A0 (nx2561), .A1 (nx3151), .S0 (nx3393)) ;
    nor02 ix2562 (.Y (nx2561), .A0 (nx760), .A1 (nx1382)) ;
    mux21 ix645 (.Y (nx644), .A0 (nx470), .A1 (nx2659), .S0 (nx482)) ;
    nand02 ix2572 (.Y (nx2571), .A0 (T02[7]), .A1 (nx284)) ;
    mux21 ix285 (.Y (nx284), .A0 (nx2575), .A1 (nx2601), .S0 (nx2603)) ;
    mux21 ix2576 (.Y (nx2575), .A0 (nx180), .A1 (T01[6]), .S0 (nx2599)) ;
    mux21 ix181 (.Y (nx180), .A0 (nx2579), .A1 (nx2595), .S0 (nx2597)) ;
    mux21 ix2580 (.Y (nx2579), .A0 (nx172), .A1 (T01[4]), .S0 (nx2593)) ;
    mux21 ix173 (.Y (nx172), .A0 (nx2583), .A1 (nx2589), .S0 (nx2591)) ;
    aoi32 ix2584 (.Y (nx2583), .A0 (T02[0]), .A1 (T01[1]), .A2 (nx158), .B0 (
          T01[2]), .B1 (T02[1])) ;
    inv01 ix2588 (.Y (nx2587), .A (T01[2])) ;
    inv01 ix2590 (.Y (nx2589), .A (T01[3])) ;
    xnor2 ix2592 (.Y (nx2591), .A0 (T02[2]), .A1 (T01[3])) ;
    xnor2 ix2594 (.Y (nx2593), .A0 (T02[3]), .A1 (T01[4])) ;
    inv01 ix2596 (.Y (nx2595), .A (T01[5])) ;
    xnor2 ix2598 (.Y (nx2597), .A0 (T02[4]), .A1 (T01[5])) ;
    xnor2 ix2600 (.Y (nx2599), .A0 (T02[5]), .A1 (T01[6])) ;
    inv01 ix2602 (.Y (nx2601), .A (T01[7])) ;
    xnor2 ix2604 (.Y (nx2603), .A0 (T02[6]), .A1 (T01[7])) ;
    mux21 ix277 (.Y (nx276), .A0 (nx2609), .A1 (nx2611), .S0 (nx190)) ;
    xnor2 ix2610 (.Y (nx2609), .A0 (nx2575), .A1 (nx2603)) ;
    mux21 ix2612 (.Y (nx2611), .A0 (nx268), .A1 (nx196), .S0 (nx2653)) ;
    mux21 ix269 (.Y (nx268), .A0 (nx2615), .A1 (nx2617), .S0 (nx206)) ;
    xnor2 ix2616 (.Y (nx2615), .A0 (nx2579), .A1 (nx2597)) ;
    mux21 ix2618 (.Y (nx2617), .A0 (nx260), .A1 (nx212), .S0 (nx2647)) ;
    mux21 ix261 (.Y (nx260), .A0 (nx2621), .A1 (nx2623), .S0 (nx222)) ;
    xnor2 ix2622 (.Y (nx2621), .A0 (nx2583), .A1 (nx2591)) ;
    aoi22 ix2624 (.Y (nx2623), .A0 (nx228), .A1 (T12[2]), .B0 (nx252), .B1 (
          nx230)) ;
    nand02 ix2628 (.Y (nx2627), .A0 (T02[0]), .A1 (T01[1])) ;
    xnor2 ix2630 (.Y (nx2629), .A0 (T02[1]), .A1 (T01[2])) ;
    mux21 ix253 (.Y (nx252), .A0 (nx2633), .A1 (nx2635), .S0 (nx242)) ;
    oai21 ix2634 (.Y (nx2633), .A0 (T01[1]), .A1 (T02[0]), .B0 (nx2627)) ;
    nand02 ix2636 (.Y (nx2635), .A0 (T12[0]), .A1 (T01[0])) ;
    xnor2 ix243 (.Y (nx242), .A0 (T12[1]), .A1 (nx2633)) ;
    xnor2 ix231 (.Y (nx230), .A0 (T12[2]), .A1 (nx2641)) ;
    xnor2 ix2642 (.Y (nx2641), .A0 (nx2627), .A1 (nx2629)) ;
    xnor2 ix223 (.Y (nx222), .A0 (T12[3]), .A1 (nx2621)) ;
    xnor2 ix213 (.Y (nx212), .A0 (nx172), .A1 (nx2593)) ;
    xnor2 ix2648 (.Y (nx2647), .A0 (T12[4]), .A1 (nx212)) ;
    xnor2 ix207 (.Y (nx206), .A0 (T12[5]), .A1 (nx2615)) ;
    xnor2 ix197 (.Y (nx196), .A0 (nx180), .A1 (nx2599)) ;
    xnor2 ix2654 (.Y (nx2653), .A0 (T12[6]), .A1 (nx196)) ;
    xnor2 ix191 (.Y (nx190), .A0 (T12[7]), .A1 (nx2609)) ;
    mux21 ix2660 (.Y (nx2659), .A0 (nx2661), .A1 (nx636), .S0 (nx502)) ;
    xnor2 ix2664 (.Y (nx2663), .A0 (T02[7]), .A1 (nx284)) ;
    mux21 ix637 (.Y (nx636), .A0 (nx510), .A1 (nx2669), .S0 (nx514)) ;
    xnor2 ix511 (.Y (nx510), .A0 (nx2611), .A1 (nx190)) ;
    mux21 ix2670 (.Y (nx2669), .A0 (nx2671), .A1 (nx628), .S0 (nx526)) ;
    mux21 ix629 (.Y (nx628), .A0 (nx534), .A1 (nx2677), .S0 (nx538)) ;
    xnor2 ix535 (.Y (nx534), .A0 (nx2617), .A1 (nx206)) ;
    mux21 ix2678 (.Y (nx2677), .A0 (nx2679), .A1 (nx620), .S0 (nx550)) ;
    mux21 ix621 (.Y (nx620), .A0 (nx558), .A1 (nx2683), .S0 (nx562)) ;
    xnor2 ix559 (.Y (nx558), .A0 (nx2623), .A1 (nx222)) ;
    mux21 ix2684 (.Y (nx2683), .A0 (nx2685), .A1 (nx612), .S0 (nx574)) ;
    xnor2 ix2686 (.Y (nx2685), .A0 (nx252), .A1 (nx230)) ;
    mux21 ix613 (.Y (nx612), .A0 (nx582), .A1 (nx2689), .S0 (nx586)) ;
    xnor2 ix583 (.Y (nx582), .A0 (nx2635), .A1 (nx242)) ;
    nor02ii ix2690 (.Y (nx2689), .A0 (nx2691), .A1 (nx2693)) ;
    oai21 ix2692 (.Y (nx2691), .A0 (T01[0]), .A1 (T12[0]), .B0 (nx2635)) ;
    oai21 ix2694 (.Y (nx2693), .A0 (T10[0]), .A1 (T21[0]), .B0 (nx2695)) ;
    nand02 ix2696 (.Y (nx2695), .A0 (T21[0]), .A1 (T10[0])) ;
    xnor2 ix587 (.Y (nx586), .A0 (nx584), .A1 (nx582)) ;
    xnor2 ix585 (.Y (nx584), .A0 (nx2695), .A1 (nx406)) ;
    xnor2 ix407 (.Y (nx406), .A0 (T21[1]), .A1 (nx2703)) ;
    oai21 ix2704 (.Y (nx2703), .A0 (T10[1]), .A1 (T20[0]), .B0 (nx2705)) ;
    nand02 ix2706 (.Y (nx2705), .A0 (T20[0]), .A1 (T10[1])) ;
    xnor2 ix575 (.Y (nx574), .A0 (nx2709), .A1 (nx2685)) ;
    xnor2 ix2710 (.Y (nx2709), .A0 (nx416), .A1 (nx394)) ;
    mux21 ix417 (.Y (nx416), .A0 (nx2703), .A1 (nx2695), .S0 (nx406)) ;
    xnor2 ix395 (.Y (nx394), .A0 (T21[2]), .A1 (nx2715)) ;
    xnor2 ix2716 (.Y (nx2715), .A0 (nx2705), .A1 (nx2717)) ;
    xnor2 ix2718 (.Y (nx2717), .A0 (T20[1]), .A1 (T10[2])) ;
    xnor2 ix563 (.Y (nx562), .A0 (nx560), .A1 (nx558)) ;
    xnor2 ix561 (.Y (nx560), .A0 (nx2723), .A1 (nx386)) ;
    aoi22 ix2724 (.Y (nx2723), .A0 (nx392), .A1 (T21[2]), .B0 (nx416), .B1 (
          nx394)) ;
    xnor2 ix387 (.Y (nx386), .A0 (T21[3]), .A1 (nx2729)) ;
    xnor2 ix2730 (.Y (nx2729), .A0 (nx2731), .A1 (nx2735)) ;
    aoi32 ix2732 (.Y (nx2731), .A0 (T20[0]), .A1 (T10[1]), .A2 (nx322), .B0 (
          T10[2]), .B1 (T20[1])) ;
    xnor2 ix2736 (.Y (nx2735), .A0 (T20[2]), .A1 (T10[3])) ;
    xnor2 ix551 (.Y (nx550), .A0 (nx548), .A1 (nx546)) ;
    xnor2 ix549 (.Y (nx548), .A0 (nx424), .A1 (nx2743)) ;
    mux21 ix425 (.Y (nx424), .A0 (nx2729), .A1 (nx2723), .S0 (nx386)) ;
    xnor2 ix2744 (.Y (nx2743), .A0 (T21[4]), .A1 (nx376)) ;
    xnor2 ix377 (.Y (nx376), .A0 (nx336), .A1 (nx2749)) ;
    mux21 ix337 (.Y (nx336), .A0 (nx2731), .A1 (nx2235), .S0 (nx2735)) ;
    xnor2 ix2750 (.Y (nx2749), .A0 (T20[3]), .A1 (T10[4])) ;
    xnor2 ix547 (.Y (nx546), .A0 (nx260), .A1 (nx2647)) ;
    xnor2 ix539 (.Y (nx538), .A0 (nx536), .A1 (nx534)) ;
    xnor2 ix537 (.Y (nx536), .A0 (nx2757), .A1 (nx370)) ;
    mux21 ix2758 (.Y (nx2757), .A0 (nx424), .A1 (nx376), .S0 (nx2743)) ;
    xnor2 ix371 (.Y (nx370), .A0 (T21[5]), .A1 (nx2761)) ;
    xnor2 ix2762 (.Y (nx2761), .A0 (nx2763), .A1 (nx2765)) ;
    mux21 ix2764 (.Y (nx2763), .A0 (nx336), .A1 (T10[4]), .S0 (nx2749)) ;
    xnor2 ix2766 (.Y (nx2765), .A0 (T20[4]), .A1 (T10[5])) ;
    xnor2 ix527 (.Y (nx526), .A0 (nx524), .A1 (nx522)) ;
    xnor2 ix525 (.Y (nx524), .A0 (nx432), .A1 (nx2773)) ;
    mux21 ix433 (.Y (nx432), .A0 (nx2761), .A1 (nx2757), .S0 (nx370)) ;
    xnor2 ix2774 (.Y (nx2773), .A0 (T21[6]), .A1 (nx360)) ;
    xnor2 ix361 (.Y (nx360), .A0 (nx344), .A1 (nx2779)) ;
    mux21 ix345 (.Y (nx344), .A0 (nx2763), .A1 (nx2241), .S0 (nx2765)) ;
    xnor2 ix2780 (.Y (nx2779), .A0 (T20[5]), .A1 (T10[6])) ;
    xnor2 ix523 (.Y (nx522), .A0 (nx268), .A1 (nx2653)) ;
    xnor2 ix515 (.Y (nx514), .A0 (nx512), .A1 (nx510)) ;
    xnor2 ix513 (.Y (nx512), .A0 (nx2787), .A1 (nx354)) ;
    mux21 ix2788 (.Y (nx2787), .A0 (nx432), .A1 (nx360), .S0 (nx2773)) ;
    xnor2 ix355 (.Y (nx354), .A0 (T21[7]), .A1 (nx2791)) ;
    xnor2 ix2792 (.Y (nx2791), .A0 (nx2793), .A1 (nx2795)) ;
    mux21 ix2794 (.Y (nx2793), .A0 (nx344), .A1 (T10[6]), .S0 (nx2779)) ;
    xnor2 ix2796 (.Y (nx2795), .A0 (T20[6]), .A1 (T10[7])) ;
    xnor2 ix503 (.Y (nx502), .A0 (nx500), .A1 (nx494)) ;
    xnor2 ix501 (.Y (nx500), .A0 (nx440), .A1 (nx2803)) ;
    mux21 ix441 (.Y (nx440), .A0 (nx2791), .A1 (nx2787), .S0 (nx354)) ;
    xnor2 ix2804 (.Y (nx2803), .A0 (T20[7]), .A1 (nx448)) ;
    mux21 ix449 (.Y (nx448), .A0 (nx2793), .A1 (nx2247), .S0 (nx2795)) ;
    xnor2 ix495 (.Y (nx494), .A0 (nx276), .A1 (nx2663)) ;
    xnor2 ix483 (.Y (nx482), .A0 (nx2811), .A1 (nx2819)) ;
    nor02ii ix2814 (.Y (nx2811), .A0 (nx458), .A1 (nx2817)) ;
    nor02ii ix459 (.Y (nx458), .A0 (nx2803), .A1 (nx440)) ;
    nand02 ix2818 (.Y (nx2817), .A0 (T20[7]), .A1 (nx448)) ;
    nor02ii ix2822 (.Y (nx2819), .A0 (nx294), .A1 (nx2571)) ;
    nor02ii ix295 (.Y (nx294), .A0 (nx2663), .A1 (nx276)) ;
    mux21 ix755 (.Y (nx754), .A0 (nx476), .A1 (nx2833), .S0 (nx482)) ;
    mux21 ix2834 (.Y (nx2833), .A0 (nx2835), .A1 (nx722), .S0 (nx502)) ;
    mux21 ix723 (.Y (nx722), .A0 (nx512), .A1 (nx2839), .S0 (nx514)) ;
    mux21 ix2840 (.Y (nx2839), .A0 (nx2841), .A1 (nx714), .S0 (nx526)) ;
    mux21 ix715 (.Y (nx714), .A0 (nx536), .A1 (nx2845), .S0 (nx538)) ;
    mux21 ix2846 (.Y (nx2845), .A0 (nx2847), .A1 (nx706), .S0 (nx550)) ;
    mux21 ix707 (.Y (nx706), .A0 (nx560), .A1 (nx2851), .S0 (nx562)) ;
    mux21 ix2852 (.Y (nx2851), .A0 (nx2709), .A1 (nx698), .S0 (nx574)) ;
    mux21 ix699 (.Y (nx698), .A0 (nx584), .A1 (nx2855), .S0 (nx586)) ;
    nor02ii ix2856 (.Y (nx2855), .A0 (nx2693), .A1 (nx2691)) ;
    mux21 ix1279 (.Y (nx1278), .A0 (nx1104), .A1 (nx2951), .S0 (nx1116)) ;
    nand02 ix2866 (.Y (nx2865), .A0 (T01[7]), .A1 (nx918)) ;
    mux21 ix919 (.Y (nx918), .A0 (nx2869), .A1 (nx2893), .S0 (nx2895)) ;
    mux21 ix2870 (.Y (nx2869), .A0 (nx814), .A1 (T01[5]), .S0 (nx2891)) ;
    mux21 ix815 (.Y (nx814), .A0 (nx2873), .A1 (nx2887), .S0 (nx2889)) ;
    mux21 ix2874 (.Y (nx2873), .A0 (nx806), .A1 (T01[3]), .S0 (nx2885)) ;
    mux21 ix807 (.Y (nx806), .A0 (nx2877), .A1 (nx2587), .S0 (nx2883)) ;
    aoi32 ix2878 (.Y (nx2877), .A0 (T00[1]), .A1 (T01[0]), .A2 (nx792), .B0 (
          T01[1]), .B1 (T00[2])) ;
    xnor2 ix2884 (.Y (nx2883), .A0 (T00[3]), .A1 (T01[2])) ;
    xnor2 ix2886 (.Y (nx2885), .A0 (T00[4]), .A1 (T01[3])) ;
    inv01 ix2888 (.Y (nx2887), .A (T01[4])) ;
    xnor2 ix2890 (.Y (nx2889), .A0 (T00[5]), .A1 (T01[4])) ;
    xnor2 ix2892 (.Y (nx2891), .A0 (T00[6]), .A1 (T01[5])) ;
    inv01 ix2894 (.Y (nx2893), .A (T01[6])) ;
    xnor2 ix2896 (.Y (nx2895), .A0 (T00[7]), .A1 (T01[6])) ;
    mux21 ix911 (.Y (nx910), .A0 (nx2901), .A1 (nx2903), .S0 (nx824)) ;
    xnor2 ix2902 (.Y (nx2901), .A0 (nx2869), .A1 (nx2895)) ;
    mux21 ix2904 (.Y (nx2903), .A0 (nx902), .A1 (nx830), .S0 (nx2945)) ;
    mux21 ix903 (.Y (nx902), .A0 (nx2907), .A1 (nx2909), .S0 (nx840)) ;
    xnor2 ix2908 (.Y (nx2907), .A0 (nx2873), .A1 (nx2889)) ;
    mux21 ix2910 (.Y (nx2909), .A0 (nx894), .A1 (nx846), .S0 (nx2939)) ;
    mux21 ix895 (.Y (nx894), .A0 (nx2913), .A1 (nx2915), .S0 (nx856)) ;
    xnor2 ix2914 (.Y (nx2913), .A0 (nx2877), .A1 (nx2883)) ;
    aoi22 ix2916 (.Y (nx2915), .A0 (nx862), .A1 (T02[2]), .B0 (nx886), .B1 (
          nx864)) ;
    nand02 ix2920 (.Y (nx2919), .A0 (T00[1]), .A1 (T01[0])) ;
    xnor2 ix2922 (.Y (nx2921), .A0 (T00[2]), .A1 (T01[1])) ;
    mux21 ix887 (.Y (nx886), .A0 (nx2925), .A1 (nx2927), .S0 (nx876)) ;
    oai21 ix2926 (.Y (nx2925), .A0 (T01[0]), .A1 (T00[1]), .B0 (nx2919)) ;
    nand02 ix2928 (.Y (nx2927), .A0 (T00[0]), .A1 (T02[0])) ;
    xnor2 ix877 (.Y (nx876), .A0 (T02[1]), .A1 (nx2925)) ;
    xnor2 ix865 (.Y (nx864), .A0 (T02[2]), .A1 (nx2933)) ;
    xnor2 ix2934 (.Y (nx2933), .A0 (nx2919), .A1 (nx2921)) ;
    xnor2 ix857 (.Y (nx856), .A0 (T02[3]), .A1 (nx2913)) ;
    xnor2 ix847 (.Y (nx846), .A0 (nx806), .A1 (nx2885)) ;
    xnor2 ix2940 (.Y (nx2939), .A0 (T02[4]), .A1 (nx846)) ;
    xnor2 ix841 (.Y (nx840), .A0 (T02[5]), .A1 (nx2907)) ;
    xnor2 ix831 (.Y (nx830), .A0 (nx814), .A1 (nx2891)) ;
    xnor2 ix2946 (.Y (nx2945), .A0 (T02[6]), .A1 (nx830)) ;
    xnor2 ix825 (.Y (nx824), .A0 (T02[7]), .A1 (nx2901)) ;
    mux21 ix2952 (.Y (nx2951), .A0 (nx2953), .A1 (nx1270), .S0 (nx1136)) ;
    xnor2 ix2956 (.Y (nx2955), .A0 (T01[7]), .A1 (nx918)) ;
    mux21 ix1271 (.Y (nx1270), .A0 (nx1144), .A1 (nx2961), .S0 (nx1148)) ;
    xnor2 ix1145 (.Y (nx1144), .A0 (nx2903), .A1 (nx824)) ;
    mux21 ix2962 (.Y (nx2961), .A0 (nx2963), .A1 (nx1262), .S0 (nx1160)) ;
    mux21 ix1263 (.Y (nx1262), .A0 (nx1168), .A1 (nx2969), .S0 (nx1172)) ;
    xnor2 ix1169 (.Y (nx1168), .A0 (nx2909), .A1 (nx840)) ;
    mux21 ix2970 (.Y (nx2969), .A0 (nx2971), .A1 (nx1254), .S0 (nx1184)) ;
    mux21 ix1255 (.Y (nx1254), .A0 (nx1192), .A1 (nx2977), .S0 (nx1196)) ;
    xnor2 ix1193 (.Y (nx1192), .A0 (nx2915), .A1 (nx856)) ;
    mux21 ix2978 (.Y (nx2977), .A0 (nx2979), .A1 (nx1246), .S0 (nx1208)) ;
    xnor2 ix2980 (.Y (nx2979), .A0 (nx886), .A1 (nx864)) ;
    mux21 ix1247 (.Y (nx1246), .A0 (nx1216), .A1 (nx2985), .S0 (nx1220)) ;
    xnor2 ix1217 (.Y (nx1216), .A0 (nx2927), .A1 (nx876)) ;
    nor02ii ix2986 (.Y (nx2985), .A0 (nx2987), .A1 (nx2989)) ;
    oai21 ix2988 (.Y (nx2987), .A0 (T02[0]), .A1 (T00[0]), .B0 (nx2927)) ;
    oai21 ix2990 (.Y (nx2989), .A0 (T20[0]), .A1 (T22[0]), .B0 (nx2991)) ;
    nand02 ix2992 (.Y (nx2991), .A0 (T22[0]), .A1 (T20[0])) ;
    xnor2 ix1221 (.Y (nx1220), .A0 (nx1218), .A1 (nx1216)) ;
    xnor2 ix1219 (.Y (nx1218), .A0 (nx2991), .A1 (nx1040)) ;
    xnor2 ix1041 (.Y (nx1040), .A0 (T22[1]), .A1 (nx2997)) ;
    oai21 ix2998 (.Y (nx2997), .A0 (T20[1]), .A1 (T21[0]), .B0 (nx2999)) ;
    nand02 ix3000 (.Y (nx2999), .A0 (T21[0]), .A1 (T20[1])) ;
    xnor2 ix1209 (.Y (nx1208), .A0 (nx3003), .A1 (nx2979)) ;
    xnor2 ix3004 (.Y (nx3003), .A0 (nx1050), .A1 (nx1028)) ;
    mux21 ix1051 (.Y (nx1050), .A0 (nx2997), .A1 (nx2991), .S0 (nx1040)) ;
    xnor2 ix1029 (.Y (nx1028), .A0 (T22[2]), .A1 (nx3007)) ;
    xnor2 ix3008 (.Y (nx3007), .A0 (nx2999), .A1 (nx3009)) ;
    xnor2 ix3010 (.Y (nx3009), .A0 (T21[1]), .A1 (T20[2])) ;
    xnor2 ix1197 (.Y (nx1196), .A0 (nx1194), .A1 (nx1192)) ;
    xnor2 ix1195 (.Y (nx1194), .A0 (nx3015), .A1 (nx1020)) ;
    aoi22 ix3016 (.Y (nx3015), .A0 (nx1026), .A1 (T22[2]), .B0 (nx1050), .B1 (
          nx1028)) ;
    xnor2 ix1021 (.Y (nx1020), .A0 (T22[3]), .A1 (nx3021)) ;
    xnor2 ix3022 (.Y (nx3021), .A0 (nx3023), .A1 (nx3029)) ;
    aoi32 ix3024 (.Y (nx3023), .A0 (T21[0]), .A1 (T20[1]), .A2 (nx956), .B0 (
          T20[2]), .B1 (T21[1])) ;
    xnor2 ix3030 (.Y (nx3029), .A0 (T21[2]), .A1 (T20[3])) ;
    xnor2 ix1185 (.Y (nx1184), .A0 (nx1182), .A1 (nx1180)) ;
    xnor2 ix1183 (.Y (nx1182), .A0 (nx1058), .A1 (nx3035)) ;
    mux21 ix1059 (.Y (nx1058), .A0 (nx3021), .A1 (nx3015), .S0 (nx1020)) ;
    xnor2 ix3036 (.Y (nx3035), .A0 (T22[4]), .A1 (nx1010)) ;
    xnor2 ix1011 (.Y (nx1010), .A0 (nx970), .A1 (nx3043)) ;
    mux21 ix971 (.Y (nx970), .A0 (nx3023), .A1 (nx3041), .S0 (nx3029)) ;
    inv01 ix3042 (.Y (nx3041), .A (T20[3])) ;
    xnor2 ix3044 (.Y (nx3043), .A0 (T21[3]), .A1 (T20[4])) ;
    xnor2 ix1181 (.Y (nx1180), .A0 (nx894), .A1 (nx2939)) ;
    xnor2 ix1173 (.Y (nx1172), .A0 (nx1170), .A1 (nx1168)) ;
    xnor2 ix1171 (.Y (nx1170), .A0 (nx3049), .A1 (nx1004)) ;
    mux21 ix3050 (.Y (nx3049), .A0 (nx1058), .A1 (nx1010), .S0 (nx3035)) ;
    xnor2 ix1005 (.Y (nx1004), .A0 (T22[5]), .A1 (nx3053)) ;
    xnor2 ix3054 (.Y (nx3053), .A0 (nx3055), .A1 (nx3057)) ;
    mux21 ix3056 (.Y (nx3055), .A0 (nx970), .A1 (T20[4]), .S0 (nx3043)) ;
    xnor2 ix3058 (.Y (nx3057), .A0 (T21[4]), .A1 (T20[5])) ;
    xnor2 ix1161 (.Y (nx1160), .A0 (nx1158), .A1 (nx1156)) ;
    xnor2 ix1159 (.Y (nx1158), .A0 (nx1066), .A1 (nx3065)) ;
    mux21 ix1067 (.Y (nx1066), .A0 (nx3053), .A1 (nx3049), .S0 (nx1004)) ;
    xnor2 ix3066 (.Y (nx3065), .A0 (T22[6]), .A1 (nx994)) ;
    xnor2 ix995 (.Y (nx994), .A0 (nx978), .A1 (nx3073)) ;
    mux21 ix979 (.Y (nx978), .A0 (nx3055), .A1 (nx3071), .S0 (nx3057)) ;
    inv01 ix3072 (.Y (nx3071), .A (T20[5])) ;
    xnor2 ix3074 (.Y (nx3073), .A0 (T21[5]), .A1 (T20[6])) ;
    xnor2 ix1157 (.Y (nx1156), .A0 (nx902), .A1 (nx2945)) ;
    xnor2 ix1149 (.Y (nx1148), .A0 (nx1146), .A1 (nx1144)) ;
    xnor2 ix1147 (.Y (nx1146), .A0 (nx3081), .A1 (nx988)) ;
    mux21 ix3082 (.Y (nx3081), .A0 (nx1066), .A1 (nx994), .S0 (nx3065)) ;
    xnor2 ix989 (.Y (nx988), .A0 (T22[7]), .A1 (nx3085)) ;
    xnor2 ix3086 (.Y (nx3085), .A0 (nx3087), .A1 (nx3089)) ;
    mux21 ix3088 (.Y (nx3087), .A0 (nx978), .A1 (T20[6]), .S0 (nx3073)) ;
    xnor2 ix3090 (.Y (nx3089), .A0 (T21[6]), .A1 (T20[7])) ;
    xnor2 ix1137 (.Y (nx1136), .A0 (nx1134), .A1 (nx1128)) ;
    xnor2 ix1135 (.Y (nx1134), .A0 (nx1074), .A1 (nx3097)) ;
    mux21 ix1075 (.Y (nx1074), .A0 (nx3085), .A1 (nx3081), .S0 (nx988)) ;
    xnor2 ix3098 (.Y (nx3097), .A0 (T21[7]), .A1 (nx1082)) ;
    mux21 ix1083 (.Y (nx1082), .A0 (nx3087), .A1 (nx3101), .S0 (nx3089)) ;
    inv01 ix3102 (.Y (nx3101), .A (T20[7])) ;
    xnor2 ix1129 (.Y (nx1128), .A0 (nx910), .A1 (nx2955)) ;
    xnor2 ix1117 (.Y (nx1116), .A0 (nx3107), .A1 (nx3113)) ;
    nor02ii ix3109 (.Y (nx3107), .A0 (nx1092), .A1 (nx3111)) ;
    nor02ii ix1093 (.Y (nx1092), .A0 (nx3097), .A1 (nx1074)) ;
    nand02 ix3112 (.Y (nx3111), .A0 (T21[7]), .A1 (nx1082)) ;
    nor02ii ix3116 (.Y (nx3113), .A0 (nx928), .A1 (nx2865)) ;
    nor02ii ix929 (.Y (nx928), .A0 (nx2955), .A1 (nx910)) ;
    mux21 ix1377 (.Y (nx1376), .A0 (nx1110), .A1 (nx3127), .S0 (nx1116)) ;
    mux21 ix3128 (.Y (nx3127), .A0 (nx3129), .A1 (nx1368), .S0 (nx1136)) ;
    mux21 ix1369 (.Y (nx1368), .A0 (nx1146), .A1 (nx3133), .S0 (nx1148)) ;
    mux21 ix3134 (.Y (nx3133), .A0 (nx3135), .A1 (nx1360), .S0 (nx1160)) ;
    mux21 ix1361 (.Y (nx1360), .A0 (nx1170), .A1 (nx3139), .S0 (nx1172)) ;
    mux21 ix3140 (.Y (nx3139), .A0 (nx3141), .A1 (nx1352), .S0 (nx1184)) ;
    mux21 ix1353 (.Y (nx1352), .A0 (nx1194), .A1 (nx3145), .S0 (nx1196)) ;
    mux21 ix3146 (.Y (nx3145), .A0 (nx3003), .A1 (nx1344), .S0 (nx1208)) ;
    mux21 ix1345 (.Y (nx1344), .A0 (nx1218), .A1 (nx3149), .S0 (nx1220)) ;
    nor02ii ix3150 (.Y (nx3149), .A0 (nx2989), .A1 (nx2987)) ;
    mux21 ix3152 (.Y (nx3151), .A0 (nx3310), .A1 (nx3548), .S0 (nx3389)) ;
    mux21 ix3311 (.Y (nx3310), .A0 (nx3155), .A1 (nx3167), .S0 (nx3837)) ;
    xnor2 ix1399 (.Y (nx1398), .A0 (nx2659), .A1 (nx482)) ;
    xnor2 ix1393 (.Y (nx1392), .A0 (nx2833), .A1 (nx482)) ;
    nand02 ix3164 (.Y (nx3161), .A0 (nx644), .A1 (nx462)) ;
    xnor2 ix1411 (.Y (nx1410), .A0 (nx2951), .A1 (nx1116)) ;
    xnor2 ix1405 (.Y (nx1404), .A0 (nx3127), .A1 (nx1116)) ;
    nand02 ix3175 (.Y (nx3173), .A0 (nx1278), .A1 (nx462)) ;
    mux21 ix3180 (.Y (nx3179), .A0 (nx760), .A1 (nx1700), .S0 (nx3317)) ;
    mux21 ix1701 (.Y (nx1700), .A0 (nx3155), .A1 (nx3183), .S0 (nx3315)) ;
    mux21 ix3184 (.Y (nx3183), .A0 (nx734), .A1 (nx1684), .S0 (nx3307)) ;
    xnor2 ix3188 (.Y (nx3187), .A0 (nx636), .A1 (nx502)) ;
    xnor2 ix3190 (.Y (nx3189), .A0 (nx722), .A1 (nx502)) ;
    mux21 ix1685 (.Y (nx1684), .A0 (nx3193), .A1 (nx3199), .S0 (nx3301)) ;
    xnor2 ix1439 (.Y (nx1438), .A0 (nx2669), .A1 (nx514)) ;
    xnor2 ix1433 (.Y (nx1432), .A0 (nx2839), .A1 (nx514)) ;
    mux21 ix3200 (.Y (nx3199), .A0 (nx1468), .A1 (nx1668), .S0 (nx3293)) ;
    xnor2 ix3204 (.Y (nx3203), .A0 (nx628), .A1 (nx526)) ;
    xnor2 ix3206 (.Y (nx3205), .A0 (nx714), .A1 (nx526)) ;
    mux21 ix1669 (.Y (nx1668), .A0 (nx3209), .A1 (nx3215), .S0 (nx3285)) ;
    xnor2 ix1491 (.Y (nx1490), .A0 (nx2677), .A1 (nx538)) ;
    xnor2 ix1485 (.Y (nx1484), .A0 (nx2845), .A1 (nx538)) ;
    mux21 ix3216 (.Y (nx3215), .A0 (nx1520), .A1 (nx1652), .S0 (nx3277)) ;
    xnor2 ix3220 (.Y (nx3219), .A0 (nx620), .A1 (nx550)) ;
    xnor2 ix3222 (.Y (nx3221), .A0 (nx706), .A1 (nx550)) ;
    mux21 ix1653 (.Y (nx1652), .A0 (nx3225), .A1 (nx3231), .S0 (nx3269)) ;
    xnor2 ix1543 (.Y (nx1542), .A0 (nx2683), .A1 (nx562)) ;
    xnor2 ix1537 (.Y (nx1536), .A0 (nx2851), .A1 (nx562)) ;
    mux21 ix3232 (.Y (nx3231), .A0 (nx1572), .A1 (nx1636), .S0 (nx3261)) ;
    xnor2 ix3236 (.Y (nx3235), .A0 (nx612), .A1 (nx574)) ;
    xnor2 ix3238 (.Y (nx3237), .A0 (nx698), .A1 (nx574)) ;
    mux21 ix1637 (.Y (nx1636), .A0 (nx3241), .A1 (nx3247), .S0 (nx3253)) ;
    xnor2 ix1595 (.Y (nx1594), .A0 (nx2689), .A1 (nx586)) ;
    xnor2 ix1589 (.Y (nx1588), .A0 (nx2855), .A1 (nx586)) ;
    nand02 ix3248 (.Y (nx3247), .A0 (nx1618), .A1 (nx3251)) ;
    nor02 ix3252 (.Y (nx3251), .A0 (nx3149), .A1 (nx2985)) ;
    xnor2 ix3254 (.Y (nx3253), .A0 (nx3241), .A1 (nx3255)) ;
    xnor2 ix1607 (.Y (nx1606), .A0 (nx2985), .A1 (nx1220)) ;
    xnor2 ix1601 (.Y (nx1600), .A0 (nx3149), .A1 (nx1220)) ;
    xnor2 ix3262 (.Y (nx3261), .A0 (nx1572), .A1 (nx1584)) ;
    xnor2 ix3266 (.Y (nx3265), .A0 (nx1246), .A1 (nx1208)) ;
    xnor2 ix3268 (.Y (nx3267), .A0 (nx1344), .A1 (nx1208)) ;
    xnor2 ix3270 (.Y (nx3269), .A0 (nx3225), .A1 (nx3271)) ;
    xnor2 ix1555 (.Y (nx1554), .A0 (nx2977), .A1 (nx1196)) ;
    xnor2 ix1549 (.Y (nx1548), .A0 (nx3145), .A1 (nx1196)) ;
    xnor2 ix3278 (.Y (nx3277), .A0 (nx1520), .A1 (nx1532)) ;
    xnor2 ix3282 (.Y (nx3281), .A0 (nx1254), .A1 (nx1184)) ;
    xnor2 ix3284 (.Y (nx3283), .A0 (nx1352), .A1 (nx1184)) ;
    xnor2 ix3286 (.Y (nx3285), .A0 (nx3209), .A1 (nx3287)) ;
    xnor2 ix1503 (.Y (nx1502), .A0 (nx2969), .A1 (nx1172)) ;
    xnor2 ix1497 (.Y (nx1496), .A0 (nx3139), .A1 (nx1172)) ;
    xnor2 ix3294 (.Y (nx3293), .A0 (nx1468), .A1 (nx1480)) ;
    xnor2 ix3298 (.Y (nx3297), .A0 (nx1262), .A1 (nx1160)) ;
    xnor2 ix3300 (.Y (nx3299), .A0 (nx1360), .A1 (nx1160)) ;
    xnor2 ix3302 (.Y (nx3301), .A0 (nx3193), .A1 (nx3303)) ;
    xnor2 ix1451 (.Y (nx1450), .A0 (nx2961), .A1 (nx1148)) ;
    xnor2 ix1445 (.Y (nx1444), .A0 (nx3133), .A1 (nx1148)) ;
    xnor2 ix3308 (.Y (nx3307), .A0 (nx734), .A1 (nx1428)) ;
    xnor2 ix3312 (.Y (nx3311), .A0 (nx1270), .A1 (nx1136)) ;
    xnor2 ix3314 (.Y (nx3313), .A0 (nx1368), .A1 (nx1136)) ;
    xnor2 ix3316 (.Y (nx3315), .A0 (nx3155), .A1 (nx3167)) ;
    xnor2 ix3318 (.Y (nx3317), .A0 (nx760), .A1 (nx1382)) ;
    mux21 ix3549 (.Y (nx3548), .A0 (nx3321), .A1 (nx3323), .S0 (nx3385)) ;
    mux21 ix3322 (.Y (nx3321), .A0 (nx734), .A1 (nx1428), .S0 (nx3837)) ;
    mux21 ix3324 (.Y (nx3323), .A0 (nx3346), .A1 (nx3532), .S0 (nx3381)) ;
    mux21 ix3347 (.Y (nx3346), .A0 (nx3193), .A1 (nx3303), .S0 (nx3837)) ;
    mux21 ix3533 (.Y (nx3532), .A0 (nx3329), .A1 (nx3331), .S0 (nx3377)) ;
    mux21 ix3330 (.Y (nx3329), .A0 (nx1468), .A1 (nx1480), .S0 (nx3837)) ;
    mux21 ix3332 (.Y (nx3331), .A0 (nx3382), .A1 (nx3516), .S0 (nx3373)) ;
    mux21 ix3383 (.Y (nx3382), .A0 (nx3209), .A1 (nx3287), .S0 (nx3837)) ;
    mux21 ix3517 (.Y (nx3516), .A0 (nx3337), .A1 (nx3339), .S0 (nx3369)) ;
    mux21 ix3338 (.Y (nx3337), .A0 (nx1520), .A1 (nx1532), .S0 (nx3837)) ;
    mux21 ix3340 (.Y (nx3339), .A0 (nx3418), .A1 (nx3500), .S0 (nx3365)) ;
    mux21 ix3419 (.Y (nx3418), .A0 (nx3225), .A1 (nx3271), .S0 (nx3839)) ;
    mux21 ix3501 (.Y (nx3500), .A0 (nx3343), .A1 (nx3345), .S0 (nx3361)) ;
    mux21 ix3344 (.Y (nx3343), .A0 (nx1572), .A1 (nx1584), .S0 (nx3839)) ;
    mux21 ix3346 (.Y (nx3345), .A0 (nx3454), .A1 (nx3484), .S0 (nx3357)) ;
    mux21 ix3455 (.Y (nx3454), .A0 (nx3241), .A1 (nx3255), .S0 (nx3839)) ;
    nor02ii ix3485 (.Y (nx3484), .A0 (nx3480), .A1 (nx3472)) ;
    nor02 ix3352 (.Y (nx3351), .A0 (nx2087), .A1 (nx1907)) ;
    mux21 ix3473 (.Y (nx3472), .A0 (nx3355), .A1 (nx3251), .S0 (nx3839)) ;
    nor02 ix3356 (.Y (nx3355), .A0 (nx2855), .A1 (nx2689)) ;
    xnor2 ix3358 (.Y (nx3357), .A0 (nx3454), .A1 (nx3462)) ;
    xnor2 ix3362 (.Y (nx3361), .A0 (nx3343), .A1 (nx3363)) ;
    xnor2 ix3366 (.Y (nx3365), .A0 (nx3418), .A1 (nx3426)) ;
    xnor2 ix3370 (.Y (nx3369), .A0 (nx3337), .A1 (nx3371)) ;
    xnor2 ix3374 (.Y (nx3373), .A0 (nx3382), .A1 (nx3390)) ;
    xnor2 ix3378 (.Y (nx3377), .A0 (nx3329), .A1 (nx3379)) ;
    xnor2 ix3382 (.Y (nx3381), .A0 (nx3346), .A1 (nx3354)) ;
    xnor2 ix3386 (.Y (nx3385), .A0 (nx3321), .A1 (nx3387)) ;
    xnor2 ix3390 (.Y (nx3389), .A0 (nx3310), .A1 (nx3318)) ;
    xnor2 ix3394 (.Y (nx3393), .A0 (nx2561), .A1 (nx3395)) ;
    nor02 ix3396 (.Y (nx3395), .A0 (nx2954), .A1 (nx2332)) ;
    nand03 ix3905 (.Y (EDGE), .A0 (nx3411), .A1 (nx3637), .A2 (nx3639)) ;
    nand03 ix3414 (.Y (nx3413), .A0 (nx3826), .A1 (nx3866), .A2 (nx3874)) ;
    mux21 ix3867 (.Y (nx3866), .A0 (nx3419), .A1 (nx3617), .S0 (nx3629)) ;
    mux21 ix3420 (.Y (nx3419), .A0 (nx3786), .A1 (nx3764), .S0 (nx3788)) ;
    nand02 ix3428 (.Y (nx3427), .A0 (nx3839), .A1 (nx3798)) ;
    mux21 ix3765 (.Y (nx3764), .A0 (nx3451), .A1 (nx3586), .S0 (nx3589)) ;
    mux21 ix3452 (.Y (nx3451), .A0 (nx3622), .A1 (nx3756), .S0 (nx3632)) ;
    mux21 ix3757 (.Y (nx3756), .A0 (nx3475), .A1 (nx3555), .S0 (nx3559)) ;
    mux21 ix3476 (.Y (nx3475), .A0 (nx3678), .A1 (nx3748), .S0 (nx3688)) ;
    mux21 ix3749 (.Y (nx3748), .A0 (nx3499), .A1 (nx3523), .S0 (nx3527)) ;
    aoi221 ix3504 (.Y (nx3503), .A0 (nx3142), .A1 (nx3806), .B0 (nx1546), .B1 (
           nx3804), .C0 (nx3740)) ;
    oai22 ix3741 (.Y (nx3740), .A0 (nx2145), .A1 (nx3841), .B0 (nx3271), .B1 (
          nx3407)) ;
    aoi221 ix3524 (.Y (nx3523), .A0 (nx3116), .A1 (nx3806), .B0 (nx1520), .B1 (
           nx3804), .C0 (nx3704)) ;
    ao22 ix3705 (.Y (nx3704), .A0 (nx3104), .A1 (nx3588), .B0 (nx1532), .B1 (
         nx3580)) ;
    xnor2 ix3528 (.Y (nx3527), .A0 (nx3529), .A1 (nx3523)) ;
    xnor2 ix3689 (.Y (nx3688), .A0 (nx3686), .A1 (nx3535)) ;
    aoi221 ix3536 (.Y (nx3535), .A0 (nx3090), .A1 (nx3806), .B0 (nx1494), .B1 (
           nx3804), .C0 (nx3676)) ;
    oai22 ix3677 (.Y (nx3676), .A0 (nx2129), .A1 (nx3841), .B0 (nx3287), .B1 (
          nx3407)) ;
    aoi221 ix3556 (.Y (nx3555), .A0 (nx3064), .A1 (nx3806), .B0 (nx1468), .B1 (
           nx3804), .C0 (nx3648)) ;
    ao22 ix3649 (.Y (nx3648), .A0 (nx3052), .A1 (nx3588), .B0 (nx1480), .B1 (
         nx3580)) ;
    xnor2 ix3560 (.Y (nx3559), .A0 (nx3561), .A1 (nx3555)) ;
    xnor2 ix3633 (.Y (nx3632), .A0 (nx3630), .A1 (nx3567)) ;
    aoi221 ix3568 (.Y (nx3567), .A0 (nx3038), .A1 (nx3806), .B0 (nx1442), .B1 (
           nx3804), .C0 (nx3620)) ;
    oai22 ix3621 (.Y (nx3620), .A0 (nx2113), .A1 (nx3841), .B0 (nx3303), .B1 (
          nx3407)) ;
    aoi221 ix3587 (.Y (nx3586), .A0 (nx3012), .A1 (nx3574), .B0 (nx734), .B1 (
           nx3568), .C0 (nx3592)) ;
    ao22 ix3593 (.Y (nx3592), .A0 (nx3000), .A1 (nx3588), .B0 (nx1428), .B1 (
         nx3580)) ;
    xnor2 ix3590 (.Y (nx3589), .A0 (nx3591), .A1 (nx3586)) ;
    xnor2 ix3789 (.Y (nx3788), .A0 (nx3772), .A1 (nx3597)) ;
    aoi221 ix3598 (.Y (nx3597), .A0 (nx2986), .A1 (nx3574), .B0 (nx1402), .B1 (
           nx3568), .C0 (nx3784)) ;
    oai22 ix3785 (.Y (nx3784), .A0 (nx2091), .A1 (nx3841), .B0 (nx3167), .B1 (
          nx3407)) ;
    aoi221 ix3618 (.Y (nx3617), .A0 (nx2332), .A1 (nx3574), .B0 (nx760), .B1 (
           nx3568), .C0 (nx3838)) ;
    xnor2 ix3630 (.Y (nx3629), .A0 (nx3631), .A1 (nx3617)) ;
    nand02 ix3899 (.Y (nx3898), .A0 (nx2561), .A1 (nx3395)) ;
    xnor2 ix3638 (.Y (nx3637), .A0 (nx3419), .A1 (nx3629)) ;
    aoi22 ix3640 (.Y (nx3639), .A0 (nx3790), .A1 (nx3816), .B0 (nx3413), .B1 (
          nx3882)) ;
    oai21 ix3817 (.Y (nx3816), .A0 (nx3645), .A1 (nx3647), .B0 (nx3659)) ;
    xnor2 ix3646 (.Y (nx3645), .A0 (nx3756), .A1 (nx3632)) ;
    xnor2 ix3650 (.Y (nx3649), .A0 (nx3748), .A1 (nx3688)) ;
    xor2 ix3652 (.Y (nx3651), .A0 (nx3744), .A1 (nx3527)) ;
    nor02 ix3745 (.Y (nx3744), .A0 (nx3501), .A1 (nx3503)) ;
    xnor2 ix3656 (.Y (nx3655), .A0 (nx3501), .A1 (nx3503)) ;
    xnor2 ix3658 (.Y (nx3657), .A0 (nx3475), .A1 (nx3559)) ;
    xnor2 ix3660 (.Y (nx3659), .A0 (nx3451), .A1 (nx3589)) ;
    aoi21 ix3927 (.Y (DIRECTION[2]), .A0 (nx3407), .A1 (nx3843), .B0 (nx3667)) ;
    xnor2 ix3901 (.Y (nx3900), .A0 (nx3413), .A1 (nx3898)) ;
    nor03 ix3678 (.Y (nx3677), .A0 (nx3874), .A1 (nx3866), .A2 (nx3826)) ;
    xnor2 ix3680 (.Y (nx3679), .A0 (nx3764), .A1 (nx3788)) ;
    nand04 ix3813 (.Y (nx3812), .A0 (nx3649), .A1 (nx3651), .A2 (nx3655), .A3 (
           nx3657)) ;
    or02 ix133 (.Y (O_VALID), .A0 (READY), .A1 (fsm_inst_state_4)) ;
    dffr fsm_inst_reg_state_1 (.Q (READY), .QB (\$dummy [0]), .D (nx12), .CLK (
         CLOCK), .R (RESET)) ;
    oai21 ix13 (.Y (nx12), .A0 (I_VALID), .A1 (nx3695), .B0 (nx3701)) ;
    nor02 ix3696 (.Y (nx3695), .A0 (fsm_inst_state_0), .A1 (READY)) ;
    dffs_ni fsm_inst_reg_state_0 (.Q (fsm_inst_state_0), .QB (\$dummy [1]), .D (
            nx1607), .CLK (CLOCK), .S (RESET)) ;
    dffr fsm_inst_reg_state_4 (.Q (fsm_inst_state_4), .QB (nx3701), .D (nx126), 
         .CLK (CLOCK), .R (RESET)) ;
    dffr timed_signal_inst_reg_finished (.Q (timer_finished), .QB (\$dummy [2])
         , .D (nx3810), .CLK (CLOCK), .R (nx3796)) ;
    nand02 ix1764 (.Y (nx1763), .A0 (nx3863), .A1 (nx1677)) ;
    dffr timed_signal_inst_reg_time_remaining_7 (.Q (\$dummy [3]), .QB (nx3711)
         , .D (nx1763), .CLK (CLOCK), .R (nx3794)) ;
    dffr fsm_inst_reg_state_3 (.Q (\$dummy [4]), .QB (nx3719), .D (nx20), .CLK (
         CLOCK), .R (RESET)) ;
    inv01 ix21 (.Y (nx20), .A (nx3717)) ;
    oai21 ix3718 (.Y (nx3717), .A0 (fsm_inst_state_0), .A1 (READY), .B0 (I_VALID
          )) ;
    nand02 ix105 (.Y (nx1677), .A0 (nx3721), .A1 (nx3773)) ;
    nand02 ix81 (.Y (nx1679), .A0 (nx3725), .A1 (nx3759)) ;
    dffr timed_signal_inst_reg_time_remaining_0 (.Q (
         timed_signal_inst_time_remaining_0), .QB (\$dummy [5]), .D (nx1693), .CLK (
         CLOCK), .R (nx3794)) ;
    aoi21 ix3736 (.Y (nx3735), .A0 (timed_signal_inst_time_remaining_1), .A1 (
          timed_signal_inst_time_remaining_0), .B0 (nx3737)) ;
    dffr timed_signal_inst_reg_time_remaining_1 (.Q (
         timed_signal_inst_time_remaining_1), .QB (nx3739), .D (nx1703), .CLK (
         CLOCK), .R (nx3794)) ;
    dffs_ni timed_signal_inst_reg_time_remaining_2 (.Q (
            timed_signal_inst_time_remaining_2), .QB (nx3747), .D (nx1713), .CLK (
            CLOCK), .S (nx3794)) ;
    nor03 ix3756 (.Y (nx3755), .A0 (timed_signal_inst_time_remaining_0), .A1 (
          timed_signal_inst_time_remaining_1), .A2 (
          timed_signal_inst_time_remaining_2)) ;
    dffr timed_signal_inst_reg_time_remaining_3 (.Q (\$dummy [6]), .QB (nx3757)
         , .D (nx1723), .CLK (CLOCK), .R (nx3794)) ;
    dffr timed_signal_inst_reg_time_remaining_4 (.Q (\$dummy [7]), .QB (nx3759)
         , .D (nx1733), .CLK (CLOCK), .R (nx3794)) ;
    aoi21 ix3770 (.Y (nx3769), .A0 (timed_signal_inst_time_remaining_5), .A1 (
          nx1679), .B0 (nx3721)) ;
    dffr timed_signal_inst_reg_time_remaining_5 (.Q (
         timed_signal_inst_time_remaining_5), .QB (nx3771), .D (nx1743), .CLK (
         CLOCK), .R (nx3796)) ;
    dffr timed_signal_inst_reg_time_remaining_6 (.Q (\$dummy [8]), .QB (nx3773)
         , .D (nx1753), .CLK (CLOCK), .R (nx3796)) ;
    oai21 ix121 (.Y (nx120), .A0 (timer_finished), .A1 (nx3785), .B0 (nx3719)) ;
    dffr fsm_inst_reg_state_2 (.Q (\$dummy [9]), .QB (nx3785), .D (nx120), .CLK (
         CLOCK), .R (RESET)) ;
    inv01 ix3412 (.Y (nx3411), .A (nx3900)) ;
    inv01 ix3883 (.Y (nx3882), .A (nx3677)) ;
    inv01 ix3648 (.Y (nx3647), .A (nx3812)) ;
    inv01 ix3791 (.Y (nx3790), .A (nx3679)) ;
    inv01 ix3787 (.Y (nx3786), .A (nx3597)) ;
    inv01 ix3500 (.Y (nx3499), .A (nx3744)) ;
    inv01 ix3679 (.Y (nx3678), .A (nx3535)) ;
    inv01 ix3623 (.Y (nx3622), .A (nx3567)) ;
    inv01 ix3408 (.Y (nx3407), .A (nx3580)) ;
    inv01 ix3569 (.Y (nx3568), .A (nx3427)) ;
    inv01 ix3402 (.Y (nx3401), .A (nx3564)) ;
    inv01 ix3203 (.Y (nx3202), .A (nx3351)) ;
    inv01 ix3143 (.Y (nx3142), .A (nx2469)) ;
    inv01 ix3091 (.Y (nx3090), .A (nx2489)) ;
    inv01 ix3039 (.Y (nx3038), .A (nx2511)) ;
    inv01 ix2987 (.Y (nx2986), .A (nx2533)) ;
    inv01 ix2853 (.Y (nx2852), .A (nx2097)) ;
    inv01 ix2080 (.Y (nx2079), .A (nx2754)) ;
    inv01 ix1894 (.Y (nx1893), .A (nx2752)) ;
    inv01 ix2074 (.Y (nx2073), .A (nx2730)) ;
    inv01 ix1886 (.Y (nx1885), .A (nx2728)) ;
    inv01 ix2068 (.Y (nx2067), .A (nx2706)) ;
    inv01 ix1876 (.Y (nx1875), .A (nx2700)) ;
    inv01 ix2683 (.Y (nx2682), .A (nx2037)) ;
    inv01 ix2677 (.Y (nx2676), .A (nx2045)) ;
    inv01 ix2599 (.Y (nx2598), .A (nx1933)) ;
    inv01 ix2529 (.Y (nx2528), .A (nx1935)) ;
    inv01 ix2435 (.Y (nx2434), .A (nx1855)) ;
    inv01 ix2365 (.Y (nx2364), .A (nx1843)) ;
    inv01 ix2231 (.Y (nx2230), .A (nx2211)) ;
    inv01 ix2498 (.Y (nx2497), .A (nx2132)) ;
    inv01 ix2318 (.Y (nx2317), .A (nx2130)) ;
    inv01 ix2520 (.Y (nx2519), .A (nx2108)) ;
    inv01 ix2310 (.Y (nx2309), .A (nx2106)) ;
    inv01 ix2542 (.Y (nx2541), .A (nx2084)) ;
    inv01 ix2300 (.Y (nx2299), .A (nx2078)) ;
    inv01 ix2061 (.Y (nx2060), .A (nx2441)) ;
    inv01 ix2055 (.Y (nx2054), .A (nx2449)) ;
    inv01 ix1977 (.Y (nx1976), .A (nx2337)) ;
    inv01 ix1907 (.Y (nx1906), .A (nx2339)) ;
    inv01 ix1813 (.Y (nx1812), .A (nx2279)) ;
    inv01 ix1743 (.Y (nx1742), .A (nx2273)) ;
    inv01 ix1619 (.Y (nx1618), .A (nx3355)) ;
    inv01 ix1547 (.Y (nx1546), .A (nx3225)) ;
    inv01 ix1495 (.Y (nx1494), .A (nx3209)) ;
    inv01 ix1443 (.Y (nx1442), .A (nx3193)) ;
    inv01 ix1403 (.Y (nx1402), .A (nx3155)) ;
    inv01 ix1281 (.Y (nx1280), .A (nx3173)) ;
    inv01 ix3142 (.Y (nx3141), .A (nx1182)) ;
    inv01 ix2972 (.Y (nx2971), .A (nx1180)) ;
    inv01 ix3136 (.Y (nx3135), .A (nx1158)) ;
    inv01 ix2964 (.Y (nx2963), .A (nx1156)) ;
    inv01 ix3130 (.Y (nx3129), .A (nx1134)) ;
    inv01 ix2954 (.Y (nx2953), .A (nx1128)) ;
    inv01 ix1111 (.Y (nx1110), .A (nx3107)) ;
    inv01 ix1105 (.Y (nx1104), .A (nx3113)) ;
    inv01 ix1027 (.Y (nx1026), .A (nx3007)) ;
    inv01 ix957 (.Y (nx956), .A (nx3009)) ;
    inv01 ix863 (.Y (nx862), .A (nx2933)) ;
    inv01 ix793 (.Y (nx792), .A (nx2921)) ;
    inv01 ix647 (.Y (nx646), .A (nx3161)) ;
    inv01 ix2848 (.Y (nx2847), .A (nx548)) ;
    inv01 ix2680 (.Y (nx2679), .A (nx546)) ;
    inv01 ix2842 (.Y (nx2841), .A (nx524)) ;
    inv01 ix2672 (.Y (nx2671), .A (nx522)) ;
    inv01 ix2836 (.Y (nx2835), .A (nx500)) ;
    inv01 ix2662 (.Y (nx2661), .A (nx494)) ;
    inv01 ix477 (.Y (nx476), .A (nx2811)) ;
    inv01 ix471 (.Y (nx470), .A (nx2819)) ;
    inv01 ix393 (.Y (nx392), .A (nx2715)) ;
    inv01 ix323 (.Y (nx322), .A (nx2717)) ;
    inv01 ix229 (.Y (nx228), .A (nx2641)) ;
    inv01 ix159 (.Y (nx158), .A (nx2629)) ;
    inv01 ix3668 (.Y (nx3667), .A (EDGE)) ;
    inv01 ix3793 (.Y (nx3794), .A (nx3719)) ;
    inv01 ix3795 (.Y (nx3796), .A (nx3719)) ;
    inv01 ix3797 (.Y (nx3798), .A (nx3859)) ;
    inv01 ix3803 (.Y (nx3804), .A (nx3427)) ;
    inv01 ix3809 (.Y (nx3810), .A (nx3711)) ;
    inv01 ix3811 (.Y (nx3813), .A (nx2053)) ;
    buf02 ix3836 (.Y (nx3837), .A (nx3179)) ;
    buf02 ix3838 (.Y (nx3839), .A (nx3179)) ;
    inv01 ix3840 (.Y (nx3841), .A (nx3588)) ;
    inv01 ix3842 (.Y (nx3843), .A (nx3588)) ;
    and02 ix3575 (.Y (nx3574), .A0 (nx3867), .A1 (nx3859)) ;
    nor02ii ix2955 (.Y (nx2954), .A0 (nx2948), .A1 (nx2097)) ;
    mux21 ix2092 (.Y (nx2091), .A0 (nx2964), .A1 (nx2970), .S0 (nx3857)) ;
    mux21 ix3001 (.Y (nx3000), .A0 (nx2109), .A1 (nx2107), .S0 (nx3857)) ;
    mux21 ix2114 (.Y (nx2113), .A0 (nx3016), .A1 (nx3022), .S0 (nx3857)) ;
    mux21 ix3053 (.Y (nx3052), .A0 (nx2125), .A1 (nx2123), .S0 (nx3857)) ;
    mux21 ix2130 (.Y (nx2129), .A0 (nx3068), .A1 (nx3074), .S0 (nx3857)) ;
    mux21 ix3105 (.Y (nx3104), .A0 (nx2141), .A1 (nx2139), .S0 (nx2852)) ;
    mux21 ix2146 (.Y (nx2145), .A0 (nx3120), .A1 (nx3126), .S0 (nx2852)) ;
    mux21 ix3157 (.Y (nx3156), .A0 (nx2157), .A1 (nx2155), .S0 (nx2852)) ;
    mux21 ix2162 (.Y (nx2161), .A0 (nx3172), .A1 (nx3178), .S0 (nx2852)) ;
    mux21 ix2188 (.Y (nx2187), .A0 (nx3184), .A1 (nx3190), .S0 (nx3855)) ;
    mux21 ix3169 (.Y (nx3168), .A0 (nx2463), .A1 (nx2461), .S0 (nx3855)) ;
    mux21 ix2470 (.Y (nx2469), .A0 (nx3132), .A1 (nx3138), .S0 (nx3855)) ;
    mux21 ix3117 (.Y (nx3116), .A0 (nx2483), .A1 (nx2481), .S0 (nx3855)) ;
    mux21 ix2490 (.Y (nx2489), .A0 (nx3080), .A1 (nx3086), .S0 (nx3855)) ;
    mux21 ix3065 (.Y (nx3064), .A0 (nx2505), .A1 (nx2503), .S0 (nx3855)) ;
    mux21 ix2512 (.Y (nx2511), .A0 (nx3028), .A1 (nx3034), .S0 (nx2230)) ;
    mux21 ix3013 (.Y (nx3012), .A0 (nx2527), .A1 (nx2525), .S0 (nx2230)) ;
    mux21 ix2534 (.Y (nx2533), .A0 (nx2976), .A1 (nx2982), .S0 (nx2230)) ;
    nor02ii ix2333 (.Y (nx2332), .A0 (nx2326), .A1 (nx2211)) ;
    nor02ii ix761 (.Y (nx760), .A0 (nx754), .A1 (nx3161)) ;
    nor02ii ix1383 (.Y (nx1382), .A0 (nx1376), .A1 (nx3173)) ;
    mux21 ix3156 (.Y (nx3155), .A0 (nx1392), .A1 (nx1398), .S0 (nx3851)) ;
    mux21 ix3168 (.Y (nx3167), .A0 (nx1404), .A1 (nx1410), .S0 (nx3853)) ;
    mux21 ix735 (.Y (nx734), .A0 (nx3189), .A1 (nx3187), .S0 (nx3851)) ;
    mux21 ix3194 (.Y (nx3193), .A0 (nx1432), .A1 (nx1438), .S0 (nx3851)) ;
    mux21 ix1469 (.Y (nx1468), .A0 (nx3205), .A1 (nx3203), .S0 (nx3851)) ;
    mux21 ix3210 (.Y (nx3209), .A0 (nx1484), .A1 (nx1490), .S0 (nx3851)) ;
    mux21 ix1521 (.Y (nx1520), .A0 (nx3221), .A1 (nx3219), .S0 (nx3851)) ;
    mux21 ix3226 (.Y (nx3225), .A0 (nx1536), .A1 (nx1542), .S0 (nx646)) ;
    mux21 ix1573 (.Y (nx1572), .A0 (nx3237), .A1 (nx3235), .S0 (nx646)) ;
    mux21 ix3242 (.Y (nx3241), .A0 (nx1588), .A1 (nx1594), .S0 (nx646)) ;
    mux21 ix3256 (.Y (nx3255), .A0 (nx1600), .A1 (nx1606), .S0 (nx3853)) ;
    mux21 ix1585 (.Y (nx1584), .A0 (nx3267), .A1 (nx3265), .S0 (nx3853)) ;
    mux21 ix3272 (.Y (nx3271), .A0 (nx1548), .A1 (nx1554), .S0 (nx3853)) ;
    mux21 ix1533 (.Y (nx1532), .A0 (nx3283), .A1 (nx3281), .S0 (nx3853)) ;
    mux21 ix3288 (.Y (nx3287), .A0 (nx1496), .A1 (nx1502), .S0 (nx1280)) ;
    mux21 ix1481 (.Y (nx1480), .A0 (nx3299), .A1 (nx3297), .S0 (nx1280)) ;
    mux21 ix3304 (.Y (nx3303), .A0 (nx1444), .A1 (nx1450), .S0 (nx1280)) ;
    mux21 ix1429 (.Y (nx1428), .A0 (nx3313), .A1 (nx3311), .S0 (nx1280)) ;
    mux21 ix3481 (.Y (nx3480), .A0 (nx2171), .A1 (nx3351), .S0 (nx3867)) ;
    mux21 ix3463 (.Y (nx3462), .A0 (nx2187), .A1 (nx2161), .S0 (nx3867)) ;
    mux21 ix3364 (.Y (nx3363), .A0 (nx3168), .A1 (nx3156), .S0 (nx3867)) ;
    mux21 ix3427 (.Y (nx3426), .A0 (nx2469), .A1 (nx2145), .S0 (nx3867)) ;
    mux21 ix3372 (.Y (nx3371), .A0 (nx3116), .A1 (nx3104), .S0 (nx3867)) ;
    mux21 ix3391 (.Y (nx3390), .A0 (nx2489), .A1 (nx2129), .S0 (nx3869)) ;
    mux21 ix3380 (.Y (nx3379), .A0 (nx3064), .A1 (nx3052), .S0 (nx3869)) ;
    mux21 ix3355 (.Y (nx3354), .A0 (nx2511), .A1 (nx2113), .S0 (nx3869)) ;
    mux21 ix3388 (.Y (nx3387), .A0 (nx3012), .A1 (nx3000), .S0 (nx3869)) ;
    mux21 ix3319 (.Y (nx3318), .A0 (nx2533), .A1 (nx2091), .S0 (nx3869)) ;
    ao22 ix3917 (.Y (nx3916), .A0 (nx2230), .A1 (nx3588), .B0 (nx646), .B1 (
         nx3580)) ;
    nor02 ix3406 (.Y (nx3588), .A0 (nx3869), .A1 (nx3564)) ;
    mux21_ni ix3827 (.Y (nx3826), .A0 (nx3310), .A1 (nx3318), .S0 (nx3859)) ;
    nor02ii ix3581 (.Y (nx3580), .A0 (nx3839), .A1 (nx3564)) ;
    mux21 ix3502 (.Y (nx3501), .A0 (nx3472), .A1 (nx3480), .S0 (nx3859)) ;
    mux21 ix3530 (.Y (nx3529), .A0 (nx3454), .A1 (nx3462), .S0 (nx3859)) ;
    mux21 ix3687 (.Y (nx3686), .A0 (nx3343), .A1 (nx3363), .S0 (nx3859)) ;
    mux21 ix3562 (.Y (nx3561), .A0 (nx3418), .A1 (nx3426), .S0 (nx3861)) ;
    mux21 ix3631 (.Y (nx3630), .A0 (nx3337), .A1 (nx3371), .S0 (nx3861)) ;
    mux21 ix3592 (.Y (nx3591), .A0 (nx3382), .A1 (nx3390), .S0 (nx3861)) ;
    mux21 ix3773 (.Y (nx3772), .A0 (nx3329), .A1 (nx3379), .S0 (nx3861)) ;
    ao22 ix3839 (.Y (nx3838), .A0 (nx2954), .A1 (nx3588), .B0 (nx1382), .B1 (
         nx3580)) ;
    mux21 ix3632 (.Y (nx3631), .A0 (nx3346), .A1 (nx3354), .S0 (nx3861)) ;
    mux21 ix3875 (.Y (nx3874), .A0 (nx3321), .A1 (nx3387), .S0 (nx3861)) ;
    nor02ii ix3923 (.Y (DIRECTION[1]), .A0 (nx3401), .A1 (EDGE)) ;
    nor02ii ix127 (.Y (nx126), .A0 (nx3785), .A1 (timer_finished)) ;
    nor02ii ix3722 (.Y (nx3721), .A0 (nx1679), .A1 (nx3771)) ;
    and04 ix3726 (.Y (nx3725), .A0 (nx3849), .A1 (nx3739), .A2 (nx3747), .A3 (
          nx3757)) ;
    inv01 ix3848 (.Y (nx3849), .A (timed_signal_inst_time_remaining_0)) ;
    xor2 ix1694 (.Y (nx1693), .A0 (timed_signal_inst_time_remaining_0), .A1 (
         nx3863)) ;
    mux21 ix1704 (.Y (nx1703), .A0 (nx3739), .A1 (nx3735), .S0 (nx3863)) ;
    nor02ii ix3738 (.Y (nx3737), .A0 (timed_signal_inst_time_remaining_0), .A1 (
            nx3739)) ;
    mux21 ix1714 (.Y (nx1713), .A0 (nx3747), .A1 (nx3745), .S0 (nx3863)) ;
    xor2 ix3746 (.Y (nx3745), .A0 (nx3747), .A1 (nx3737)) ;
    mux21 ix1724 (.Y (nx1723), .A0 (nx3757), .A1 (nx3753), .S0 (nx3863)) ;
    xor2 ix3754 (.Y (nx3753), .A0 (nx3757), .A1 (nx3755)) ;
    mux21 ix1734 (.Y (nx1733), .A0 (nx3759), .A1 (nx3763), .S0 (nx3863)) ;
    xor2 ix3764 (.Y (nx3763), .A0 (nx3759), .A1 (nx3725)) ;
    mux21 ix1744 (.Y (nx1743), .A0 (nx3771), .A1 (nx3769), .S0 (nx3865)) ;
    mux21 ix1754 (.Y (nx1753), .A0 (nx3773), .A1 (nx3777), .S0 (nx3865)) ;
    xor2 ix3778 (.Y (nx3777), .A0 (nx3773), .A1 (nx3721)) ;
    and02 ix3805 (.Y (nx3806), .A0 (nx3813), .A1 (nx3401)) ;
    inv01 ix3850 (.Y (nx3851), .A (nx3161)) ;
    inv01 ix3852 (.Y (nx3853), .A (nx3173)) ;
    inv01 ix3854 (.Y (nx3855), .A (nx2211)) ;
    inv01 ix3856 (.Y (nx3857), .A (nx2097)) ;
    inv01 ix3858 (.Y (nx3859), .A (nx3564)) ;
    inv01 ix3860 (.Y (nx3861), .A (nx3564)) ;
    inv01 ix3862 (.Y (nx3863), .A (nx3810)) ;
    inv01 ix3864 (.Y (nx3865), .A (nx3810)) ;
    inv01 ix3866 (.Y (nx3867), .A (nx2053)) ;
    inv01 ix3868 (.Y (nx3869), .A (nx2053)) ;
endmodule

