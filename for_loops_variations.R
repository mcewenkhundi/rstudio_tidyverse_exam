df <- mtcars
output <- vector("double", ncol(df))  # 1. output
for (i in seq_along(df)) {            # 2. sequence
  output[[i]] <- median(df[[i]])      # 3. body
}
output

y <- vector("double", 0)
seq_along(y)

1:length(y)

#Different variations of the for loop
#so when the ouput is already known
df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)
rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}

df$a <- rescale01(df$a)
df$b <- rescale01(df$b)
df$c <- rescale01(df$c)
df$d <- rescale01(df$d)

for (i in seq_along(df)) {
  df[[i]] <- rescale01(df[[i]])
}


for (i in seq_along(df)) {
  name <- names(df)[[i]]
  
  value <- df[[i]]
  
  print(name)
  print(value)
}

#For loops for unknow output length
means <- c(0, 1, 2)

output <- double()
for (i in seq_along(means)) {
  n <- sample(100, 1)
  output <- c(output, rnorm(n, means[[i]]))
}

str(output)
#>  num [1:138] 0.912 0.205 2.584 -0.789 0.588 ...

out <- vector("list", length(means))
for (i in seq_along(means)) {
  n <- sample(100, 1)
  out[[i]] <- rnorm(n, means[[i]])
}
str(out)
#> List of 3
#>  $ : num [1:76] -0.3389 -0.0756 0.0402 0.1243 -0.9984 ...
#>  $ : num [1:17] -0.11 1.149 0.614 0.77 1.392 ...
#>  $ : num [1:41] 1.88 2.46 2.62 1.82 1.88 ...
str(unlist(out))
#>  num [1:134] -0.3389 -0.0756 0.0402 0.1243 -0.9984 ...








































