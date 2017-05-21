methAutoCorr <- function(file, maxDist, minLag, maxLag) {
	require(zoo)
	data <- read.table(file)
	chrom <- data$V1
	pos <- data$V2
	meth <- data$V3
	b = 1
	e = length(meth)
	ts <- as.zoo(meth)
	LAG <- c()
	AC <- c()
	for (n in seq(minLag, maxLag)) {
		ts_n <- lag(ts, k = -n, na.pad = T)
		for (p in seq(b, e - n)) {
			if (chrom[p] != chrom[p + n]) {
				ts_n[p + n] <- NA
			}
			if (pos[p + n] - pos[p] > maxDist) {
				ts_n[p + n] <- NA
			}
		}
		c <- cor(ts[!is.na(ts_n)], ts_n[!is.na(ts_n)])
		LAG <- append(LAG, n)
		AC <- append(AC, c)
		print(sprintf('lag %i: %f', n, c))
	}
	df <- data.frame(LAG, AC)
	return(df)
}
