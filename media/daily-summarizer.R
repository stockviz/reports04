library('rmarkdown')

args <- commandArgs(trailingOnly = TRUE)
if(!is.na(args[1])) {
    asof <- as.Date(args[1])
} else {
    asof <- Sys.Date()
}

print(asof)

tryCatch({
	render("daily-summarizer.Rmd", 
				output_file="daily/media-digest.html", 
				params=list(asof = asof))
}, error=function(e){print(e)})


tryCatch({
	render("daily-summarizer.Rmd", 
				output_file=paste0("daily/", asof, ".html"), 
				params=list(asof = asof))
}, error=function(e){print(e)})


