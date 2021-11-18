# NihAV Benchmark

Hello, this is a meta repository for testing the VP6 encoder part of https://nihav.org/
Since the encoding speed has room for improvement i did some optimizations that are available as patches.

## Current state

Time to encode a 720p 1:00 video (Sintel 1:30-2:30) on a AMD Ryzen 5 3500U (compiled with SSE4.2 & AVX)

| Before    | After     |
| --------- | --------- |
| 3m10,095s | 2m26,709s |

## Improvements
- Use `chunks_exact_mut` over `chunks_mut`
- generic templated functions
- assert!() when applicable

## Already improved functions
- mc_bilinear
- vp_fdct & vp_idct

## Needs to be done
- vp31_loop_filter
