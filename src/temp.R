install.packages('usethis')
library('usethis')
usethis::use_github_actions()


## generate data to make/save plot (as a .png file)
x <- rnorm(300)
y <- x + rnorm(300, 0, .75)
col <- c(rep("#002244aa", 50), rep("#440000aa", 50))
bg <- c(rep("#6699ffaa", 50), rep("#dd6666aa", 50))

## crate temporary file name
tmp <- tempfile(fileext = ".png")

## save as png
png(tmp, 6, 6, "in", res = 127.5)
par(tcl = -.15, family = "Inconsolata",
    font.main = 2, bty = "n", xaxt = "l", yaxt = "l",
    bg = "#f0f0f0", mar = c(3, 3, 2, 1.5))
plot(x, y, xlab = NULL, ylab = NULL, pch = 21, cex = 1,
     bg = bg, col = col,
     main = "This image was uploaded by rtweet")
grid(8, lwd = .15, lty = 2, col = "#00000088")
dev.off()
