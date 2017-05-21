# methAutoCorr
DNA methylation autocorrelation with distance threshold

- Install zoo in R: install.packages("zoo")
- Load my script: source("methAutoCorr.R") -> use the absolute path or put the file in your working folder.
- Use methAutoCorr functions. It takes: input file, distance threshold (recommended: from 30 to 300), minimum lag (recommended: 1), maximum lag (recommended: the same value than in distance threshold).

The input file must have three columns:
1. Chromosome or sequence name.
2. Start position of the CpG.
3. Methylation ratio of the CpG.
Every row represents a CpG.

The function returns the autocorrelation for each lag. Among the lags with positive autocorrelation, the one with the highest autocorrelation is the optimum size for the smoothing window.
